-- Module with implementation of Emender core functionality.
-- Copyright (C) 2014, 2015 Pavel Tisnovsky
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



--
-- Module name
--
local core = {
    asserts  = nil,
    writer   = nil,
    messages = {},
    results  = {}
}



--
-- Update filename containing the test to the proper test name.
--
function core.updateTestSuiteName(filename)
    -- TODO: what to do with files w/o .lua extensions? simply ignore them?
    if filename:endsWith(".lua") then
        -- try to find the last / character in the path + filename
        -- (might be empty)
        local lastSlash = filename:find("/[^/]*$")
        -- try to find the extension
        -- (that must exis according to previous condition)
        local extensionIndex = filename:find(".lua", 1, true)

        -- get only text name (w/o path and w/o extension)
        if extensionIndex then
            -- get rid of the path
            if lastSlash then
                return filename:substring(lastSlash+1, extensionIndex - 1)
            -- no path, just file name was entered
            else
                return filename:substring(1, extensionIndex - 1)
            end
        else -- extension not found (should not happen in real world)
            return nil
        end
    -- fallback for filenames that does not end with ".lua" postfix
    else
        return nil
    end
end



--
-- Get reference to a function with given name.
-- (used to get setUp() and tearDown() functions).
--
-- If function with given name does not exist, nil is returned instead.
-- If test with given name does not exists, nil is returned instead.
--
function core.getTestFunction(testName, functionName)
    -- get all symbol names of given module from the global table
    local test = _G[testName]

    -- if module exists
    if test then
        -- try to select function with given name
        local selectedFunction = test[functionName]

        -- if function is found, return reference to it
        if selectedFunction and type(selectedFunction) == "function" then
            return selectedFunction
        else
            -- function can't be found
            return nil
        end
    else
        -- module does not exists at all
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
-- This function is called to check if some module is not already loaded
-- and stored in the global table _G. When the module is loaded it might
-- mean that somebody simply copied test code w/o changing test (module) name.
-- (this is a common mistake for copiers&pasters :p)
--
function core.checkTestNameShadowing(testName)
    -- try to read (any) object from the global table _G.
    if _G[testName] then
        print("Warning: test " .. testName .. " might overwrite (shadow) core functionality!")
        print("You'd need to rename it")
    end
end



--
-- Print informations about selected test, this function is called
-- when -l/--list option is specified on the command line.
--
function core.printTestInfo(testDirectory, filename, verboseOperation)
    local testName = core.updateTestSuiteName(filename)
    if testName then
        core.checkTestNameShadowing(testName)
        -- try to load the script that contains selected test
        if testDirectory then
            dofile(testDirectory .. "/" .. filename)
        else
            dofile(filename)
        end
        -- if test is properly loaded
        local test = _G[testName]
        -- if the test is properly loaded, read and print informations about it
        if test then
            print("Test: " .. testName)
            if verboseOperation then
                testInfo.printDetailedTestInfo(test, testName)
            end
        -- if the test could not be loaded
        else
            print("Test '" .. testName .. "' can't be loaded or there's name mismatch")
            print("(test name is different from the name of test file).")
            print("Please check the content of file " .. filename)
        end
    end
end


local currentTestFailure



--
-- This function could be call from the test machinery
-- to register message about passing of any part of test case.
--
function registerPassMessage(message)
    table.insert(core.messages, {"PASS", message})
end



--
-- This function could be call from the test machinery
-- to register message about failing of any part of test case.
--
function registerFailMessage(message)
    table.insert(core.messages, {"FAIL", message})
end



--
-- This function could be call from the test machinery
-- to register message with information text.
--
function registerInfoMessage(message)
    table.insert(core.messages, {"INFO", message})
end



--
-- Called by the test machinery to mark the current test case failure.
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



--
-- Fill in all required information in the testSuite record from the metadata
-- read from the test script.
--
function fillInTestMetadata(testSuite, testSuiteName)
    local test = _G[testSuiteName]
    if not test then
        return
    end
    local metadata = test["metadata"]
    -- if metadata exists
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
    local requires = test["requires"]
    -- if requires field exists
    if requires then
        testSuite.requires = requires
    else
        testSuite.requires = {}
    end
end



--
-- Fill in all information about test results into testSuite data structure.
--
function fillInTestResults(testSuite, passCnt, failCnt, errorCnt, methods)
    testSuite.passCount  = passCnt
    testSuite.failCount  = failCnt
    testSuite.errorCount = errorCnt
    testSuite.total   = passCnt + failCnt + errorCnt
    testSuite.methods = methods
end



--
-- Filter test messages according to the given filter ("PASS", "FAIL" etc.).
--
function filterMessages(messages, filter)
    local cnt = 0
    -- iterate over all registered messages
    for _, message in ipairs(messages) do
        if message[1] == filter then
            cnt = cnt + 1
        end
    end
    return cnt
end



--
-- Pass all test options given on the command line to the test.
--
function addTestOptions(testSuiteName, testOptions)
    -- no test options specified? we are done then
    if not testOptions or next(testOptions) == nil then
        return
    end

    -- try to read test structure from the global table
    local test = _G[testSuiteName]
    -- no test found? error will be reported later
    if not test then
        return
    end

    -- pass test options to the test
    for name, value in pairs(testOptions) do
        test[name] = value
    end
end



--
-- Write (any) error message to the standard output.
--
function writeMessageToStdOut(message, colorOutput)
    if colorOutput then
        -- in case of color output we need to print the right
        -- terminal escape sequences to the standard output and
        -- then reset the terminal back to normal color/font style
        local colorReset = _G["logger"].codes.reset
        local colorFail = _G["logger"].codes.color_red
        print("    " .. colorFail .. message .. colorReset)
    else
        -- no color output requested? well, it's easy then
        print("    " .. message)
    end
end



--
-- Return true only if at least given tag is contained in tags specified for given test.
--
function tagsExist(testSuite, tags)
    for _,tag in ipairs(tags) do
        if table.contains(testSuite.tags, tag) then
            return true
        end
    end
    return false
end



--
-- Load test script.
--
function loadTestScript(scriptDirectory, filename, verboseOperation, testSuiteName)
    -- if script directory (where 'emend' is stored) is specified, load test from this directory
    if scriptDirectory then
        if verboseOperation then
            print("Script directory/filename: " .. scriptDirectory .. "test/" .. filename)
            print("Test name: " ..testSuiteName)
        end
        dofile(scriptDirectory .. "test/" .. filename)
    -- fallback when script directory is not specified
    else
        if verboseOperation then
            print("Script filename: test/" .. filename)
            print("Test name: " ..testSuiteName)
        end
        -- test script must exists
        if path.file_exists(filename) then
           dofile(filename)
        else
           print("Test '" .. filename .. "' does not exist.")
        end
    end
end



--
-- Run tear down function (if it exists)
--
function runTearDownFunction(verboseOperation, tearDownFunction)
    if tearDownFunction then
        writeTearDownStart(io.stdout, false)
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
end



--
-- Try to call test setup function.
--
function runTestSetupFunction(setupFunction, verboseOperation, processRestOfTest)
    currentTestFailure = false
    writeSetupStart(io.stdout, false)

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
        return false
    end
    if currentTestFailure then
        return false
    end
    return processRestOfTest
end



--
-- Load and run one selected test.
-- TODO: this function really needs to be refactored!
--
function core.runTest(scriptDirectory, filename, verboseOperation, testOptions, colorOutput, tags)
    local testSuiteName = core.updateTestSuiteName(filename)
    if testSuiteName then
        local testSuite = {}
        testSuite.name = testSuiteName
        core.checkTestNameShadowing(testSuiteName)

        loadTestScript(scriptDirectory, filename, verboseOperation, testSuiteName)

        fillInTestMetadata(testSuite, testSuiteName)

        if tags and testSuite.tags and #tags > 0 then
            local found = tagsExist(testSuite, tags)
            if not found then
                return nil
            end
        end

        local processRestOfTest = true

        if not checkForAllTools(testSuite, testSuiteName) then
            print("Required tool(s) missing.")
            processRestOfTest = false
        end

        addTestOptions(testSuiteName, testOptions)

        local setupFunction = core.getSetupFunction(testSuiteName)
        local tearDownFunction = core.getTearDownFunction(testSuiteName)
        local testFunctionNames = testInfo.getListOfTestFunctionNames(testSuiteName)

        if testFunctionNames or setupFunction or tearDownFunction then

            -- print an information about the test suite that are started
            -- to the standard output
            writeTestSuiteStart(io.stdout, testSuite, false)

            if setupFunction and processRestOfTest then
                processRestOfTest = runTestSetupFunction(setupFunction, verboseOperation, processRestOfTest)
            end
            local passCnt = 0
            local failCnt = 0
            local errorCnt = 0
            local methods = {}
            if processRestOfTest then
                for i,testFunctionName in ipairs(testFunctionNames) do
                    local method = {}
                    method.name = testFunctionName

                    core.messages = {}
                    method.result = nil

                    writeCaseStart(io.stdout, method, colorOutput)

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
                            writeMessageToStdOut(message, colorOutput)
                            table.insert(core.messages, {"ERROR", message})
                            errorCnt = errorCnt + 1
                            method.result = "ERROR"
                        else
                            failCnt = failCnt + 1
                            method.result = "FAIL"
                        end
                    end
                    method.messages = table.copy(core.messages)
                    method.pass = filterMessages(method.messages, "PASS")
                    method.fail = filterMessages(method.messages, "FAIL")
                    method.info = filterMessages(method.messages, "INFO")
                    method.errors = filterMessages(method.messages, "ERROR")
                    table.insert(methods, method)
                end
            end
            runTearDownFunction(verboseOperation, tearDownFunction)

            -- fill in all information about test results into testSuite data structure
            fillInTestResults(testSuite, passCnt, failCnt, errorCnt, methods)

            -- print an information about the test suite that just finished
            -- to the standard output
            writeTestSuiteEnd(io.stdout, testSuite, colorOutput)

            -- store results into the core.results table; this table will
            -- be used by various writers
            table.insert(core.results.suites, testSuite)

            -- return true only when there are no tests that failed or
            -- can not be run due to other error
            -- also: when processRestOfTest is set to true -> it means
            --       that setupFunction have failed so the test as a whole
            --       must fail
            return failCnt == 0 and errorCnt == 0 and processRestOfTest
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
-- Read all tests stored in the "test" subdirectory.
--
function getTestList()
    --local scriptDirectory = getScriptDirectory()
    local currentDirectory = getCurrentDirectory()
    local testDirectory = currentDirectory .. "test"

    -- check if directory containing tests exists
    if path.directory_exists(testDirectory) then
        local command = 'ls -1 '.. testDirectory .. "/*.lua"..' 2> /dev/null | xargs -n 1 basename 2> /dev/null'
        local process = io.popen(command)
        local testList = process:lines()
        return putTestListIntoTable(testList)
    else
        print("Test directory '" .. testDirectory .. "' does not exist!")
        -- we need to use special value
        return nil
    end
end



--
-- Returns true if at least one test is specified on the command line.
--
function areTestsSpecified(testsToRun)
    return testsToRun and #testsToRun > 0
end



--
-- List all tests stored in the current working directory + 'test' subdirectory.
--
function performListOfAllTests(verboseOperation)
    -- test subdirectory might be different than the directory where the script is stored
    local currentDirectory = getCurrentDirectory()
    local testDirectory = currentDirectory .. "test"

    -- read all tests stored in a "test" subdirectory
    local testList = getTestList()

    -- if test directory exists (might be empty)
    if testList then
        -- loop over all tests stored in testList
        for _, filename in ipairs(testList) do
            core.printTestInfo(testDirectory, filename, verboseOperation)
        end
    end
end



--
-- Perform a list for specified tests only.
--
function performListOfSpecifiedTests(verboseOperation, testsToRun)
    -- try to process all specified tests
    for _, filename in ipairs(testsToRun) do
        core.printTestInfo(nil, filename, verboseOperation)
    end
end



--
-- List all tests stored in specified script/test directory.
--
function core.performTestList(verboseOperation, colorOutput, testsToRun)
    -- some test(s) are specified on the command line
    if areTestsSpecified(testsToRun) then
        performListOfSpecifiedTests(verboseOperation, testsToRun)
    else
        performListOfAllTests(verboseOperation)
    end
end



--
-- Prepares data structure that will hold test results.
--
function prepareTestResultStructure()
    core.results.passedTests = 0
    core.results.failedTests = 0
    core.results.suites = {}
end



--
-- Print message esp. in case test directory seems to be empty
--
function printMessageIfNoTestsToRun()
    if core.results.passedTests == 0 and core.results.failedTests == 0 then
        print("No tests to run.")
    end
end



--
-- Run all selected tests.
--
function core.runTests(verboseOperation, colorOutput, testsToRun, outputFiles, testOptions, tags, debugModePar)
    debugMode = debugModePar

    -- variable that controls the return value passed to os.exit()
    local returnValue = true
    prepareTestResultStructure()
    -- set global variable
    _G["colorOutput"] = colorOutput

    -- some test(s) are specified on the command line
    if areTestsSpecified(testsToRun) then
        -- try to load and run all specified tests
        for _, filename in ipairs(testsToRun) do
            -- load and run one test
            local result = core.runTest(nil, filename, verboseOperation, testOptions, colorOutput, tags)
            -- refresh test statistics
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
        -- read all tests stored in a "test" subdirectory
        local testList = getTestList()
        -- if test directory exists
        if testList then
            -- loop over all tests stored in testList
            for i, filename in ipairs(testList) do
                -- load and run one test
                local result = core.runTest(currentDirectory, filename, verboseOperation, testOptions, colorOutput, tags)
                -- refresh test statistics
                if result ~= nil then
                    if result then
                        core.results.passedTests = core.results.passedTests + 1
                    else
                        core.results.failedTests = core.results.failedTests + 1
                    end
                end
            end
        else
            returnValue = false
        end
        printMessageIfNoTestsToRun()
    end

    -- if no tests were run, report this situation
    if core.results.passedTests > 0 or core.results.failedTests > 0 then
        writeSummary(io.stdout, core.results, colorOutput, false)
    else
        -- update value used by os.exit()
        -- well no tests were run, but according to issue #1:
        -- "The emend command should return 0 in this situation."
        --returnValue = false
    end
    --dumpTestResults()
    exportResults(outputFiles, colorOutput, core.writer, core.results)
    return returnValue
end



-- export module
return core

