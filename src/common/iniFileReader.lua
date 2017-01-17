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



return iniFileReader

