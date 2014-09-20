-- TestAssertionIsEmpty.lua - test the behavior of the asserts.is_empty() function
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

TestAssertionIsEmpty = {
    metadata = {
        description = "Test the behavior of the asserts.is_empty() function.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-09-20",
        tags = {"BasicTest"}
    }
}

-- Verify that the function recognizes an empty table:
function TestAssertionIsEmpty.testPositive1()
    is_empty({}, "table is empty")
end

-- Verify that the function does not accept only one argument:
function TestAssertionIsEmpty.testNegative1()
    is_empty("the function expects two arguments")
end

-- Verify that the function does not accept zero arguments:
function TestAssertionIsEmpty.testNegative2()
    is_empty()
end

-- Verify that the function recognizes a table with items:
function TestAssertionIsEmpty.testNegative3()
    is_empty({1}, "(expected) table is not empty")
end

-- Verify that the function recognizes nil:
function TestAssertionIsEmpty.testNegative4()
    is_empty(nil, "nil is not a table")
end

-- Verify that the function recognizes a Boolean:
function TestAssertionIsEmpty.testNegative5()
    is_empty(false, "false is not a table")
end

-- Verify that the function recognizes a number:
function TestAssertionIsEmpty.testNegative6()
    is_empty(0, "zero is not a table")
end

-- Verify that the function recognizes a string:
function TestAssertionIsEmpty.testNegative7()
    is_empty("", "string is not empty")
end
