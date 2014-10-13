-- Documentation generation module.
-- Copyright (C) 2014 Pavel Tisnovsky

-- This file is part of Emender.

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

local gendoc = {
}



--
-- Get comment that would be read up to the given line.
-- All comment lines should start with "--"
--
function getComment(testSource, endLine)
    -- comment lines should END just before the line containing function name
    local i = endLine - 1

    if i <= 1 then
        print("Test function is at the beggining of the test source...strange.")
    end

    -- output accumulator
    local output = ""

    -- try to read all relevant lines containing comment
    -- and join it into one "big" string
    repeat
        local line = testSource[i]
        assert(line)

        local commentLine = line:startsWith("--")
        assert(commentLine ~= nil)

        -- insert comment line _before_ previous comment lines
        -- (because we read comments from the end to the beginning)
        if commentLine then
            local x = line:subs(3):trim()
            output = x .. " " .. output
        end

        -- go to the previous line
        i = i - 1
    until i == 1 or not commentLine

    -- trim whitespaces
    output = output:trim()

    if output == "" then
        return "(not commented)"
    else
        return output
    end
end



--
-- Generate documentation for one selected function for the given test.
--
function generateDocForOneFunction(testName, testFunction, testSource)

    -- be sure everything is ok
    if not _G or not _G[testName] or not _G[testName][testFunction] then
        print("    Internal error; it should not happen in the perfect world!")
        return
    end

    local f = _G[testName][testFunction]
    local debugInfo = debug.getinfo(f)

    if not debugInfo then
        print("    Internal error; can not read debuginfo for the test function " .. testName .. "." .. testFunction)
        return
    end

    local line = debugInfo.linedefined

    if not line then
        print("    Internal error; can not read debuginfo for the test function " .. testName .. "." .. testFunction)
        return
    end

    local comment = getComment(testSource, line)
    print("", testFunction .. ":", comment)
end



--
-- Print warning about the test without any test functions.
--
function printWarning()
    print("    Warning - no test functions found in this test.")
    print("    Please make sure the test is really correct.")
end



--
-- Generate simple documentation for one selected test.
--
function generateDocForOneTest(core, testName, scriptDirectory, filename)
    core.checkTestNameShadowing(testName)

    -- load or reload the test se we could use reflection
    dofile(scriptDirectory .. "test/" .. filename)

    -- if test is properly loaded its structure must be stored in a global table _G
    local test = _G[testName]
    if test then
        print("Test: " .. testName)
        -- retrieve all test functions
        local testFunctions = core.getListOfTestFunctionNames(testName)

        -- simple check if at least one function is specified in the test
        if not testFunctions or #testFunctions==0 then
            printWarning()
        end

        -- read whole source file and store it in a table (line-by-line)
        local testSource = slurpTable(scriptDirectory .. "test/" .. testName .. ".lua")

        -- produce doc output for each test function
        for i, testFunction in ipairs(testFunctions) do
            generateDocForOneFunction(testName, testFunction, testSource)
        end
    else
        print("Test '" .. testName .. "' can't be loaded or there's name mismatch")
        print("(test name is different from the name of test file).")
        print("Please check the content of file " .. filename)
    end
end



--
-- Generate simple documentation (comments for all function)
-- for the given list of tests.
--
function generateDocForAllTests(core, testList, scriptDirectory)
    for i, filename in ipairs(testList) do
        local testName = core.updateTestName(filename)
        -- if the filename is the real test name, generate documentation for it
        if testName then
            generateDocForOneTest(core, testName, scriptDirectory, filename)
        end
    end
end



--
-- Generate simple documentation (comments for all test functions found
-- in all tests).
--
function gendoc.generateDoc(core)
    local scriptDirectory = getScriptDirectory()
    local testList = getTestList()
    -- generate simple documentation for the given list of tests
    generateDocForAllTests(core, testList, scriptDirectory)
end



return gendoc

