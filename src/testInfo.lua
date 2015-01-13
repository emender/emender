-- Module with functions to print informations and metadata of tests.
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
local testInfo = {
}



--
-- Get list of references to all functions defined in given test (module);
-- names of all returned functions start with "test"
-- Functions with different names are considered as common functions
-- and are not directly called by the test harness
-- (setUp() and tearDown() functions are exceptions)
--
-- If test with given name does not exists, nil is returned.
--
function testInfo.getListOfTestFunctionNames(testName)
    -- prepare empty table for storing test function names
    local testFunctionNames = {}
    -- get all symbol names of given module from the global table
    local test = _G[testName]

    -- if module exists
    if test then
        -- iterate over all functions and filter only functions whose
        -- names begins with "test" prefix
        for k,v in pairs(test) do
            if k and k:startsWith("test") and type(v) == "function" then
                table.insert(testFunctionNames, k)
            end
        end
        -- we like the tests to be sorted
        table.sort(testFunctionNames)
        return testFunctionNames
    else
        -- module does not exists at all
        return nil
    end
end



--
-- Print basic test metadata to the standard output.
--
function testInfo.printTestMetadata(metadata)
    local description = metadata["description"]
    print("    Description: " .. description)
    local authors = metadata["authors"]
    print("    Authors:     " .. authors)
    local emails = metadata["emails"]
    print("    Emails:      " .. emails)
    local changed = metadata["changed"]
    print("    Changed:     " .. changed)
end



--
-- Print list of all test function to the standard output.
--
function testInfo.printListOfTestFunctionNames(testFunctions)
    print("    Test functions:")
    -- iterate over all registered test functions
    for _, testFunction in ipairs(testFunctions) do
        print("        " .. testFunction)
    end
end



--
-- Print list of all required external tools to the standard output.
--
function testInfo.printTestRequiredTool(requiresAttribute)
    print("    Required external tools:")

    -- check if the test needs at least one external tool
    if not requiresAttribute then
        print("        none")
    else
        -- iterate over all required external tools
        for _, requires in ipairs(requiresAttribute) do
            print("        " .. requires)
        end
    end
end



--
-- Print tags associated with test.
--
function testInfo.printTestTags(tags)
    print("    Tags bound to the test:")

    -- check if the test has assigned at least one tag
    if not tags then
        print("        none")
    else
        -- iterate over all tags
        for _, tag in ipairs(tags) do
            print("        " .. tag)
        end
    end
end



--
-- Print detailed information about selected test
--
function testInfo.printDetailedTestInfo(test, testName)
    local metadata = test["metadata"]

    -- test module should contain metadata
    if not metadata then
        print("Test " .. test .. " does not contain metadata, needs to be fixed!")
    end
    -- print metadata associated with the test
    testInfo.printTestMetadata(metadata)

    -- print all tags associated with the test
    local tags = metadata["tags"]
    testInfo.printTestTags(tags)

    -- print list of external tools required by the test
    local requiresAttribute = test["requires"]
    testInfo.printTestRequiredTool(requiresAttribute)

    -- print test function names
    local testFunctions = testInfo.getListOfTestFunctionNames(testName)
    testInfo.printListOfTestFunctionNames(testFunctions)
end



-- export module
return testInfo

