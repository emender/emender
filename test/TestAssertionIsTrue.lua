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

TestAssertionIsTrue = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_true().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsTrue.testPositive1()
    is_true(true, "true is still true :)")
end

function TestAssertionIsTrue.testPositive2()
    is_true(1==1, "equality")
end

function TestAssertionIsTrue.testPositive3()
    is_true(1==1, "")
end

function TestAssertionIsTrue.testNegative1()
    is_true(false, "(expected) false is definitely not true")
end

function TestAssertionIsTrue.testNegative2()
    is_true(1==2, "(expected) not equals!")
end

function TestAssertionIsTrue.testNegative3()
    is_true()
end

function TestAssertionIsTrue.testNegative4()
    is_true(1==1)
end

function TestAssertionIsTrue.testNegative5()
    is_true(1==1, nil)
end

function TestAssertionIsTrue.testNegative6()
    is_true(nil, "What's wrong?")
end

function TestAssertionIsTrue.testNegative7()
    is_true(1==1, 42)
end

function TestAssertionIsTrue.testNegative8()
    is_true(42, "42 is not a valid expression")
end
