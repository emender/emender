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

function TestAssertionIsUnlike.testPositive01()
    is_unlike("xyzzy", "a", "positive test")
end

function TestAssertionIsUnlike.testPositive02()
    is_unlike("a", "xyzzy", "positive test")
end

function TestAssertionIsUnlike.testPositive03()
    is_unlike("xyzzy", "aaa", "positive test")
end

function TestAssertionIsUnlike.testPositive04()
    is_unlike("12345", "%a", "positive test")
end

function TestAssertionIsUnlike.testPositive05()
    is_unlike("abcde", "%d+", "positive test")
end

function TestAssertionIsUnlike.testPositive06()
    is_unlike("12345", "[a-b]+", "positive test")
end

function TestAssertionIsUnlike.testPositive07()
    is_unlike("x", "[0-9]+", "positive test")
end

function TestAssertionIsUnlike.testPositive08()
    is_unlike("", "[0-9]+", "positive test")
end

function TestAssertionIsUnlike.testPositive09()
    is_unlike("", "%d+", "positive test")
end

function TestAssertionIsUnlike.testNegative01()
    is_unlike()
end

function TestAssertionIsUnlike.testNegative02()
    is_unlike(nil)
end

function TestAssertionIsUnlike.testNegative03()
    is_unlike("string")
end

function TestAssertionIsUnlike.testNegative04()
    is_unlike("string", nil)
end

function TestAssertionIsUnlike.testNegative05()
    is_unlike("string", "string")
end

function TestAssertionIsUnlike.testNegative06()
    is_unlike("string", "string", nil)
end

function TestAssertionIsUnlike.testNegative07()
    is_unlike("aaa", "[0-9]*", "(expected) negative test")
end

function TestAssertionIsUnlike.testNegative08()
    is_unlike("aaa", "%d*", "(expected) negative test")
end

function TestAssertionIsUnlike.testNegative09()
    is_unlike("123", "%a*", "(expected) negative test")
end

