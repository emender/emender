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

