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

TestAssertionIsntEqual = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.isnt_equal().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsntEqual.testPositive1()
    isnt_equal(true, false, "positive equality test:two booleans")
end

function TestAssertionIsntEqual.testPositive2()
    isnt_equal(false, true, "positive equality test:two booleans")
end

function TestAssertionIsntEqual.testPositive3()
    isnt_equal(1, 2, "positive equality test: two integers")
end

function TestAssertionIsntEqual.testPositive4()
    isnt_equal("x", "y", "positive equality test: two strings")
end

function TestAssertionIsntEqual.testNegative1()
    isnt_equal(true, true, "(expected) negative equality test")
end

function TestAssertionIsntEqual.testNegative2()
    isnt_equal(false, false, "(expected) negative equality test")
end

function TestAssertionIsntEqual.testNegative3()
    isnt_equal(1, 1, "(expected) integers are not the same")
end

function TestAssertionIsntEqual.testNegative4()
    isnt_equal("x", "x", "(expected) strings are not the same")
end

function TestAssertionIsntEqual.testNegative5()
    isnt_equal()
end

function TestAssertionIsntEqual.testNegative6()
    isnt_equal(1)
end

function TestAssertionIsntEqual.testNegative7()
    isnt_equal(1, 1)
end

function TestAssertionIsntEqual.testNegative8()
    isnt_equal(nil, nil, "What's wrong?")
end

