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

    -- check if filename parameter has the proper value
    if type(filename) ~= "string" then
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


--
--- Function that creates 'dirpath' directory.
--
--  @param dirpath - path to the directory (and its parents) which should be created
--  @return true if directory is created, otherwise nil.
function path.create_dir(dirpath)
    -- If dirpath argument is nil or empty string or not string then return nil.
    if not dirpath or dirpath:match("^$") or type(dirpath) ~= "string" then
        return nil
    end

    -- If dir already exists then print information line and return true, because directory is there.
    if path.directory_exists(dirpath) then
        warn("Directory '" .. dirpath .. "' already exists.")
        return true
    end

    -- Create directories according to dirpath - no error if already exists
    local command = "mkdir -p " .. dirpath .. " 2>&1"
    local output = execCaptureOutputAsString(command)

    -- Check whether we have permission for creating dir
    if output:match("Permission denied") then
        warn("Emender does not have permissions for creating directory '" .. dirpath .. "'.")
        return nil
    end

    return true
end



--
-- Function that "removes" given directory. In fact, the directory is not
-- removed but only moved to the tempdir.  It's made this way because of
-- safety.
--
--  @param dirpath path to the directory, which should be (re)moved
--  @return true if everything is correct, otherwise nil
function path.remove_dir(dirpath)
    -- If the argument is nil or empty string or not string type then return nil.
    if not dirpath or dirpath:match("^$") or type(dirpath) ~= "string" then
        return nil
    end

    -- If directory does not exist, print the warning and return nil.
    if not path.directory_exists(dirpath) then
        print("Directory '" .. dirpath .. "' does not exist.")
        return true
    end

    -- Create temporary directory.
    local create_mktemp = "mktemp -d"
    local tmpdir_name = execCaptureOutputAsString(create_mktemp)

    -- Move directory which should be moved.
    local move_dir = "mv -v " .. dirpath ..  " " .. tmpdir_name
    execCaptureOutputAsString(move_dir)

    return true
end


-- Export the module:
return path

