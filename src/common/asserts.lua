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
-- Module containing all assertion functions.
--

function report_error(message)
    error("Assertion error: " .. message)
end

function report_error_in_test_structure(message)
    error("Test structure error: " .. message)
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
    if expression == nil then
        report_error_in_test_structure("Expression is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if not expression then
        report_error(explanation)
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
    if expression == nil then
        report_error_in_test_structure("Expression is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if expression then
        report_error(explanation)
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
    if current_value == nil then
        report_error_in_test_structure("Current value is not specified!")
        return
    end
    if expected_value == nil then
        report_error_in_test_structure("Expected value is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if current_value ~= expected_value then
        report_error(explanation)
    end
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
    if current_value == nil then
        report_error_in_test_structure("Current value is not specified!")
        return
    end
    if expected_value == nil then
        report_error_in_test_structure("Expected value is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if current_value == expected_value then
        report_error(explanation)
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
function is_like(current_value, pattern, explanation)
    if current_value == nil then
        report_error_in_test_structure("Current value is not specified!")
        return
    end
    if pattern == nil then
        report_error_in_test_structure("Pattern is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if string.match(current_value, pattern) == nil then
        report_error(explanation)
    end
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
    if current_value == nil then
        report_error_in_test_structure("Current value is not specified!")
        return
    end
    if pattern == nil then
        report_error_in_test_structure("Pattern is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if string.match(current_value, pattern) ~= nil then
        report_error(explanation)
    end
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
    -- commented out because it's possible to have a value set to nil
    --if value == nil then
    --    report_error_in_test_structure("Value is not specified!")
    --    return
    --end
    if expected_type == nil then
        report_error_in_test_structure("Type is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if type(value) ~= expected_type then
        report_error(explanation)
    end
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
    -- commented out because it's possible to have a value set to nil
    --if value == nil then
    --    report_error_in_test_structure("Value is not specified!")
    --    return
    --end
    if expected_type == nil then
        report_error_in_test_structure("Type is not specified!")
        return
    end
    if explanation == nil then
        report_error_in_test_structure("Explanation is not specified!")
        return
    end
    if type(value) == expected_type then
        report_error(explanation)
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
    is_true(true, explanation)
end



--
-- The fail() function reports the test as failed.
--
-- Replace explanation with a short description of the test. For example:
--
--  fail("The value is not on the list of allowed values.")
-- 
function fail(explanation)
    is_true(false, explanation)
end
