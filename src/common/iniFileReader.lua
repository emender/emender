-- Simple reader for INI files.
--
-- Copyright (C) 2017 Pavel Tisnovsky

-- This file is part of Emender.

-- Emender is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 3 of the License.
--
-- Emender is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Emender.  If not, see <http://www.gnu.org/licenses/>.


local iniFileReader = {
}

local iniEntryName = "[%w_-]+"
local iniEntryValue = ".+"
local iniEntryPattern = "^(" .. iniEntryName .. ")%s-=%s-(" .. iniEntryValue .. ")$"



--
-- Returns true only if line contains section header enclosed in []
--
function iniFileReader.isIniSection(line)
    return line:sub(1,1) == "[" and line:sub(line:len()) == "]"
end



--
-- Returns true only if line contains one entry (key+value pair)
--
function iniFileReader.isIniEntry(line)
    return line:match(iniEntryPattern)
end



--
-- Returns section name.
--
function iniFileReader.getSectionName(line)
    return line:sub(2, line:len()-1)
end



--
-- Returns INI entry as tuple: entry name + entry value
--
function iniFileReader.getIniEntry(line)
    local entryName, entryValue = iniFileReader.isIniEntry(line)

    -- perform conversion for 'known' values
    if entryValue == "true" then
        entryValue = true
    elseif entryValue == "false" or entryValue == "nil" then
        entryValue = false
    elseif tonumber(entryValue) then
        entryValue = tonumber(entryValue)
    end

    return entryName, entryValue
end



--
-- Read and parse the whole INI file
--
function iniFileReader.readIni(filename)
    local parsedIni = {}
    local currentSection = nil

    if not path.file_exists(filename) then
        return parsedIni
    end

    for line in io.lines(filename) do
        if iniFileReader.isIniSection(line) then
            currentSection = iniFileReader.getSectionName(line)
            parsedIni[currentSection] = {}
        elseif iniFileReader.isIniEntry(line) then
            local entryName, entryValue = iniFileReader.getIniEntry(line)
            parsedIni[currentSection][entryName] = entryValue
        end
    end

    return parsedIni
end



-- How to use this module:
--local t = readIni("config.ini")
--
--for sectionName, sectionEntries in pairs(t) do
--   print(sectionName)
--   for entryName, entryValue in pairs(sectionEntries) do
--       print("    ", entryName, entryValue)
--   end
--end

return iniFileReader

