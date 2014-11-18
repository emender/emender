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



--
-- Verify that the function accepts boolean and string as its arguments:
--
function TestAssertionIsTrue.testPositive01()
    is_true(true, "true is still true :)")
end



--
-- Verify that the function accepts boolean and string as its arguments:
--
function TestAssertionIsTrue.testPositive02()
    is_true(1 == 1, "equality")
end



--
-- Verify that the function accepts boolean and empty string as its arguments:
--
function TestAssertionIsTrue.testPositive03()
    is_true(1 == 1, "")
end



--
-- Verify that two numbers could be compared:
--
function TestAssertionIsTrue.testPositive04()
    is_true(42 == 42, "numbers could be compared")
end



--
-- Verify that two strings could be compared:
--
function TestAssertionIsTrue.testPositive05()
    is_true("xyzzy" == "xyzzy", "strings could be compared")
end



--
-- Verify that two nils could be compared:
--
function TestAssertionIsTrue.testPositive06()
    is_true(nil == nil, "even nils could be compared")
end



--
-- Basic negative test.
--
function TestAssertionIsTrue.testNegative01()
    is_true(false, "(expected) false is definitely not true")
end



--
-- Basic negative test.
--
function TestAssertionIsTrue.testNegative02()
    is_true(1 ~= 1, "(expected) false is definitely not true")
end



--
-- Basic negative test.
--
function TestAssertionIsTrue.testNegative03()
    is_true("aaa" ~= "aaa", "(expected) false is definitely not true")
end



--
-- Basic negative test.
--
function TestAssertionIsTrue.testNegative04()
    is_true(1==2, "(expected) not equals!")
end



--
-- Basic negative test.
--
function TestAssertionIsTrue.testNegative05()
    is_true(nil==1, "(expected) not equals!")
end



--
-- Verify that the function requires at least one argument:
--
function TestAssertionIsTrue.testNegative06()
    is_true()
end



--
-- Verify that the function does not accept an nil as the first argument:
--
function TestAssertionIsTrue.testNegative07()
    is_true(nil, "What's wrong?")
end



--
-- Verify that the function requires at least two arguments:
--
function TestAssertionIsTrue.testNegative08()
    is_true(1==1)
end



--
-- Verify that the function does not accept an integer as the first argument:
--
function TestAssertionIsTrue.testNegative09()
    is_true(42, "42 is not a valid expression")
end



--
-- Verify that the function does not accept a real number as the first argument:
--
function TestAssertionIsTrue.testNegative10()
    is_true(42.1, "42.1 is not a valid expression")
end



--
-- Verify that the function does not accept an empty table as the first argument:
--
function TestAssertionIsTrue.testNegative11()
    is_true({}, "{} is not a valid expression")
end



--
-- Verify that the function does not accept a table as the first argument:
--
function TestAssertionIsTrue.testNegative12()
    is_true({1,2,3}, "{1,2,3} is not a valid expression")
end



--
-- Verify that the function does not accept nested table as the first argument:
--
function TestAssertionIsTrue.testNegative13()
    is_true({{{1},2},3}, "{{{1},2},3} is not a valid expression")
end



--
-- Verify that the function does not accept a hash table as an argument:
--
function TestAssertionIsTrue.testNegative14()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_true(table1, "hash table is not a valid expression")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsTrue.testNegative15()
    is_true(print, "function is not a valid expression")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsTrue.testNegative16()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_true() function with the function as its argument
    is_true(func, "function is not a valid expression")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsTrue.testNegative17()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_true() function with the closure as its argument
    is_true(closure, "closure is not a valid expression")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsTrue.testNegative18()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_true() function with the coroutine as its argument
    is_true(func, "coroutine is not a valid expression")
end



--
-- Verify that the function does not accept an nil as a second argument:
--
function TestAssertionIsTrue.testNegative19()
    is_true(true, nil)
end



--
-- Verify that the function does not accept an integer as a second argument:
--
function TestAssertionIsTrue.testNegative20()
    is_true(true, 42)
end



--
-- Verify that the function does not accept real number as a second argument:
--
function TestAssertionIsTrue.testNegative21()
    is_true(true, 42.1)
end



--
-- Verify that the function does not accept an empty table as second argument:
--
function TestAssertionIsTrue.testNegative22()
    is_true(true, {})
end



--
-- Verify that the function does not accept a table as second argument:
--
function TestAssertionIsTrue.testNegative23()
    is_true(true, {1,2,3})
end



--
-- Verify that the function does not accept nested table as second argument:
--
function TestAssertionIsTrue.testNegative24()
    is_true(true, {{{1},2},3})
end



--
-- Verify that the function does not accept a hash table as an argument:
--
function TestAssertionIsTrue.testNegative25()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_true(true, table1)
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsTrue.testNegative26()
    is_true(true, print)
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsTrue.testNegative27()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_true() function with the function as its argument
    is_true(true, func)
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsTrue.testNegative28()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_true() function with the closure as its argument
    is_true(true, closure)
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsTrue.testNegative29()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_true() function with the coroutine as its argument
    is_true(true, func)
end

