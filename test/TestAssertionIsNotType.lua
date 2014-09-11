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

TestAssertionIsNotType = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_not_type().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsNotType.testPositive01()
    is_not_type("xyzzy", "number", "positive test")
end

function TestAssertionIsNotType.testPositive02()
    is_not_type("xyzzy", "function", "positive test")
end

function TestAssertionIsNotType.testPositive03()
    is_not_type("xyzzy", "boolean", "positive test")
end

function TestAssertionIsNotType.testPositive04()
    is_not_type("xyzzy", "nil", "positive test")
end

function TestAssertionIsNotType.testPositive05()
    is_not_type(42, "string", "positive test")
end

function TestAssertionIsNotType.testPositive06()
    is_not_type(42, "function", "positive test")
end

function TestAssertionIsNotType.testPositive07()
    is_not_type(42, "boolean", "positive test")
end

function TestAssertionIsNotType.testPositive08()
    is_not_type(42, "nil", "positive test")
end

function TestAssertionIsNotType.testPositive09()
    is_not_type(print, "string", "positive test")
end

function TestAssertionIsNotType.testPositive10()
    is_not_type(print, "number", "positive test")
end

function TestAssertionIsNotType.testPositive11()
    is_not_type(print, "boolean", "positive test")
end

function TestAssertionIsNotType.testPositive12()
    is_not_type(print, "nil", "positive test")
end

function TestAssertionIsNotType.testPositive13()
    is_not_type(true, "string", "positive test")
end

function TestAssertionIsNotType.testPositive14()
    is_not_type(true, "number", "positive test")
end

function TestAssertionIsNotType.testPositive15()
    is_not_type(true, "function", "positive test")
end

function TestAssertionIsNotType.testPositive16()
    is_not_type(true, "nil", "positive test")
end

function TestAssertionIsNotType.testPositive17()
    is_not_type(false, "string", "positive test")
end

function TestAssertionIsNotType.testPositive18()
    is_not_type(false, "number", "positive test")
end

function TestAssertionIsNotType.testPositive19()
    is_not_type(false, "function", "positive test")
end

function TestAssertionIsNotType.testPositive20()
    is_not_type(false, "nil", "positive test")
end

function TestAssertionIsNotType.testPositive21()
    is_not_type(nil, "string", "positive test")
end

function TestAssertionIsNotType.testPositive22()
    is_not_type(nil, "number", "positive test")
end

function TestAssertionIsNotType.testPositive23()
    is_not_type(nil, "function", "positive test")
end

function TestAssertionIsNotType.testPositive24()
    is_not_type(nil, "boolean", "positive test")
end

function TestAssertionIsNotType.testNegative01()
    is_not_type()
end

function TestAssertionIsNotType.testNegative02()
    is_not_type(nil)
end

function TestAssertionIsNotType.testNegative03()
    is_not_type("string")
end

function TestAssertionIsNotType.testNegative04()
    is_not_type("string", nil)
end

function TestAssertionIsNotType.testNegative05()
    is_not_type("string", "string")
end

function TestAssertionIsNotType.testNegative06()
    is_not_type("string", "string", nil)
end

function TestAssertionIsNotType.testNegative07()
    is_not_type("xyzzy", "string", "negative test")
end

function TestAssertionIsNotType.testNegative08()
    is_not_type(42, "number", "negative test")
end

function TestAssertionIsNotType.testNegative09()
    is_not_type(42.1, "number", "negative test")
end

function TestAssertionIsNotType.testNegative10()
    is_not_type(print, "function", "negative test")
end

function TestAssertionIsNotType.testNegative11()
    is_not_type(true, "boolean", "negative test")
end

function TestAssertionIsNotType.testNegative12()
    is_not_type(false, "boolean", "negative test")
end

function TestAssertionIsNotType.testNegative13()
    local x = nil
    is_not_type(x, "nil", "negative test")
end

function TestAssertionIsNotType.testNegative14()
    is_not_type(nil, 42, "negative test")
end
