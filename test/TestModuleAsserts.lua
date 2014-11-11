-- TestModuleAsserts.lua - check the API for the Emender module 'asserts'.
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

TestModuleAsserts = {
    -- required field
    metadata = {
        description = "Check the API for the Emender module 'asserts'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-11",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test if global function with the given name exists.
--
function TestModuleAsserts.doesFunctionExist(functionName)
    -- try to get global object from the global table _G
    local func = _G[functionName]

    -- check if global object exists at all
    is_not_nil(func, "Check if global object with the name '" .. functionName .. "' exists.")
    if not func then
        return
    end

    -- check global object type
    is_type(func, "function", "Check if object with the name '" .. functionName .. "' has correct type")
end



--
-- Check if the following global function exists: 'report_error'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionReportError()
    TestModuleAsserts.doesFunctionExist("report_error")
end



--
-- Check if the following global function exists: 'report_error_in_test_structure'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionReportErrorInTestStructure()
    TestModuleAsserts.doesFunctionExist("report_error_in_test_structure")
end



--
-- Check if the following global function exists: 'is_true'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsTrue()
    TestModuleAsserts.doesFunctionExist("is_true")
end



--
-- Check if the following global function exists: 'is_false'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsFalse()
    TestModuleAsserts.doesFunctionExist("is_false")
end



--
-- Check if the following global function exists: 'is_equal'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsEqual()
    TestModuleAsserts.doesFunctionExist("is_equal")
end



--
-- Check if the following global function exists: 'is_unequal'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsUnequal()
    TestModuleAsserts.doesFunctionExist("is_unequal")
end



--
-- Check if the following global function exists: 'is_like'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsLike()
    TestModuleAsserts.doesFunctionExist("is_like")
end



--
-- Check if the following global function exists: 'is_unlike'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsUnlike()
    TestModuleAsserts.doesFunctionExist("is_unlike")
end



--
-- Check if the following global function exists: 'is_type'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsType()
    TestModuleAsserts.doesFunctionExist("is_type")
end



--
-- Check if the following global function exists: 'is_nil'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsNil()
    TestModuleAsserts.doesFunctionExist("is_nil")
end



--
-- Check if the following global function exists: 'is_not_nil'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsNotNil()
    TestModuleAsserts.doesFunctionExist("is_not_nil")
end



--
-- Check if the following global function exists: 'is_empty'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsEmpty()
    TestModuleAsserts.doesFunctionExist("is_empty")
end



--
-- Check if the following global function exists: 'is_not_empty'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionIsNotEmpty()
    TestModuleAsserts.doesFunctionExist("is_not_empty")
end



--
-- Check if the following global function exists: 'pass'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionPass()
    TestModuleAsserts.doesFunctionExist("pass")
end



--
-- Check if the following global function exists: 'fail'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionFail()
    TestModuleAsserts.doesFunctionExist("fail")
end



--
-- Check if the following global function exists: 'warn'.
-- This function should be declared as part of asserts module.
--
function TestModuleAsserts.testFunctionWarn()
    TestModuleAsserts.doesFunctionExist("warn")
end

