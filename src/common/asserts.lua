-- asserts.lua - a module containing all assertion functions
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



function report_error(message)
    error("Assertion error: " .. message)
end

function report_error_in_test_structure(message)
    error("Test structure error: " .. message, 3)
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
        pass(explanation)
    else
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
        fail(explanation)
    else
        pass(explanation)
    end
end



--
-- The is_equal() function compares two values and tests whether these values are equal.
-- If they are, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test, expected_value with the expected value,
-- and explanation with a short description of the test. For example, to test if a variable
-- named result is equal to 42, type:
--
--  is_equal(result, 42, "The value is equal to 42")
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
    is_true(current_value == expected_value, explanation)
end



--
-- The is_unequal() function compares two values and tests whether these values are different.
-- If they are, the function reports the test as passed, otherwise it reports it as failed.
--
-- Replace value with the value to test, expected_value with the expected value, and explanation
-- with a short description of the test. For example, to test if a variable named result is of
-- a value other than 42, type:
--
--  is_unequal(result, 42, "The value is not equal to 42")
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
    is_true(current_value ~= expected_value, explanation)
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
function is_nil(value, explanation)
    -- Determine the type of the value:
    if value == nil then
        pass(explanation)
    else
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
function is_not_nil(value, explanation)
    -- Determine the type of the value:
    if value ~= nil then
        pass(explanation)
    else
        fail(explanation)
    end
end



-- The is_empty() function tests whether a certain table is empty. If it is, the
-- function reports the test as passed, otherwise it reports it as failed.
-- 
-- Replace table with the table to test and explanation with a short description of
-- the test. For example, to test if a table named results is empty, type:
-- 
--  is_empty(results, "The table is empty")
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
        pass(explanation)
    else
        fail(explanation)
    end
end


-- The is_not_empty() function tests whether a certain table contains at least one
-- item. If it does, the function reports the test as passed, otherwise it reports
-- the test as failed.
-- 
-- Replace table with the table to test and explanation with a short description of
-- the test. For example, to test if a table named result contains some items, type:
-- 
--  is_not_empty(results, "The table is not empty")
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
        pass(explanation)
    else
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
    print("    PASSED  " .. explanation)
    printPassMessage(explanation)
end



--
-- The fail() function reports the test as failed.
--
-- Replace explanation with a short description of the test. For example:
--
--  fail("The value is not on the list of allowed values.")
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

    print("    FAILED  " .. explanation)
    printFailMessage(explanation)
    markTestFailure()
end

