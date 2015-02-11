-- path.lua - a module for file, directory, and path manipulation
-- Copyright (C) 2015 Pavel Tisnovsky, Jaromir Hradilek

-- This file is part of Emender.

-- This program is free software:  you can redistribute it and/or modify it
-- under the terms of  the  GNU General Public License  as published by the
-- Free Software Foundation, version 3 of the License.
--
-- This program  is  distributed  in the hope  that it will be useful,  but
-- WITHOUT  ANY WARRANTY;  without  even the implied warranty of MERCHANTA-
-- BILITY or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
-- License for more details.
--
-- You should have received a copy of the GNU General Public License  along
-- with this program. If not, see <http://www.gnu.org/licenses/>.

-- Define the module:
local path = {}

--
-- Take a sequence of directories optionally followed by a file name and
-- compose a complete path. The function accepts an arbitrary number of
-- arguments and returns either a string, or nil in case of a failure.
--
-- @param  filename  A directory or file name
-- @return a string or nil
function path.compose(...)
    local arg = {...}
    local result = ""

    -- Process each argument individually:
    for _, argument in ipairs(arg) do
        -- Verify that the argument is a string:
        if type(argument) ~= "string" then return nil end

        -- Remove leading and trailing white space characters:
        local item = argument:match("^%s*(.*%S)") or ""

        -- Remove superfluous / characters:
        item = item:match(".*[^/]") or item

        -- Compose the result:
        if result == "" or result:find("/$") then
            result = result .. item
        else
            result = result .. "/" .. item
        end
    end

    -- Return the result:
    if result ~= "" then
        return result
    else
        return nil
    end
end

--
-- Determine whether a selected directory exists.
--
-- @param  directory A directory name
-- @return true if the directory exists, false otherwise
--
function path.directory_exists(directory)
    -- If no directory is specified, silently return false:
    if not directory then
        return false
    end

    -- Define the shell command to check if the argument is a directory:
    local command = "test -d " .. directory .. "; echo $?"
    local process = io.popen(command)

    -- Return values:
    --     0 - test ok
    --     1 - test failed
    local result = process:read()

    -- Wait for the process to exit:
    process:close()

    -- Return the result:
    return result == "0"
end

--
-- Determine whether a selected file exists.
--
-- @param  directory A directory or file name
-- @return true if the file exists, false otherwise
--
function path.file_exists(filename)
    -- If no file name is specified, silently return false:
    if not filename then
        return nil
    end

    -- Try to open the file for reading:
    local fin = io.open(filename, "r")

    -- Check if it is possible to open the file for reading:
    if not fin then
        return nil
    end

    -- Check if file could be closed:
    if not fin:close() then
        print("D")
        return nil
    end

    -- File seems to be readable:
    return true
end

-- Export the module:
return path
