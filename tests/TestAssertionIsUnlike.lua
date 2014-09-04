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

TestAssertionIsUnlike = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_unlike().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsUnlike.testPositive1()
    is_unlike("xyzzy", "a", "positive test")
end

function TestAssertionIsUnlike.testPositive2()
    is_unlike("a", "xyzzy", "positive test")
end

function TestAssertionIsUnlike.testPositive3()
    is_unlike("xyzzy", "aaa", "positive test")
end

function TestAssertionIsUnlike.testPositive4()
    is_unlike("12345", "%a", "positive test")
end

function TestAssertionIsUnlike.testPositive5()
    is_unlike("abcde", "%d+", "positive test")
end

function TestAssertionIsUnlike.testPositive6()
    is_unlike("12345", "[a-b]+", "positive test")
end

function TestAssertionIsUnlike.testPositive7()
    is_unlike("x", "[0-9]+", "positive test")
end

function TestAssertionIsUnlike.testPositive8()
    is_unlike("", "[0-9]+", "positive test")
end

function TestAssertionIsUnlike.testPositive9()
    is_unlike("", "%d+", "positive test")
end

function TestAssertionIsUnlike.testNegative1()
    is_unlike()
end

function TestAssertionIsUnlike.testNegative2()
    is_unlike(nil)
end

function TestAssertionIsUnlike.testNegative3()
    is_unlike("string")
end

function TestAssertionIsUnlike.testNegative4()
    is_unlike("string", nil)
end

function TestAssertionIsUnlike.testNegative5()
    is_unlike("string", "string")
end

function TestAssertionIsUnlike.testNegative6()
    is_unlike("string", "string", nil)
end

function TestAssertionIsUnlike.testNegative7()
    is_unlike("aaa", "[0-9]*", "(expected) negative test")
end

function TestAssertionIsUnlike.testNegative8()
    is_unlike("aaa", "%d*", "(expected) negative test")
end

function TestAssertionIsUnlike.testNegative9()
    is_unlike("123", "%a*", "(expected) negative test")
end

