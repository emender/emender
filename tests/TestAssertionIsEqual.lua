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

TestAssertionIsEqual = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_equal().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsEqual.testPositive1()
    is_equal(true, true, "positive equality test:two booleans")
end

function TestAssertionIsEqual.testPositive2()
    is_equal(false, false, "positive equality test:two booleans")
end

function TestAssertionIsEqual.testPositive3()
    is_equal(1, 1, "positive equality test: two integers")
end

function TestAssertionIsEqual.testPositive4()
    is_equal("x", "x", "positive equality test: two strings")
end

function TestAssertionIsEqual.testNegative1()
    is_equal(true, false, "(expected) negative equality test")
end

function TestAssertionIsEqual.testNegative2()
    is_equal(false, true, "(expected) negative equality test")
end

function TestAssertionIsEqual.testNegative3()
    is_equal(1, 2, "(expected) integers are not the same")
end

function TestAssertionIsEqual.testNegative4()
    is_equal("x", "y", "(expected) strings are not the same")
end

function TestAssertionIsEqual.testNegative5()
    is_equal()
end

function TestAssertionIsEqual.testNegative6()
    is_equal(1)
end

function TestAssertionIsEqual.testNegative7()
    is_equal(1, 1)
end

function TestAssertionIsEqual.testNegative8()
    is_equal(nil, nil, "What's wrong?")
end

