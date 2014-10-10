-- Module with implementation of Emender core functionality.
-- Copyright (C) 2014 Pavel Tisnovsky
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
    writer = nil,
    messages = {},
    results = {}
}



--
-- Update filename containing the test to the proper test name.
--
function core.updateTestSuiteName(filename)
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



--
-- Print test metadata.
--
function core.printTestMetadata(metadata)
    local description = metadata["description"]
    print("    Description: " .. description)
    local authors = metadata["authors"]
    print("    Authors:     " .. authors)
    local emails = metadata["emails"]
    print("    Emails:      " .. emails)
    local changed = metadata["changed"]
    print("    Changed:     " .. changed)
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



function core.printTestTags(tags)
    print("    Tags bound to the test:")
    if not tags then
        print("        none")
    else
        for _, tag in ipairs(tags) do
            print("        " .. tag)
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

    local tags = metadata["tags"]
    core.printTestTags(tags)

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
    local testName = core.updateTestSuiteName(filename)
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
        else
            print("Test '" .. testName .. "' can't be loaded or there's name mismatch")
            print("(test name is different from the name of test file).")
            print("Please check the content of file " .. filename)
        end
    end
end


local currentTestFailure


function registerPassMessage(message)
    table.insert(core.messages, {"PASS", message})
end

function registerFailMessage(message)
    table.insert(core.messages, {"FAIL", message})
end

function registerInfoMessage(message)
    table.insert(core.messages, {"INFO", message})
end

--
--
--
function markTestFailure()
    currentTestFailure = true 
end


--
-- Dump all test results (very useful for debug purposes).
--
function dumpTestResults()
    print("OK: " .. core.results.passedTests)
    print("Failed: " .. core.results.failedTests)
    for i,test in ipairs(core.results.suites) do
        print(i, test.name)
        local methods = test.methods
        for j,method in ipairs(methods) do
            print("", j, method.name)
            for _,message in ipairs(method.messages) do
                print("", "", "", message[1], message[2])
            end
            print("", "", method.result)
        end
        print("", "PASS ", test.passCnt)
        print("", "FAIL ", test.failCnt)
        print("", "TOTAL", test.total)
        print()
    end
end

function fillInTestMetadata(testSuite, testSuiteName)
    local test = _G[testSuiteName]
    if not test then
        return
    end
    local metadata = test["metadata"]
    if metadata then
        testSuite.description = metadata["description"] or "not set"
        testSuite.authors = metadata["authors"] or "not set"
        testSuite.emails = metadata["emails"] or "not set"
        testSuite.modified = metadata["changed"] or "not set"
        testSuite.tags = metadata["tags"] or "not set"
    else
        testSuite.description = "not set"
        testSuite.authors = "not set"
        testSuite.emails = "not set"
        testSuite.modified = "not set"
        testSuite.tags = "not set"
    end
end

function filterMessages(messages, filter)
    local cnt = 0
    for _, message in ipairs(messages) do
        if message[1] == filter then
            cnt = cnt + 1
        end
    end
    return cnt
end

--
--
--
function core.runTest(scriptDirectory, filename, verboseOperation)
    local testSuiteName = core.updateTestSuiteName(filename)
    if testSuiteName then
        local testSuite = {}
        testSuite.name = testSuiteName
        core.checkTestNameShadowing(testSuiteName)

        if scriptDirectory then
            if verboseOperation then
                print("Script directory/filename: " .. scriptDirectory .. "test/" .. filename)
                print("Test name: " ..testSuiteName)
            end
            dofile(scriptDirectory .. "test/" .. filename)
        else
            if verboseOperation then
                print("Script filename: " .. scriptDirectory .. "test/" .. filename)
                print("Test name: " ..testSuiteName)
            end
            dofile(filename)
        end

        fillInTestMetadata(testSuite, testSuiteName)

        local setupFunction = core.getSetupFunction(testSuiteName)
        local tearDownFunction = core.getTearDownFunction(testSuiteName)
        local testFunctionNames = core.getListOfTestFunctionNames(testSuiteName)

        if testFunctionNames or setupFunction or tearDownFunction then
            print(testSuiteName)
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
            local passCnt = 0
            local failCnt = 0
            local errorCnt = 0
            local methods = {}
            for i,testFunctionName in ipairs(testFunctionNames) do
                local method = {}
                method.name = testFunctionName

                core.messages = {}
                method.result = nil

                print("  " .. testFunctionName .. "\n")

                currentTestFailure = false
                local testFunction = _G[testSuiteName][testFunctionName]
                local status, message = pcall(testFunction)
                if status and not currentTestFailure then
                    if verboseOperation then
                        print("        OK")
                    end
                    passCnt = passCnt + 1
                    method.result = "OK"
                else
                    if message then
                        print("       " .. message)
                        table.insert(core.messages, {"ERROR", message})
                        errorCnt = errorCnt + 1
                        method.result = "ERROR"
                    else
                        failCnt = failCnt + 1
                        method.result = "FAIL"
                    end
                end
                print()
                method.messages = table.copy(core.messages)
                method.pass = filterMessages(method.messages, "PASS")
                method.fail = filterMessages(method.messages, "FAIL")
                method.info = filterMessages(method.messages, "INFO")
                method.errors = filterMessages(method.messages, "ERROR")
                table.insert(methods, method)
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
            print("    Passed: " .. passCnt)
            print("    Failed: " .. failCnt)
            print("    Errors: " .. errorCnt)
            print("    Total:  " .. (passCnt+failCnt+errorCnt))
            print()
            testSuite.passCount  = passCnt
            testSuite.failCount  = failCnt
            testSuite.errorCount = errorCnt
            testSuite.total   = passCnt + failCnt + errorCnt
            testSuite.methods = methods
            table.insert(core.results.suites, testSuite)
            return failCnt == 0 and errorCnt == 0
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
    --local scriptDirectory = getScriptDirectory()
    local currentDirectory = getCurrentDirectory()
    local command = 'ls -1 '.. currentDirectory .. "test/*.lua"..'| xargs -n 1 basename'
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


function openOutputFiles(outputFiles)
    for fileName, outputFile in pairs(outputFiles) do
        local fout = io.open(fileName, "w")
        if fout then
            outputFile[2] = fout
        else
            print("Error: can not open file '" .. fileName .. "' for writing.")
            os.exit(2)
        end
    end
end

function closeOutputFiles(outputFiles)
    for _, outputFile in pairs(outputFiles) do
        local fout = outputFile[2]
        fout:close()
    end
end



--
-- Export results into all selected output files.
--
function exportResults(outputFiles)
    local results = core.results
    openOutputFiles(outputFiles)
    core.writer.outputFileStructs = outputFiles
    core.writer.writeHeader(results)

    for i,testSuite in ipairs(results.suites) do
        local testName = testSuite.name
        local testCases = testSuite.methods
        core.writer.writeSuiteStart(testSuite)

        for j,testCase in ipairs(testCases) do
            core.writer.writeCaseStart(testCase)
            for _,message in ipairs(testCase.messages) do
                local status = message[1]
                local messageText = message[2]
                if status == "PASS" then
                    core.writer.writeTestPass(testName, message)
                elseif status == "FAIL" then
                    core.writer.writeTestFail(testName, message)
                elseif status == "INFO" then
                    core.writer.writeTestInfo(testName, message)
                elseif status == "ERROR" then
                    if messageText then
                        core.writer.writeTestError(testName, message)
                    end
                end
            end
            core.writer.writeCaseEnd(testCase)
        end
        core.writer.writeSuiteEnd(testSuite)
    end
    core.writer.writeFooter(results)

    closeOutputFiles(outputFiles)
end

--
--
--
function core.runTests(verboseOperation, colorOutput, testsToRun, outputFiles)
    core.results.passedTests = 0
    core.results.failedTests = 0
    core.results.suites = {}

    if testsToRun and #testsToRun > 0 then
        for i, filename in ipairs(testsToRun) do
            local result = core.runTest(nil, filename, verboseOperation)
            if result ~= nil then
                if result then
                    core.results.passedTests = core.results.passedTests + 1
                else
                    core.results.failedTests = core.results.failedTests + 1
                end
            end
        end
    else
        --local scriptDirectory = getScriptDirectory()
        local currentDirectory = getCurrentDirectory()
        local testList = getTestList()
        for i, filename in ipairs(testList) do
            local result = core.runTest(currentDirectory, filename, verboseOperation)
            if result ~= nil then
                if result then
                    core.results.passedTests = core.results.passedTests + 1
                else
                    core.results.failedTests = core.results.failedTests + 1
                end
            end
        end
    end

    --dumpTestResults()
    exportResults(outputFiles)
end

return core

