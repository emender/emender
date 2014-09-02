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

TestAssertionIsFalse = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_false().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsFalse.testPositive1()
    is_false(false, "false is still false :)")
end

function TestAssertionIsFalse.testPositive2()
    is_false(1~=1, "inequality")
end

function TestAssertionIsFalse.testPositive3()
    is_false(1~=1, "")
end

function TestAssertionIsFalse.testNegative1()
    is_false(true, "(expected) true is definitely not false")
end

function TestAssertionIsFalse.testNegative2()
    is_false(1==1, "(expected) equals!")
end

function TestAssertionIsFalse.testNegative3()
    is_false()
end

function TestAssertionIsFalse.testNegative4()
    is_false(1==1)
end

function TestAssertionIsFalse.testNegative5()
    is_false(1==1, nil)
end

function TestAssertionIsFalse.testNegative6()
    is_false(nil, "What's wrong?")
end

