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

function report_error(message)
    print(message)
end

function report_error_in_test_structure(message)
    error(message)
end

function is_true(expression, description)
    if expression == nil then
        report_error_in_test_structure("Expression is not specified!")
    end
    if description == nil then
        report_error_in_test_structure("Description is not specified!")
    end
    if not expression then
        report_error(description)
    end
end

function is_not_true(expression, description)
    if expression == nil then
        report_error_in_test_structure("Expression is not specified!")
    end
    if description == nil then
        report_error_in_test_structure("Description is not specified!")
    end
    if expression then
        report_error(description)
    end
end

