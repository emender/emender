-- path.lua - a module for file, directory, and path manipulation
-- Copyright (C) 2015 Jaromir Hradilek

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

-- Export the module:
return path
