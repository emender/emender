-- TestAssertionPass.lua - test the behavior of the asserts.pass() function
-- Copyright (C) 2014 Jaromir Hradilek, Pavel Tisnovsky

-- This file is part of Emender.

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

TestAssertionPass = {
    metadata = {
        description = "Test the behavior of the asserts.pass() function.",
        authors = "Jaromir Hradilek, Pavel Tisnovsky",
        emails = "jhradilek@redhat.com, ptisnovs@redhat.com",
        changed = "2014-09-22",
        tags = {"BasicTest"}
    }
}

-- Verify that the function accepts a string as its argument:
function TestAssertionPass.testPositive01()
    pass("The pass() function expects a string as its argument.")
end

-- Verify that the function requires at least one argument:
function TestAssertionPass.testNegative01()
    pass()
end

-- Verify that the function does not accept nil as an argument:
function TestAssertionPass.testNegative02()
    pass(nil)
end

-- Verify that the function does not accept a boolean as an argument:
function TestAssertionPass.testNegative03()
    pass(true)
end

-- Verify that the function does not accept a boolean as an argument:
-- (and "false" sometimes has the same meaning as "nil", so check it)
function TestAssertionPass.testNegative04()
    pass(false)
end

-- Verify that the function does not accept an integer as an argument:
function TestAssertionPass.testNegative05()
    pass(42)
end

-- Verify that the function does not accept a real number as an argument:
function TestAssertionPass.testNegative06()
    pass(42.1)
end

-- Verify that the function does not accept a table as an argument:
function TestAssertionPass.testNegative07()
    pass({1,2,3})
end

-- Verify that the function does not accept a standard function as an argument:
function TestAssertionPass.testNegative08()
    pass(print)
end

-- Verify that the function does not accept an user defined function as an argument:
function TestAssertionPass.testNegative09()
    local func = function()
        return 42
    end
    pass(func)
end

-- Verify that the function does not accept a closure as an argument:
function TestAssertionPass.testNegative10()
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    pass(closure)
end

-- Verify that the function does not accept a coroutine as an argument:
function TestAssertionPass.testNegative11()
    local func = coroutine.create(function ()
           print(42)
         end)
    pass(func)
end

