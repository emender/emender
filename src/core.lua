--
-- This file is part of Emender.
--
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

local core = {
}

function core.isVerboseOptionUsed(options)
    return options["v"] or options["verbose"]
end

function core.isDryRunOptionUsed(options)
    return options["d"] or options["dry-run"]
end

function core.isHelpOptionUsed(options)
    return options["h"] or options["help"]
end

function core.isVersionOptionUsed(options)
    return options["V"] or options["version"]
end

function core.isLicenseOptionUsed(options)
    return options["L"] or options["license"]
end

function core.isVerborsOptionUsed(options)
    return options["v"] or options["verbose"]
end

function core.showVersion()
    print("Emender version 0.0.1")
end

function core.updateTestName(filename)
    if filename:endsWith(".lua") then
        local extensionIndex = filename:find(".lua", 1, true)
        if extensionIndex then
            return filename:substring(1, extensionIndex - 1)
        else
            return nil
        end
    else
        return nil
    end
end

function core.printDetailedTestInfo(test)
    local metadata = test["metadata"]
    if not metadata then
        print("Test " .. test .. " does not contain metadata, needs to be fixed!")
    end
    local description = metadata["description"]
    print(description)
    local author = metadata["author"]
    print(author)
end

function core.printTestInfo(scriptDirectory, filename, verboseOperation)
    local testName = core.updateTestName(filename)
    if testName then
        if _G[testName] then
            print("Warning: test " .. testName .. " might overwrite core functionality!")
            print("You'd need to rename it")
        end
        dofile(scriptDirectory .. "tests/" .. filename)
        -- if test is properly loaded
        local test = _G[testName]
        if test then
            print("Test: " .. testName)
            if verboseOperation then
                core.printDetailedTestInfo(test)
            end
        end
    end
end

function core.performDryRun(verboseOperation)
    local scriptDirectory = getScriptDirectory()
    local command = 'ls -1 '.. scriptDirectory .. "tests/*.lua"..'| xargs -n 1 basename'
    for filename in io.popen(command):lines() do
        core.printTestInfo(scriptDirectory, filename, verboseOperation)
    end
end

return core

