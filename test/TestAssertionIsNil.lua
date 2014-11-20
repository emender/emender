-- TestAssertionIsNil.lua - test the behavior of the asserts.is_nil() function
-- Copyright (C) 2014 Jaromir Hradilek, Pavel Tisnovsky
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

TestAssertionIsNil = {
    metadata = {
        description = "Test the behavior of the asserts.is_nil() function.",
        authors = "Jaromir Hradilek, Pavel Tisnovsky",
        emails = "jhradilek@redhat.com, ptisnovs@redhat.com",
        changed = "2014-11-19",
        tags = {"BasicTest", "SmokeTest"}
    }
}



--
-- Verify that the function correctly recognizes nil as its first argument:
--
function TestAssertionIsNil.testPositive01()
    is_nil(nil, "nil is still nil")
end



--
-- Verify that the function correctly recognizes nil as its first argument:
--
function TestAssertionIsNil.testPositive02()
    is_nil(nil, "")
end



--
-- Verify that the function does not accept one argument:
--
function TestAssertionIsNil.testNegative01()
    is_nil("the function expects two arguments")
end



--
-- Verify that the function does not accept zero arguments:
--
function TestAssertionIsNil.testNegative02()
    is_nil()
end



--
-- Verify that the function correctly recognizes a Boolean:
--
function TestAssertionIsNil.testNegative03()
    is_nil(true, "(expected) true is not nil")
end



--
-- Verify that the function correctly recognizes a Boolean:
--
function TestAssertionIsNil.testNegative04()
    is_nil(false, "(expected) false is not nil")
end



--
-- Verify that the function correctly recognizes a number:
--
function TestAssertionIsNil.testNegative05()
    is_nil(0, "(expected) zero is not nil")
end



--
-- Verify that the function correctly recognizes a string:
--
function TestAssertionIsNil.testNegative06()
    is_nil("", "(expected) string is not nil")
end



--
-- Verify that the function correctly recognizes a table:
--
function TestAssertionIsNil.testNegative07()
    is_nil({}, "(expected) table is not nil")
end



--
-- Verify that the function correctly recognizes a table:
--
function TestAssertionIsNil.testNegative08()
    is_nil({1,2,3}, "(expected) table is not nil")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNil.testNegative09()
    is_nil({{{1},2},3}, "(expected) nested table is not nil")
end



--
-- Verify that the function recognizes a hash table as an argument:
--
function TestAssertionIsNil.testNegative10()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_nil(table1, "(expected) hash table is not nil")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsNil.testNegative11()
    is_nil(print, "(expected) function is definitely not nil")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsNil.testNegative12()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_nil() function with the function as its argument
    is_nil(func, "(expected) function is definitely not nil")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsNil.testNegative13()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_nil() function with the closure as its argument
    is_nil(closure, "(expected) closure is definitely not nil")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsNil.testNegative14()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_nil() function with the coroutine as its argument
    is_nil(func, "(expected) coroutine is definitely not nil")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNil.testNegative15()
    is_nil({nil}, "(expected) nested table is not nil")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNil.testNegative16()
    is_nil({{nil}}, "(expected) deeply nested table is not nil")
end

