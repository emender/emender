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

TestAssertionIsUnequal = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_unequal().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsUnequal.testPositive1()
    is_unequal(true, false, "positive equality test:two booleans")
end

function TestAssertionIsUnequal.testPositive2()
    is_unequal(false, true, "positive equality test:two booleans")
end

function TestAssertionIsUnequal.testPositive3()
    is_unequal(1, 2, "positive equality test: two integers")
end

function TestAssertionIsUnequal.testPositive4()
    is_unequal("x", "y", "positive equality test: two strings")
end

function TestAssertionIsUnequal.testNegative1()
    is_unequal(true, true, "(expected) negative equality test")
end

function TestAssertionIsUnequal.testNegative2()
    is_unequal(false, false, "(expected) negative equality test")
end

function TestAssertionIsUnequal.testNegative3()
    is_unequal(1, 1, "(expected) integers are not the same")
end

function TestAssertionIsUnequal.testNegative4()
    is_unequal("x", "x", "(expected) strings are not the same")
end

function TestAssertionIsUnequal.testNegative5()
    is_unequal()
end

function TestAssertionIsUnequal.testNegative6()
    is_unequal(1)
end

function TestAssertionIsUnequal.testNegative7()
    is_unequal(1, 1)
end

function TestAssertionIsUnequal.testNegative8()
    is_unequal(nil, nil, "What's wrong?")
end

