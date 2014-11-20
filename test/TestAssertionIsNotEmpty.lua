-- TestAssertionIsNotEmpty.lua - test the behavior of the asserts.is_not_empty() function
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

TestAssertionIsNotEmpty = {
    metadata = {
        description = "Test the behavior of the asserts.is_not_empty() function.",
        authors = "Jaromir Hradilek, Pavel Tisnovsky",
        emails = "jhradilek@redhat.com, ptisnovs@redhat.com",
        changed = "2014-11-18",
        tags = {"BasicTest", "SmokeTest"}
    }
}



--
-- Verify that the function recognizes a table with items in it:
--
function TestAssertionIsNotEmpty.testPositive01()
    is_not_empty({1}, "table is not empty")
end



--
-- Verify that the function recognizes a nested table with items in it:
--
function TestAssertionIsNotEmpty.testPositive02()
    is_not_empty({{}}, "nested table is not empty")
end



--
-- Verify that the function recognizes a nested table with items in it:
--
function TestAssertionIsNotEmpty.testPositive03()
    is_not_empty({{1}}, "nested table is not empty")
end



--
-- Verify that the function recognizes a nested table with items in it:
--
function TestAssertionIsNotEmpty.testPositive04()
    is_not_empty({{}, {}}, "nested table is not empty")
end



--
-- Verify that the function recognizes a table with items in it:
--
function TestAssertionIsNotEmpty.testPositive05()
    is_not_empty({nil, 1}, "this table is not empty")
end



--
-- Verify that the function recognizes a table with items in it:
--
function TestAssertionIsNotEmpty.testPositive06()
    is_not_empty({1, nil}, "this table is not empty")
end



--
-- Verify that the function recognizes a (non empty) table:
--
function TestAssertionIsNotEmpty.testPositive07()
    is_not_empty({1,2,3}, "table is not empty")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNotEmpty.testPositive08()
    is_not_empty({{{1},2},3}, "nested table is not empty")
end



--
-- Verify that the function recognizes a hash table as an argument:
--
function TestAssertionIsNotEmpty.testPositive09()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_not_empty(table1, "hash table is not empty")
end



--
-- Verify that the function does not accept only one argument:
--
function TestAssertionIsNotEmpty.testNegative01()
    is_not_empty("the function expects two arguments")
end



--
-- Verify that the function does not accept zero arguments:
--
function TestAssertionIsNotEmpty.testNegative02()
    is_not_empty()
end



--
-- Verify that the function recognizes an empty table:
--
function TestAssertionIsNotEmpty.testNegative03()
    is_not_empty({}, "(expected) table is empty")
end



--
-- Verify that the function recognizes nil:
--
function TestAssertionIsNotEmpty.testNegative04()
    is_not_empty(nil, "nil is not a table")
end



--
-- Verify that the function recognizes a Boolean:
--
function TestAssertionIsNotEmpty.testNegative05()
    is_not_empty(true, "true is not a table")
end



--
-- Verify that the function recognizes a Boolean:
--
function TestAssertionIsNotEmpty.testNegative06()
    is_not_empty(false, "false is not a table")
end



--
-- Verify that the function recognizes a number:
--
function TestAssertionIsNotEmpty.testNegative07()
    is_not_empty(0, "zero is not a table")
end



--
-- Verify that the function recognizes a string:
--
function TestAssertionIsNotEmpty.testNegative08()
    is_not_empty("", "string is not empty")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsNotEmpty.testNegative09()
    is_not_empty(print, "function is definitely not empty")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsNotEmpty.testNegative10()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_not_empty() function with the function as its argument
    is_not_empty(func, "function is definitely not empty")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsNotEmpty.testNegative11()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_not_empty() function with the closure as its argument
    is_not_empty(closure, "closure is definitely not empty")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsNotEmpty.testNegative12()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_not_empty() function with the coroutine as its argument
    is_not_empty(func, "coroutine is definitely not empty")
end

