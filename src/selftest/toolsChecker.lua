--
-- Tools checker module.
--

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

