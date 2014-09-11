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

TestAssertionIsType = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_type().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsType.testPositive1()
    is_type("xyzzy", "string", "positive test")
end

function TestAssertionIsType.testPositive2()
    is_type(42, "number", "positive test")
end

function TestAssertionIsType.testPositive3()
    is_type(42.1, "number", "positive test")
end

function TestAssertionIsType.testPositive4()
    is_type(print, "function", "positive test")
end

function TestAssertionIsType.testPositive5()
    is_type(true, "boolean", "positive test")
end

function TestAssertionIsType.testPositive6()
    is_type(false, "boolean", "positive test")
end

function TestAssertionIsType.testPositive7()
    local x = nil
    is_type(x, "nil", "positive test")
end

function TestAssertionIsType.testPositive8()
    local x = {1,2,3}
    is_type(x, "table", "positive test")
end

function TestAssertionIsType.testPositive9()
    local x = coroutine.create(function ()
           print(42)
         end)
    is_type(x, "thread", "positive test")
end

function TestAssertionIsType.testNegative01()
    is_type()
end

function TestAssertionIsType.testNegative02()
    is_type(nil)
end

function TestAssertionIsType.testNegative03()
    is_type("string")
end

function TestAssertionIsType.testNegative04()
    is_type("string", nil)
end

function TestAssertionIsType.testNegative05()
    is_type("string", "string")
end

function TestAssertionIsType.testNegative06()
    is_type("string", "string", nil)
end

function TestAssertionIsType.testNegative07()
    is_type("xyzzy", "number", "negative test")
end

function TestAssertionIsType.testNegative08()
    is_type("xyzzy", "function", "negative test")
end

function TestAssertionIsType.testNegative09()
    is_type("xyzzy", "boolean", "negative test")
end

function TestAssertionIsType.testNegative10()
    is_type("xyzzy", "nil", "negative test")
end

function TestAssertionIsType.testNegative11()
    is_type(42, "string", "negative test")
end

function TestAssertionIsType.testNegative12()
    is_type(42, "function", "negative test")
end

function TestAssertionIsType.testNegative13()
    is_type(42, "boolean", "negative test")
end

function TestAssertionIsType.testNegative14()
    is_type(42, "nil", "negative test")
end

function TestAssertionIsType.testNegative15()
    is_type(print, "string", "negative test")
end

function TestAssertionIsType.testNegative16()
    is_type(print, "number", "negative test")
end

function TestAssertionIsType.testNegative17()
    is_type(print, "boolean", "negative test")
end

function TestAssertionIsType.testNegative18()
    is_type(print, "nil", "negative test")
end

function TestAssertionIsType.testNegative19()
    is_type(true, "string", "negative test")
end

function TestAssertionIsType.testNegative20()
    is_type(true, "number", "negative test")
end

function TestAssertionIsType.testNegative21()
    is_type(true, "function", "negative test")
end

function TestAssertionIsType.testNegative22()
    is_type(true, "nil", "negative test")
end

function TestAssertionIsType.testNegative23()
    is_type(false, "string", "negative test")
end

function TestAssertionIsType.testNegative24()
    is_type(false, "number", "negative test")
end

function TestAssertionIsType.testNegative25()
    is_type(false, "function", "negative test")
end

function TestAssertionIsType.testNegative26()
    is_type(false, "nil", "negative test")
end

function TestAssertionIsType.testNegative27()
    is_type(nil, "string", "negative test")
end

function TestAssertionIsType.testNegative28()
    is_type(nil, "number", "negative test")
end

function TestAssertionIsType.testNegative29()
    is_type(nil, "function", "negative test")
end

function TestAssertionIsType.testNegative30()
    is_type(nil, "boolean", "negative test")
end

function TestAssertionIsType.testNegative31()
    is_type(nil, 42, "negative test")
end
