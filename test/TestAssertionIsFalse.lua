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



--
-- Verify that the function accepts boolean and string as its arguments:
--
function TestAssertionIsFalse.testPositive01()
    is_false(false, "false is still false :)")
end



--
-- Verify that the function accepts boolean and string as its arguments:
--
function TestAssertionIsFalse.testPositive02()
    is_false(1 ~= 1, "inequality")
end



--
-- Verify that the function accepts boolean and empty string as its arguments:
--
function TestAssertionIsFalse.testPositive03()
    is_false(1 ~= 1, "")
end



--
-- Verify that two numbers could be compared:
--
function TestAssertionIsFalse.testPositive04()
    is_false(42 ~= 42, "numbers could be compared")
end



--
-- Verify that two strings could be compared:
--
function TestAssertionIsFalse.testPositive05()
    is_false("xyzzy" ~= "xyzzy", "strings could be compared")
end



--
-- Verify that two nils could be compared:
--
function TestAssertionIsFalse.testPositive06()
    is_false(nil ~= nil, "even nils could be compared")
end



--
-- Basic negative test.
--
function TestAssertionIsFalse.testNegative01()
    is_false(true, "(expected) true is definitely not false")
end



--
-- Basic negative test.
--
function TestAssertionIsFalse.testNegative02()
    is_false(1 == 1, "(expected) equals!")
end



--
-- Basic negative test.
--
function TestAssertionIsFalse.testNegative03()
    is_false("aaa" == "aaa", "(expected) equals!")
end



--
-- Basic negative test.
--
function TestAssertionIsFalse.testNegative04()
    is_false(1 ~= 2, "(expected) equals!")
end



--
-- Basic negative test.
--
function TestAssertionIsFalse.testNegative05()
    is_false(nil==nil, "(expected) equals!")
end



--
-- Verify that the function requires at least one argument:
--
function TestAssertionIsFalse.testNegative06()
    is_false()
end



--
-- Verify that the function does not accept an nil as the first argument:
--
function TestAssertionIsFalse.testNegative07()
    is_false(nil, "What's wrong?")
end



--
-- Verify that the function requires at least two arguments:
--
function TestAssertionIsFalse.testNegative08()
    is_false(1==1)
end



--
-- Verify that the function does not accept an integer as the first argument:
--
function TestAssertionIsFalse.testNegative09()
    is_false(42, "42 is not a valid expression")
end



--
-- Verify that the function does not accept a real number as the first argument:
--
function TestAssertionIsFalse.testNegative10()
    is_false(42.1, "42.1 is not a valid expression")
end



--
-- Verify that the function does not accept an empty table as the first argument:
--
function TestAssertionIsFalse.testNegative11()
    is_false({}, "{} is not a valid expression")
end



--
-- Verify that the function does not accept a table as the first argument:
--
function TestAssertionIsFalse.testNegative12()
    is_false({1,2,3}, "{1,2,3} is not a valid expression")
end



--
-- Verify that the function does not accept nested table as the first argument:
--
function TestAssertionIsFalse.testNegative13()
    is_false({{{1},2},3}, "{{{1},2},3} is not a valid expression")
end



--
-- Verify that the function does not accept a hash table as an argument:
--
function TestAssertionIsFalse.testNegative14()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_false(table1, "hash table is not a valid expression")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsFalse.testNegative15()
    is_false(print, "function is not a valid expression")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsFalse.testNegative16()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_false() function with the function as its argument
    is_false(func, "function is not a valid expression")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsFalse.testNegative17()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_false() function with the closure as its argument
    is_false(closure, "closure is not a valid expression")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsFalse.testNegative18()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_false() function with the coroutine as its argument
    is_false(func, "coroutine is not a valid expression")
end



--
-- Verify that the function does not accept an nil as a second argument:
--
function TestAssertionIsFalse.testNegative19()
    is_false(false, nil)
end



--
-- Verify that the function does not accept an integer as a second argument:
--
function TestAssertionIsFalse.testNegative20()
    is_false(false, 42)
end



--
-- Verify that the function does not accept real number as a second argument:
--
function TestAssertionIsFalse.testNegative21()
    is_false(false, 42.1)
end



--
-- Verify that the function does not accept an empty table as second argument:
--
function TestAssertionIsFalse.testNegative22()
    is_false(false, {})
end



--
-- Verify that the function does not accept a table as second argument:
--
function TestAssertionIsFalse.testNegative23()
    is_false(false, {1,2,3})
end



--
-- Verify that the function does not accept nested table as second argument:
--
function TestAssertionIsFalse.testNegative24()
    is_false(false, {{{1},2},3})
end



--
-- Verify that the function does not accept a hash table as an argument:
--
function TestAssertionIsFalse.testNegative25()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_false(false, table1)
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsFalse.testNegative26()
    is_false(false, print)
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsFalse.testNegative27()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_false() function with the function as its argument
    is_false(false, func)
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsFalse.testNegative28()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_false() function with the closure as its argument
    is_false(false, closure)
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsFalse.testNegative29()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_false() function with the coroutine as its argument
    is_false(false, func)
end

