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
-- Update filename containing the test to the proper test name.
--
function core.updateTestName(filename)
    -- TODO: what to do with files w/o .lua extensions? simply ignore them?
    if filename:endsWith(".lua") then
        -- try to find the last / in the path + filename
        -- (might be empty)
        local lastSlash = filename:find("/[^/]*$")
        local extensionIndex = filename:find(".lua", 1, true)
        -- get only text name (w/o path and w/o extension)
        if extensionIndex then
            -- get rid of the path
            if lastSlash then
                return filename:substring(lastSlash+1, extensionIndex - 1)
            else
                return filename:substring(1, extensionIndex - 1)
            end
        else -- extension not found (should not happen in real world)
            return nil
        end
    else
        return nil
    end
end



--
-- Ge list of references to all functions defined in given test (module);
-- names of all returned functions start with "test"
-- (functions with different names are considered as common functions
-- and are not directly called by the test harness)
--
-- If test with given name does not exists, nil is returned.
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



--
-- Get reference to a function with given name.
-- (used to get setUp() and tearDown() functions).
--
-- If function with given name does not exist, nil is returned instead.
-- If test with given name does not exists, nil is returned.
--
function core.getTestFunction(testName, functionName)
    local test = _G[testName]
    if test then
        local setupFunction = test[functionName]
        if setupFunction and type(setupFunction) == "function" then
            return setupFunction
        else
            return nil
        end
    else
        return nil
    end
end



--
-- Return reference to setUp() function if it exists.
--
-- If that function does not exist, nil is returned instead.
-- If test with given name does not exists, nil is returned.
--
function core.getSetupFunction(testName)
    return core.getTestFunction(testName, "setUp")
end



--
-- Return reference to tearDown() function if it exists.
--
-- If that function does not exist, nil is returned instead.
-- If test with given name does not exists, nil is returned.
--
function core.getTearDownFunction(testName)
    return core.getTestFunction(testName, "tearDown")
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
        dofile(scriptDirectory .. "test/" .. filename)
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


local currentTestFailure



--
--
--
function markTestFailure()
    currentTestFailure = true 
end



--
--
--
function core.runTest(scriptDirectory, filename, verboseOperation)
    local testName = core.updateTestName(filename)
    if testName then
        core.checkTestNameShadowing(testName)
        if scriptDirectory then
            if verboseOperation then
                print("Script directory/filename: " .. scriptDirectory .. "test/" .. filename)
                print("Test name: " ..testName)
            end
            dofile(scriptDirectory .. "test/" .. filename)
        else
            if verboseOperation then
                print("Script filename: " .. filename .. "test/" .. filename)
                print("Test name: " ..testName)
            end
            dofile(filename)
        end
        local setupFunction = core.getSetupFunction(testName)
        local tearDownFunction = core.getTearDownFunction(testName)
        local testFunctionNames = core.getListOfTestFunctionNames(testName)
        if testFunctionNames or setupFunction or tearDownFunction then
            print(testName)
            print()
            if setupFunction then
                if verboseOperation then
                    print("    SetUp:")
                end
                local status, message = pcall(setupFunction)
                if status then
                    if verboseOperation then
                        print("        OK\n")
                    end
                else
                    print("       " .. message)
                end
            end
            local okCnt = 0
            local errorCnt = 0
            for i,testFunctionName in ipairs(testFunctionNames) do
                print("  " .. testFunctionName .. "\n")
                currentTestFailure = false
                local testFunction = _G[testName][testFunctionName]
                local status, message = pcall(testFunction)
                if status and not currentTestFailure then
                    if verboseOperation then
                        print("        OK")
                    end
                    okCnt = okCnt + 1
                else
                    if message then
                        print("       " .. message)
                    end
                    errorCnt = errorCnt + 1
                end
                print()
            end
            if tearDownFunction then
                if verboseOperation then
                    print("    TearDown:")
                end
                local status, message = pcall(tearDownFunction)
                if status then
                    if verboseOperation then
                        print("        OK\n")
                    end
                else
                    print("       " .. message)
                end
            end
            print("  Summary:")
            print()
            print("    Total:  " .. (okCnt+errorCnt))
            print("    Passed: " .. okCnt)
            print("    Failed: " .. errorCnt)
            print()
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
    local command = 'ls -1 '.. scriptDirectory .. "test/*.lua"..'| xargs -n 1 basename'
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
    print("Overall Results")
    print()
    print("  Total:  " .. (core.okTests + core.failedTests))
    print("  Passed: " .. core.okTests)
    print("  Failed: " .. core.failedTests)
    print()
end

return core

