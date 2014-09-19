-- TestAssertionIsNil.lua - test the behavior of the asserts.is_nil() function
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

TestAssertionIsNil = {
    metadata = {
        description = "Test the behavior of the asserts.is_nil() function.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-09-19",
        tags = {"BasicTest"}
    }
}

-- Verify that the function correctly recognizes nil as its first argument:
function TestAssertionIsNil.testPositive1()
    is_nil(nil, "nil is still nil")
end

-- Verify that the function does not accept one argument:
function TestAssertionIsNil.testNegative1()
    is_nil("the function expects two arguments")
end

-- Verify that the function does not accept zero arguments:
function TestAssertionIsNil.testNegative2()
    is_nil()
end

-- Verify that the function correctly recognizes a Boolean:
function TestAssertionIsNil.testNegative3()
    is_nil(false, "(expected) false is not nil")
end

-- Verify that the function correctly recognizes a number:
function TestAssertionIsNil.testNegative4()
    is_nil(0, "(expected) zero is not nil")
end

-- Verify that the function correctly recognizes a string:
function TestAssertionIsNil.testNegative5()
    is_nil("", "(expected) string is not nil")
end

-- Verify that the function correctly recognizes a table:
function TestAssertionIsNil.testNegative6()
    is_nil({}, "(expected) table is not nil")
end
