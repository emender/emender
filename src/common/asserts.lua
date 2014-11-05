-- asserts.lua - a module containing all required assertion functions.
-- Copyright (C) 2014 Pavel Tisnovsky, Jaromir Hradilek

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



--
-- Function that could be called from the core (or possibly directly from the
-- test) to report unexpected error. Please note that error is usually a bit
-- different from the test failure reported via the fail() function. All common
-- and (probably expected) runtime failures should be reported via fail().
--
-- @param message Message containing the explanation of (test) error.
--
function report_error(message)
    -- to be caught by a pcall()
    error("Assertion error: " .. message)
end



--
-- Report a serious error in the test structure.
-- This type of error is reported when some required parameters are missing
-- and/or have an improper type.
--
-- @param message Message containing the explanation of (test) error.
--
function report_error_in_test_structure(message)
    -- We need to acquire the exact name of the test function.
    -- This is not trivial because this function is never called
    -- from the test itself, so we need to figure out caller and
    -- the "distance" between the test function and this function.
    -- The given approach is a bit naive, but it seems to work :)
    local stackDepth = 3
    -- perform this step only when debug module is available and loaded ATM
    if debug then
        -- typical chain is:
        -- test->is_true()->report_error_in_test_structure()
        -- or
        -- test->is_equal()->is_true()->report_error_in_test_structure()
        -- we need to check the latter possibility
        local debugInfo = debug.getinfo(3)
        if debugInfo then
            -- information about the name of source file
            local callerSrc = debugInfo.short_src
            -- check the caller
            if callerSrc and callerSrc:endsWith("asserts.lua") then
                stackDepth = stackDepth + 2
            end
        end
    end
    error("Test structure error: " .. message, stackDepth)
end



--
-- The is_true() function tests whether a certain expression evaluates to true.
-- If it does, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace expression with a valid Lua expression and explanation with a short description
-- of the test. For example, to test if a variable named result is greater than 42, type:
--
--  is_true(result > 42, "The value is greater than 42")
--
-- @param expression Expression to be evaluated, can't be nil, must be of type boolean
-- @param explanation Short description of the test, must be of type string
--
function is_true(expression, explanation)
    -- Verify that <expression> is specified:
    if expression == nil then
        report_error_in_test_structure("Expression is a required argument.")
        return
    end

    -- Verify that <expression> is a valid expression:
    if type(expression) ~= "boolean" then
        report_error_in_test_structure("Expression must evaluate to a Boolean.")
        return
    end

    -- Evaluate the expression:
    if expression then
        -- check if explanation is a proper string is performed inside pass() function
        pass(explanation)
    else
        -- check if explanation is a proper string is performed inside fail() function
        fail(explanation)
    end
end



--
-- The is_false() function tests whether a certain expression evaluates to false.
-- If it does, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace expression with a valid Lua expression and explanation with a short description
-- of the test. For example, to test if a variable named result is less than or equal to 42, type:
--
--  is_false(result > 42, "The value is not greater than 42")
--
-- @param expression Expression to be evaluated, can't be nil, must be of type boolean
-- @param explanation Short description of the test, must be of type string
--
function is_false(expression, explanation)
    -- Verify that <expression> is specified:
    if expression == nil then
        report_error_in_test_structure("Expression is a required argument.")
        return
    end

    -- Verify that <expression> is a valid expression:
    if type(expression) ~= "boolean" then
        report_error_in_test_structure("Expression must evaluate to a Boolean.")
        return
    end

    -- Evaluate the expression:
    if expression then
        -- check if explanation is a proper string is performed inside fail() function
        fail(explanation)
    else
        -- check if explanation is a proper string is performed inside pass() function
        pass(explanation)
    end
end



--
-- The is_equal() function compares two values and tests whether these values are equal.
-- If they are, the function reports the test as passed, otherwise it reports it as failed.
-- Please note that this function works for tables too, including nested tables.
--
-- Replace value with the value to test, expected_value with the expected value,
-- and explanation with a short description of the test. For example, to test if a variable
-- named result is equal to 42, type:
--
--  is_equal(result, 42, "The value is equal to 42")
--
-- @param current_value Value to test, can't be nil
-- @param expected_value Expected value, can't be nil
-- @param explanation Short description of the test, must be of type string
--
function is_equal(current_value, expected_value, explanation)
    -- Verify that <current_value> is specified:
    if current_value == nil then
        report_error_in_test_structure("Current value a required argument.")
        return
    end

    -- Verify that <expected_value> is specified:
    if expected_value == nil then
        report_error_in_test_structure("Expected value is a required argument.")
        return
    end

    -- Compare the values:
    if type(current_value) == "table" and type(expected_value) == "table" then
        -- we need to make deep comparison of items stored in tables
        -- check if explanation is a proper string is performed later
        is_true(table.compare(current_value, expected_value), explanation)
    else
        -- for other types, it's perfectly ok to use the == operator
        -- check if explanation is a proper string is performed later
        is_true(current_value == expected_value, explanation)
    end
end



--
-- The is_unequal() function compares two values and tests whether these values are different.
-- If they are, the function reports the test as passed, otherwise it reports it as failed.
-- Please note that this function works for tables too, including nested tables.
--
-- Replace value with the value to test, expected_value with the expected value, and explanation
-- with a short description of the test. For example, to test if a variable named result is of
-- a value other than 42, type:
--
--  is_unequal(result, 42, "The value is not equal to 42")
--
-- @param current_value Value to test, can't be nil
-- @param expected_value Expected value, can't be nil
-- @param explanation Short description of the test, must be of type string
--
function is_unequal(current_value, expected_value, explanation)
    -- Verify that <current_value> is specified:
    if current_value == nil then
        report_error_in_test_structure("Current value a required argument.")
        return
    end

    -- Verify that <expected_value> is specified:
    if expected_value == nil then
        report_error_in_test_structure("Expected value is a required argument.")
        return
    end

    -- Compare the values:
    if type(current_value) == "table" and type(expected_value) == "table" then
        -- we need to make deep comparison of items stored in tables
        -- and then negate the result
        -- check if explanation is a proper string is performed later
        is_false(table.compare(current_value, expected_value), explanation)
    else
        -- for other types, it's perfectly ok to use the ~= operator
        -- check if explanation is a proper string is performed later
        is_true(current_value ~= expected_value, explanation)
    end
end



--
-- The is_like() function tests whether a certain value matches a Lua pattern.
-- If it does, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test, pattern with the pattern, and explanation with
-- a short description of the test. For example, to test if a variable named result
-- contains a date, type:
--
--  is_like(result, "^%d%d%d%d-%d%d-%d%d$", "The value represents a date.")
--
-- @param current_value Value to test, can't be nil
-- @param pattern Text pattern that is specified in PIL, can't be nil
-- @param explanation Short description of the test, must be of type string
--
function is_like(current_value, pattern, explanation)
    -- Verify that <current_value> is specified:
    if current_value == nil then
        report_error_in_test_structure("Current value is a required argument.")
        return
    end

    -- Verify that <pattern> is specified:
    if pattern == nil then
        report_error_in_test_structure("Pattern is a required argument.")
        return
    end

    -- Compare the value with the pattern:
    -- check if explanation is a proper string is performed later
    is_true(string.match(current_value, pattern) ~= nil, explanation)
end



--
-- The is_unlike() function tests whether a certain value does not match a Lua pattern.
-- If it does not, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test, pattern with the pattern, and explanation with
-- a short description of the test. For example, to test if a variable named result does
-- not contain letters, type:
--
--  is_unlike(result, "%a", "The value does not contain letters.")
--
-- @param current_value Value to test, can't be nil
-- @param pattern Text pattern that is specified in PIL, can't be nil
-- @param explanation Short description of the test, must be of type string
--
function is_unlike(current_value, pattern, explanation)
    -- Verify that <current_value> is specified:
    if current_value == nil then
        report_error_in_test_structure("Current value is a required argument.")
        return
    end

    -- Verify that <pattern> is specified:
    if pattern == nil then
        report_error_in_test_structure("Pattern is a required argument.")
        return
    end

    -- Compare the value with the pattern:
    -- check if explanation is a proper string is performed later
    is_true(string.match(current_value, pattern) == nil, explanation)
end



--
-- The is_type() function tests whether a certain value is of a particular type.
-- If it is, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test, type with the expected data type, and explanation
-- with a short description of the test. For example, to test if a variable named result
-- contains a number, type:
--
--  is_type(result, "number", "The value is a number")
--
-- @param value Value to test
-- @param expectedType One of the following strings: string, number, function, boolean, nil,
--                                                   table or thread
-- @param explanation Short description of the test, must be of type string
--
function is_type(value, expected_type, explanation)
    -- Verify that <expected_type> is specified:
    if expected_type == nil then
        report_error_in_test_structure("Type is a required argument.")
        return
    end

    -- Verify that <expected_type> is a string:
    if type(expected_type) ~= "string" then
        report_error_in_test_structure("Expected type must be a string.")
        return
    end

    -- Compare the types:
    -- check if explanation is a proper string is performed later
    is_true(type(value) == expected_type, explanation)
end



--
-- The is_not_type() function tests whether a certain value is not of a particular type.
-- If it is not, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test, type with the expected data type, and explanation
-- with a short description of the test. For example, to test if a variable named result
-- contains a value that is not a number, type:
--
--  is_not_type(result, "number", "The value is not a number")
--
-- @param value Value to test
-- @param expectedType One of the following strings: string, number, function, boolean, nil,
--                                                   table or thread
-- @param explanation Short description of the test, must be of type string
--
function is_not_type(value, expected_type, explanation)
    -- Verify that <expected_type> is specified:
    if expected_type == nil then
        report_error_in_test_structure("Type is a required argument.")
        return
    end

    -- Verify that <expected_type> is a string:
    if type(expected_type) ~= "string" then
        report_error_in_test_structure("Expected type must be a string.")
        return
    end

    -- Compare the types:
    -- check if explanation is a proper string is performed later
    is_true(type(value) ~= expected_type, explanation)
end



--
-- The is_nil() function tests whether a certain value is nil. If it is, the function
-- reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test and explanation with a short description of the
-- test. For example, to test if a variable named result is equal to nil, type:
--
--  is_nil(result, "The value is nil")
--
-- @param value Value to test
-- @param explanation Short description of the test, must be of type string
--
function is_nil(value, explanation)
    -- Determine the type of the value:
    if value == nil then
        -- check if explanation is a proper string is performed inside pass() function
        pass(explanation)
    else
        -- check if explanation is a proper string is performed inside fail() function
        fail(explanation)
    end
end



--
-- The is_not_nil() function tests whether a certain value is not nil. If it is not, the
-- function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test and explanation with a short description of the
-- test. For example, to test if a variable named result is not nil, type:
--
--  is_not_nil(result, "The value is not nil.")
--
-- @param value Value to test
-- @param explanation Short description of the test, must be of type string
--
function is_not_nil(value, explanation)
    -- Determine the type of the value:
    if value ~= nil then
        -- check if explanation is a proper string is performed inside pass() function
        pass(explanation)
    else
        -- check if explanation is a proper string is performed inside fail() function
        fail(explanation)
    end
end



--
-- The is_empty() function tests whether a certain table is empty. If it is, the
-- function reports the test as passed, otherwise it reports it as failed.
-- 
-- Replace table with the table to test and explanation with a short description of
-- the test. For example, to test if a table named results is empty, type:
-- 
--  is_empty(results, "The table is empty")
-- 
-- @param table Table to test, must be of type table
-- @param explanation Short description of the test, must be of type string
--
function is_empty(table, explanation)
    -- Verify that <table> is specified:
    if table == nil then
        report_error_in_test_structure("Table is a required argument.")
        return
    end

    -- Verify that <table> is a table:
    if type(table) ~= "table" then
        report_error_in_test_structure("Table must be a table.")
        return
    end

    -- Check the contents of the table:
    if next(table) == nil then
        -- check if explanation is a proper string is performed inside pass() function
        pass(explanation)
    else
        -- check if explanation is a proper string is performed inside fail() function
        fail(explanation)
    end
end



-- 
-- The is_not_empty() function tests whether a certain table contains at least one
-- item. If it does, the function reports the test as passed, otherwise it reports
-- the test as failed.
-- 
-- Replace table with the table to test and explanation with a short description of
-- the test. For example, to test if a table named result contains some items, type:
-- 
--  is_not_empty(results, "The table is not empty")
-- 
-- @param table Table to test, must be of type table
-- @param explanation Short description of the test, must be of type string
--
function is_not_empty(table, explanation)
    -- Verify that <table> is specified:
    if table == nil then
        report_error_in_test_structure("Table is a required argument.")
        return
    end

    -- Verify that <table> is a table:
    if type(table) ~= "table" then
        report_error_in_test_structure("Table must be a table.")
        return
    end

    -- Check the contents of the table:
    if next(table) ~= nil then
        -- check if explanation is a proper string is performed inside pass() function
        pass(explanation)
    else
        -- check if explanation is a proper string is performed inside fail() function
        fail(explanation)
    end
end



--
-- The pass() function reports the test as passed.
--
-- Replace explanation with a short description of the test. For example:
--
--  pass("The value is on the list of allowed values.")
--
-- @param explanation Short description of the test, must be of type string
--
function pass(explanation)
    -- Verify that <explanation> is specified:
    if explanation == nil then
        report_error_in_test_structure("Explanation is a required argument.")
        return
    end

    -- Verify that <explanation> is a string:
    if type(explanation) ~= "string" then
        report_error_in_test_structure("Explanation must be a string.")
        return
    end

    -- test structure is ok, let register status with its message
    writeTestPass(io.stdout, nil, explanation, false)
    registerPassMessage(explanation)
end



--
-- The fail() function reports the test as failed.
--
-- Replace explanation with a short description of the test. For example:
--
--  fail("The value is not on the list of allowed values.")
--
-- @param explanation Short description of the test, must be of type string
--
function fail(explanation)
    -- Verify that <explanation> is specified:
    if explanation == nil then
        report_error_in_test_structure("Explanation is a required argument.")
        return
    end

    -- Verify that <explanation> is a string:
    if type(explanation) ~= "string" then
        report_error_in_test_structure("Explanation must be a string.")
        return
    end

    -- test structure is ok, let register status with its message
    writeTestFail(io.stdout, nil, explanation, false)
    registerFailMessage(explanation)
    -- test harness needs to be informed that the test fail
    markTestFailure()
end



--
-- The warn() function logs a message without reporting the test as passed
-- or failed. You can use it to report less important issues or issues you
-- are not sure about.
--
-- Replace explanation with a short description of the test. For example:
--
--  warn("This might change in the future.")
--
-- @param explanation Short description of the test, must be of type string
--
function warn(explanation)
    -- Verify that <explanation> is specified:
    if explanation == nil then
        report_error_in_test_structure("Explanation is a required argument.")
        return
    end

    -- Verify that <explanation> is a string:
    if type(explanation) ~= "string" then
        report_error_in_test_structure("Explanation must be a string.")
        return
    end

    -- test structure is ok, let register status with its message
    writeTestInfo(io.stdout, nil, explanation, false)
    registerInfoMessage(explanation)
end

