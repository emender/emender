-- Common file I/O operations used elsewhere in the Emender.
-- Copyright (C) 2014 Pavel Tisnovsky

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



--
-- Writes a string into the text file.
--
-- Returns true if everything is ok, nil instead.
-- (nil is evaluated as a false value in most cases)
--
function spit(fileName, content)
    local fout = io.open(fileName, "w")

    -- if file could be opened for writing into it
    if fout then
        fout:write(content)

        -- check if file could be closed
        if not fout:close() then
            return nil
        end

        -- open & write & close seems to be ok
        return true
    end
    -- file can't be opened
    return nil
end



--
-- Writes table of strings into the text file.
--
-- Returns true if everything is ok, nil instead.
-- (nil is evaluated as a false value in most cases)
--
function spitTable(fileName, content)
    local fout = io.open(fileName, "w")

    -- if file could be opened for writing into it
    if fout then
        for _, line in ipairs(content) do
            fout:write(line)
            fout:write("\n")
        end

        -- check if file could be closed
        if not fout:close() then
            return nil
        end

        -- open & write & close seems to be ok
        return true
    end
    -- file can't be opened
    return nil
end



--
-- Reads whole (presumably text) file into the string.
--
-- Returns string read from the file, or nil in case of any I/O error.
-- (nil is evaluated as a false value in most cases)
--
function slurp(fileName)
    local fin = io.open(fileName, "r")
    local content = fin:read("*all")

    -- check if file could be closed
    if not fin:close() then
        return nil
    end

    return content
end



--
-- Reads whole (presumably text) file into the table where
-- each item represents one line in the file that was read.
--
-- Returns table of strings read from the file, or nil
-- in case of any I/O error.
-- (nil is evaluated as a false value in most cases)
--
function slurpTable(fileName)
    local content = {}
    local fin = io.open(fileName, "r")

    -- open failure
    if not fin then
        return nil
    end

    -- read the file content line-by-line
    -- and store it in the table
    for line in fin:lines() do
        table.insert(content, line);
    end

    -- check if file could be closed
    if not fin:close() then
        return nil
    end

    return content
end

