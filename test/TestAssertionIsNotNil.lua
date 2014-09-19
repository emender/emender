-- TestAssertionIsNotNil.lua - test the behavior of the asserts.is_not_nil() function
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

TestAssertionIsNotNil = {
    metadata = {
        description = "Test the behavior of the asserts.is_not_nil() function.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-09-19",
        tags = {"BasicTest"}
    }
}

-- Verify that the function correctly recognizes a Boolean:
function TestAssertionIsNotNil.testPositive1()
    is_not_nil(false, "false is not nil")
end

-- Verify that the function correctly recognizes a number:
function TestAssertionIsNotNil.testPositive2()
    is_not_nil(0, "zero is not nil")
end

-- Verify that the function correctly recognizes a string:
function TestAssertionIsNotNil.testPositive3()
    is_not_nil("", "string is not nil")
end

-- Verify that the function correctly recognizes a table:
function TestAssertionIsNotNil.testPositive4()
    is_not_nil({}, "table is not nil")
end

-- Verify that the function does not accept one argument:
function TestAssertionIsNotNil.testNegative1()
    is_not_nil("the function expects two arguments")
end

-- Verify that the function does not accept zero arguments:
function TestAssertionIsNotNil.testNegative2()
    is_not_nil()
end

-- Verify that the function correctly recognizes nil as its first argument:
function TestAssertionIsNotNil.testNegative3()
    is_not_nil(nil, "(expected) nil is nil")
end
