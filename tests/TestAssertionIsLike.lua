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

TestAssertionIsLike = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_like().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsLike.testPositive1()
    is_like("xyzzy", "x", "positive test")
end

function TestAssertionIsLike.testPositive2()
    is_like("xyzzy", "xyzzy", "positive test")
end

function TestAssertionIsLike.testPositive3()
    is_like("xyzzy", "zz", "positive test")
end

function TestAssertionIsLike.testPositive4()
    is_like("12345", "%d", "positive test")
end

function TestAssertionIsLike.testPositive5()
    is_like("12345", "%d+", "positive test")
end

function TestAssertionIsLike.testPositive6()
    is_like("12345", "[0-9]*", "positive test")
end

function TestAssertionIsLike.testPositive7()
    is_like("", "[0-9]*", "positive test")
end

function TestAssertionIsLike.testNegative1()
    is_like()
end

function TestAssertionIsLike.testNegative2()
    is_like(nil)
end

function TestAssertionIsLike.testNegative3()
    is_like("string")
end

function TestAssertionIsLike.testNegative4()
    is_like("string", nil)
end

function TestAssertionIsLike.testNegative5()
    is_like("string", "string")
end

function TestAssertionIsLike.testNegative6()
    is_like("string", "string", nil)
end

function TestAssertionIsLike.testNegative7()
    is_like("", "a", "(expected) negative test")
end

function TestAssertionIsLike.testNegative8()
    is_like("", "[0-9]+", "(expected) negative test")
end

function TestAssertionIsLike.testNegative9()
    is_like("", "%d", "(expected) negative test")
end

function TestAssertionIsLike.testNegative10()
    is_like("", "%d+", "(expected) negative test")
end

