-- Tools checker module.
-- Copyright (C) 2014 Pavel Tisnovsky

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

local toolsChecker = {
    requiredTools = {"curl", "wget", "xmllint"}
}

--
-- Check if given command exists (and could be started)
--
function commandExists(command)
    local process = io.popen(command .. " 2> /dev/null")
    local exitValue, signal, code = process:close()
    -- TODO: is this code always stable?
    return code ~= 127
end

function commandCheckMessage(command, result)
    print("Checking existence of command '" ..  command .. "': " .. result)
end

--
-- Perform check if all required commands are installed.
--
function toolsChecker.performCheck()
    for i, command in ipairs(toolsChecker.requiredTools) do
        local exists = commandExists(command)
        if not exists then
            commandCheckMessage(command, "error")
            print("Failure, this tool can't be started properly.")
            os.exit(1)
        else
            commandCheckMessage(command, "OK")
        end
    end
end

return toolsChecker

