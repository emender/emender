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
    asserts = nil,
    okTests = 0,
    failedTests = 0
}



--
--
--
function core.isVerboseOptionUsed(options)
    return options["v"] or options["verbose"]
end



--
--
--
function core.isTestListOptionUsed(options)
    return options["l"] or options["list"]
end



--
--
--
function core.isHelpOptionUsed(options)
    return options["h"] or options["help"]
end



--
--
--
function core.isVersionOptionUsed(options)
    return options["V"] or options["version"]
end



--
--
--
function core.isLicenseOptionUsed(options)
    return options["L"] or options["license"]
end



--
--
--
function core.isColorOutputOptionUsed(options)
    return options["c"] or options["color"]
end



--
--
--
function core.isSummaryOptionUsed(options)
    return options["s"] or options["summary"]
end



--
--
--
function core.showVersion()
    print("Emender version 0.0.1")
end



--
--
--
function core.updateTestName(filename)
    if filename:endsWith(".lua") then
        -- try to find the last / in the path + filename
        -- (might be empty)
        local lastSlash = filename:find("/[^/]*$")
        local extensionIndex = filename:find(".lua", 1, true)
        -- get only text name (w/o path and w/o extension)
        if extensionIndex then
            if lastSlash then
                return filename:substring(lastSlash+1, extensionIndex - 1)
            else
                return filename:substring(1, extensionIndex - 1)
            end
        else
            return nil
        end
    else
        return nil
    end
end



--
--
--
function core.getListOfTestFunctionNames(testName)
    local testFunctionNames = {}
    local test = _G[testName]
    if test then
        for k,v in pairs(test) do
            if k and k:startsWith("test") and type(v) == "function" then
                table.insert(testFunctionNames, k)
            end
        end
        table.sort(testFunctionNames)
        return testFunctionNames
    else
        return nil
    end
end



function core.printTestMetadata(metadata)
    local description = metadata["description"]
    print("    Description: " .. description)
    local authors = metadata["authors"]
    print("    Authors: " .. authors)
end

function core.printListOfTestFunctionNames(testFunctions)
    print("    Test functions:")
    for i, testFunction in ipairs(testFunctions) do
        print("        " .. testFunction)
    end
end

function core.printTestRequiredTool(requiresAttribute)
    print("    Required external tools:")
    if not requiresAttribute then
        print("        none")
    else
        for i, requires in ipairs(requiresAttribute) do
            print("        " .. requires)
        end
    end
end

--
--
--
function core.printDetailedTestInfo(test, testName)
    local metadata = test["metadata"]
    if not metadata then
        print("Test " .. test .. " does not contain metadata, needs to be fixed!")
    end
    core.printTestMetadata(metadata)

    local requiresAttribute = test["requires"]
    core.printTestRequiredTool(requiresAttribute)

    local testFunctions = core.getListOfTestFunctionNames(testName)
    core.printListOfTestFunctionNames(testFunctions)
end



--
--
--
function core.checkTestNameShadowing(testName)
    if _G[testName] then
        print("Warning: test " .. testName .. " might overwrite (shadow) core functionality!")
        print("You'd need to rename it")
    end
end



--
--
--
function core.printTestInfo(scriptDirectory, filename, verboseOperation)
    local testName = core.updateTestName(filename)
    if testName then
        core.checkTestNameShadowing(testName)
        dofile(scriptDirectory .. "tests/" .. filename)
        -- if test is properly loaded
        local test = _G[testName]
        if test then
            print("Test: " .. testName)
            if verboseOperation then
                core.printDetailedTestInfo(test, testName)
            end
        end
    end
end



--
--
--
function core.runTest(scriptDirectory, filename, verboseOperation)
    local testName = core.updateTestName(filename)
    if testName then
        core.checkTestNameShadowing(testName)
        if scriptDirectory then
            --print(scriptDirectory .. "test/" .. filename)
            --print(testName)
            dofile(scriptDirectory .. "tests/" .. filename)
        else
            --print(filename)
            --print(testName)
            dofile(filename)
        end
        local testFunctionNames = core.getListOfTestFunctionNames(testName)
        if testFunctionNames then
            print("Running test: " .. testName)
            local okCnt = 0
            local errorCnt = 0
            for i,testFunctionName in ipairs(testFunctionNames) do
                print("    Running step: " .. testFunctionName)
                local testFunction = _G[testName][testFunctionName]
                local status, message = pcall(testFunction)
                if status then
                    print("        OK")
                    okCnt = okCnt + 1
                else
                    print("       " .. message)
                    errorCnt = errorCnt + 1
                end
            end
            print("Summary: " .. (okCnt+errorCnt) .. " tests, " .. okCnt .. " passes, " .. errorCnt .. " failures")
            print("---------------------------------------")
            return errorCnt == 0
        end
    end
    return nil
end



--
-- Create a normal table so the process could exit as soon as possible.
--
function putTestListIntoTable(testList)
    local output = {}
    for test in testList do
        table.insert(output, test)
    end
    table.sort(output)
    return output
end



--
--
--
function getTestList()
    local scriptDirectory = getScriptDirectory()
    local command = 'ls -1 '.. scriptDirectory .. "tests/*.lua"..'| xargs -n 1 basename'
    local process = io.popen(command)
    local testList = process:lines()
    return putTestListIntoTable(testList)
end



--
--
--
function core.performTestList(verboseOperation)
    local scriptDirectory = getScriptDirectory()
    local testList = getTestList()
    for i, filename in ipairs(testList) do
        core.printTestInfo(scriptDirectory, filename, verboseOperation)
    end
end



--
--
--
function core.runTests(verboseOperation, colorOutput, testsToRun)
    core.okTests = 0
    core.failedTests = 0

    if testsToRun and #testsToRun > 0 then
        for i, filename in ipairs(testsToRun) do
            local result = core.runTest(nil, filename, verboseOperation)
            if result ~= nil then
                if result then
                    core.okTests = core.okTests + 1
                else
                    core.failedTests = core.failedTests + 1
                end
            end
        end
    else
        local scriptDirectory = getScriptDirectory()
        local testList = getTestList()
        for i, filename in ipairs(testList) do
            local result = core.runTest(scriptDirectory, filename, verboseOperation)
            if result ~= nil then
                if result then
                    core.okTests = core.okTests + 1
                else
                    core.failedTests = core.failedTests + 1
                end
            end
        end
    end
    print("Total tests: " .. (core.okTests + core.failedTests))
    print("Passed: " .. core.okTests)
    print("Failed: " .. core.failedTests)
end

return core

