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
-- @param fileName Name of file that will be created
-- @param content  Content to be written to a new file
--
function spit(fileName, content)
    local fout = io.open(fileName, "w")

    -- if file could be opened for writing into it
    if fout then
        local result = fout:write(content)

        -- in Lua 5.2 it is possible to check if write() was successful
        if not result then
            -- try to close the file
            fout:close()
            return nil
        end

        -- check if file could be closed
        if not fout:close() then
            return nil
        end

        -- open & write & close seems to be ok
        return true
    end
    -- file can't be opened
    -- -> return nil so this exception could be checked later
    return nil
end



--
-- Writes table of strings into the text file.
--
-- Returns true if everything is ok, nil instead.
-- (nil is evaluated as a false value in most cases)
--
-- @param fileName Name of file that will be created
-- @param content  Content to be written to a new file
--
function spitTable(fileName, content)
    local fout = io.open(fileName, "w")

    -- if file could be opened for writing into it
    if fout then
        for _, line in ipairs(content) do
            local result
            result = fout:write(line)

            -- in Lua 5.2 it is possible to check if write() was successful
            if not result then
                -- try to close the file
                fout:close()
                return nil
            end

            result = fout:write("\n")
            -- in Lua 5.2 it is possible to check if write() was successful
            if not result then
                -- try to close the file
                fout:close()
                return nil
            end
        end

        -- check if file could be closed
        if not fout:close() then
            return nil
        end

        -- open & write & close seems to be ok
        return true
    end
    -- file can't be opened
    -- -> return nil so this exception could be checked later
    return nil
end



--
-- Reads whole (presumably text) file into the string.
--
-- Returns string read from the file, or nil in case of any I/O error.
-- (nil is evaluated as a false value in most cases)
--
-- @param fileName Name of file that will be read
--
function slurp(fileName)
    local fin = io.open(fileName, "r")

    -- check if it's possible to open the file for reading
    if not fin then
        return nil
    end

    -- try to read the whole file
    local content = fin:read("*all")

    -- check if file could be closed
    if not fin:close() then
        return nil
    end

    -- return content read from the input file
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
-- @param fileName Name of file that will be read
--
function slurpTable(fileName)
    local content = {}

    local fin = io.open(fileName, "r")

    -- check if it's possible to open the file for reading
    if not fin then
        return nil
    end

    -- read the file content line-by-line
    -- and store it in the table
    for line in fin:lines() do
        table.insert(content, line);
    end

    -- check if file could be properly closed
    if not fin:close() then
        return nil
    end

    -- return content read from the input file
    return content
end

