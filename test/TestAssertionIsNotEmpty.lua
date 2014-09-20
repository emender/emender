-- TestAssertionIsEmpty.lua - test the behavior of the asserts.is_not_empty() function
-- Copyright (C) 2014 Jaromir Hradilek

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

TestAssertionIsNotEmpty = {
    metadata = {
        description = "Test the behavior of the asserts.is_not_empty() function.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-09-20",
        tags = {"BasicTest"}
    }
}

-- Verify that the function recognizes a table with items in it:
function TestAssertionIsNotEmpty.testPositive1()
    is_not_empty({1}, "table is not empty")
end

-- Verify that the function does not accept only one argument:
function TestAssertionIsNotEmpty.testNegative1()
    is_not_empty("the function expects two arguments")
end

-- Verify that the function does not accept zero arguments:
function TestAssertionIsNotEmpty.testNegative2()
    is_not_empty()
end

-- Verify that the function recognizes an empty table:
function TestAssertionIsNotEmpty.testNegative3()
    is_not_empty({}, "(expected) table is empty")
end

-- Verify that the function recognizes nil:
function TestAssertionIsNotEmpty.testNegative4()
    is_not_empty(nil, "nil is not a table")
end

-- Verify that the function recognizes a Boolean:
function TestAssertionIsNotEmpty.testNegative5()
    is_not_empty(false, "false is not a table")
end

-- Verify that the function recognizes a number:
function TestAssertionIsNotEmpty.testNegative6()
    is_not_empty(0, "zero is not a table")
end

-- Verify that the function recognizes a string:
function TestAssertionIsNotEmpty.testNegative7()
    is_not_empty("", "string is not empty")
end
