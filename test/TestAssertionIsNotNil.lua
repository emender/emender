-- TestAssertionIsNotNil.lua - test the behavior of the asserts.is_not_nil() function
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

TestAssertionIsNotNil = {
    metadata = {
        description = "Test the behavior of the asserts.is_not_nil() function.",
        authors = "Jaromir Hradilek, Pavel Tisnovsky",
        emails = "jhradilek@redhat.com, ptisnovs@redhat.com",
        changed = "2014-11-19",
        tags = {"BasicTest", "SmokeTest"}
    }
}



--
-- Verify that the function correctly recognizes a Boolean:
--
function TestAssertionIsNotNil.testPositive01()
    is_not_nil(true, "true is not nil")
end



--
-- Verify that the function correctly recognizes a Boolean:
--
function TestAssertionIsNotNil.testPositive02()
    is_not_nil(false, "false is not nil")
end


--
-- Verify that the function correctly recognizes a number:
--
function TestAssertionIsNotNil.testPositive03()
    is_not_nil(0, "zero is not nil")
end



--
-- Verify that the function correctly recognizes a string:
--
function TestAssertionIsNotNil.testPositive04()
    is_not_nil("", "string is not nil")
end



--
-- Verify that the function correctly recognizes a table:
--
function TestAssertionIsNotNil.testPositive05()
    is_not_nil({}, "table is not nil")
end



--
-- Verify that the function correctly recognizes a table:
--
function TestAssertionIsNotNil.testPositive06()
    is_not_nil({1,2,3}, "(expected) table is not nil")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNotNil.testPositive07()
    is_not_nil({{{1},2},3}, "(expected) nested table is not nil")
end



--
-- Verify that the function recognizes a hash table as an argument:
--
function TestAssertionIsNotNil.testNegative08()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_not_nil(table1, "(expected) hash table is not nil")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsNotNil.testPositive09()
    is_not_nil(print, "(expected) function is definitely not nil")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsNotNil.testPositive10()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_not_nil() function with the function as its argument
    is_not_nil(func, "(expected) function is definitely not nil")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsNotNil.testPositive11()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_not_nil() function with the closure as its argument
    is_not_nil(closure, "(expected) closure is definitely not nil")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsNotNil.testPositive12()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_not_nil() function with the coroutine as its argument
    is_not_nil(func, "(expected) coroutine is definitely not nil")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNotNil.testPositive13()
    is_not_nil({nil}, "(expected) nested table is not nil")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsNotNil.testPositive14()
    is_not_nil({{nil}}, "(expected) deeply nested table is not nil")
end



--
-- Verify that the function does not accept one argument:
--
function TestAssertionIsNotNil.testNegative01()
    is_not_nil("the function expects two arguments")
end



--
-- Verify that the function does not accept zero arguments:
--
function TestAssertionIsNotNil.testNegative02()
    is_not_nil()
end



--
-- Verify that the function correctly recognizes nil as its first argument:
--
function TestAssertionIsNotNil.testNegative03()
    is_not_nil(nil, "(expected) nil is nil")
end

