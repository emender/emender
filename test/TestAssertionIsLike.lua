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



--
-- Verify that "x" matches "xyzzy".
--
function TestAssertionIsLike.testPositive01()
    is_like("xyzzy", "x", "positive test")
end



--
-- Verify that "xyzzy" matches "xyzzy".
--
function TestAssertionIsLike.testPositive02()
    is_like("xyzzy", "xyzzy", "positive test")
end



--
-- Verify that "zz" matches "xyzzy".
--
function TestAssertionIsLike.testPositive03()
    is_like("xyzzy", "zz", "positive test")
end



--
-- Verify that "%d" matches "12345".
--
function TestAssertionIsLike.testPositive04()
    is_like("12345", "%d", "positive test")
end



--
-- Verify that "%d+" matches "12345".
--
function TestAssertionIsLike.testPositive05()
    is_like("12345", "%d+", "positive test")
end



--
-- Verify that "[0-9]*" matches "12345".
--
function TestAssertionIsLike.testPositive06()
    is_like("12345", "[0-9]*", "positive test")
end



--
-- Verify that "[0-9]*" matches "1".
--
function TestAssertionIsLike.testPositive07()
    is_like("", "[0-9]*", "positive test")
end



--
-- Verify that "[0-9]*" matches "".
--
function TestAssertionIsLike.testPositive08()
    is_like("", "[0-9]*", "positive test")
end



--
-- Verify that "%a" matches "abc".
--
function TestAssertionIsLike.testPositive09()
    is_like("abc", "%a", "positive test")
end



--
-- Verify that "%a*" matches "abc".
--
function TestAssertionIsLike.testPositive10()
    is_like("abc", "%a*", "positive test")
end



--
-- Verify that "%a+" matches "abc".
--
function TestAssertionIsLike.testPositive11()
    is_like("abc", "%a+", "positive test")
end



--
-- Verify that "%l" matches "abc".
--
function TestAssertionIsLike.testPositive12()
    is_like("abc", "%l", "positive test")
end



--
-- Verify that "%l*" matches "abc".
--
function TestAssertionIsLike.testPositive13()
    is_like("abc", "%l*", "positive test")
end



--
-- Verify that "%l+" matches "abc".
--
function TestAssertionIsLike.testPositive14()
    is_like("abc", "%l+", "positive test")
end



function TestAssertionIsLike.testNegative01()
    is_like()
end

function TestAssertionIsLike.testNegative02()
    is_like(nil)
end

function TestAssertionIsLike.testNegative03()
    is_like("string")
end

function TestAssertionIsLike.testNegative04()
    is_like("string", nil)
end

function TestAssertionIsLike.testNegative05()
    is_like("string", "string")
end

function TestAssertionIsLike.testNegative06()
    is_like("string", "string", nil)
end

function TestAssertionIsLike.testNegative07()
    is_like("", "a", "(expected) negative test")
end

function TestAssertionIsLike.testNegative08()
    is_like("", "[0-9]+", "(expected) negative test")
end

function TestAssertionIsLike.testNegative09()
    is_like("", "%d", "(expected) negative test")
end

function TestAssertionIsLike.testNegative10()
    is_like("", "%d+", "(expected) negative test")
end

