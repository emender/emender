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
-- The is_true() function allows you to test whether an expression evaluates to true.
-- The function accepts two arguments: an expression and a brief explanation of the test.
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
-- The is_false() function allows you to test whether an expression evaluates to false.
-- The function accepts two arguments: an expression and a brief explanation of the test.
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
-- The is_equal() function allows you to test whether two values are equal.
--
-- It takes the following form:
--     is_equal(current_value, expected_value, explanation)  
--
-- The function accepts three arguments:
--     the current value, the expected value, and a brief explanation of the test.
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
-- The isnt_equal() function allows you to test whether two values are not equal.
--
-- It takes the following form:
--     isnt_equal(current_value, expected_value, explanation)  
--
-- The function accepts three arguments:
--     the current value, the expected value, and a brief explanation of the test.
--
function isnt_equal(current_value, expected_value, explanation)
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
-- The does_match() function allows you to test whether a value matches a regular expression.
--
-- It takes the following form:
--     does_match(current_value, pattern, explanation)  
--
-- This function accepts three arguments: a value, a regular expression,
-- and a brief explanation of the test.
--
function does_match(current_value, pattern, explanation)
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
-- The doesnt_match() function allows you to test whether a value does not match a regular expression.
--
-- It takes the following form:
--     doesnt_match(value, pattern, explanation)  
--
-- This function accepts three arguments: a value, a regular expression,
-- and a brief explanation of the test.
--
function doesnt_match(current_value, pattern, explanation)
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

