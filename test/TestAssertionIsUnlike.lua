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
        changed = "2014-12-18",
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
    is_unlike("xyzzy", "111", "positive test")
end

function TestAssertionIsUnlike.testPositive05()
    is_unlike("", "111", "positive test")
end

-- We need to check all the following character classes:
-- %a    letters
-- %c    control characters
-- %d    digits
-- %l    lower case letters
-- %p    punctuation characters
-- %s    space characters
-- %u    upper case letters
-- %w    alphanumeric characters
-- %x    hexadecimal digits
-- %z    the character with representation 0

function TestAssertionIsUnlike.testPositive06()
    is_unlike("12345", "%a", "positive test")
end

function TestAssertionIsUnlike.testPositive07()
    is_unlike("12345", "%a%a", "positive test")
end

function TestAssertionIsUnlike.testPositive08()
    is_unlike("12345", "%a+", "positive test")
end

function TestAssertionIsUnlike.testPositive09()
    is_unlike("12345", "%a%a*", "positive test")
end

function TestAssertionIsUnlike.testPositive10()
    is_unlike("12345", "%a%a-", "positive test")
end

function TestAssertionIsUnlike.testPositive11()
    is_unlike("\0", "%a", "positive test")
end

function TestAssertionIsUnlike.testPositive12()
    is_unlike("\0", "%a%a", "positive test")
end

function TestAssertionIsUnlike.testPositive13()
    is_unlike("\0", "%a+", "positive test")
end

function TestAssertionIsUnlike.testPositive14()
    is_unlike("\0", "%a%a*", "positive test")
end

function TestAssertionIsUnlike.testPositive15()
    is_unlike("\0", "%a%a-", "positive test")
end

function TestAssertionIsUnlike.testPositive16()
    is_unlike("12345", "%c", "positive test")
end

function TestAssertionIsUnlike.testPositive17()
    is_unlike("12345", "%c%c", "positive test")
end

function TestAssertionIsUnlike.testPositive18()
    is_unlike("12345", "%c+", "positive test")
end

function TestAssertionIsUnlike.testPositive19()
    is_unlike("12345", "%c%c*", "positive test")
end

function TestAssertionIsUnlike.testPositive20()
    is_unlike("12345", "%c%c-", "positive test")
end

function TestAssertionIsUnlike.testPositive21()
    is_unlike("abcde", "%c", "positive test")
end

function TestAssertionIsUnlike.testPositive22()
    is_unlike("abcde", "%c%c", "positive test")
end

function TestAssertionIsUnlike.testPositive23()
    is_unlike("abcde", "%c+", "positive test")
end

function TestAssertionIsUnlike.testPositive24()
    is_unlike("abcde", "%c%c*", "positive test")
end

function TestAssertionIsUnlike.testPositive25()
    is_unlike("abcde", "%c%c-", "positive test")
end



--[[
function TestAssertionIsUnlike.testPositive11()
    is_unlike("12345", "[a-b]+", "positive test")
end

function TestAssertionIsUnlike.testPositive12()
    is_unlike("x", "[0-9]+", "positive test")
end

function TestAssertionIsUnlike.testPositive13()
    is_unlike("", "[0-9]+", "positive test")
end

function TestAssertionIsUnlike.testPositive14()
    is_unlike("", "%d+", "positive test")
end
--]]



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsUnlike.testNegative01()
    is_unlike()
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsUnlike.testNegative02()
    is_unlike(nil)
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsUnlike.testNegative03()
    is_unlike("string")
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsUnlike.testNegative04()
    is_unlike("string", nil)
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsUnlike.testNegative05()
    is_unlike("string", "string")
end



--
-- Negative test - wrong type of the last parameter.
--
function TestAssertionIsUnlike.testNegative06()
    is_unlike("string", "string", nil)
end



--
-- Negative test - wrong type of the first parameter.
--
function TestAssertionIsUnlike.testNegative07()
    is_unlike(nil, "string", "")
end


--
-- Negative test - wrong assertion.
--
function TestAssertionIsUnlike.testNegative08()
    is_unlike("1", "%d", "(expected) negative test")
end



--
-- Negative test - wrong assertion.
--
function TestAssertionIsUnlike.testNegative09()
    is_unlike("1", "[0-9]+", "(expected) negative test")
end



--
-- Negative test - wrong assertion.
--
function TestAssertionIsUnlike.testNegative10()
    is_unlike("x", "%a", "(expected) negative test")
end



--
-- Negative test - wrong assertion.
--
function TestAssertionIsUnlike.testNegative11()
    is_unlike("\0", "%z", "(expected) negative test")
end



--
-- Verify that the function does not accept an integer as the first argument:
--
function TestAssertionIsUnlike.testNegative12()
    is_unlike("abcd", "%x", "(expected) negative test")
end



--
-- Verify that the function does not accept a real number as the first argument:
--
function TestAssertionIsUnlike.testNegative13()
    is_unlike("1234", "%x", "(expected) negative test")
end



--
-- Verify that the function does not accept an empty table as the first argument:
--
function TestAssertionIsUnlike.testNegative14()
    is_unlike({}, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a table as the first argument:
--
function TestAssertionIsUnlike.testNegative15()
    is_unlike({1,2,3}, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept nested table as the first argument:
--
function TestAssertionIsUnlike.testNegative16()
    is_unlike({{{1},2},3}, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a hash table as an argument:
--
function TestAssertionIsUnlike.testNegative17()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_unlike(table1, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsUnlike.testNegative18()
    is_unlike(print, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsUnlike.testNegative19()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_unlike() function with the function as its argument
    is_unlike(func, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsUnlike.testNegative20()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_unlike() function with the closure as its argument
    is_unlike(closure, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsUnlike.testNegative21()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_unlike() function with the coroutine as its argument
    is_unlike(func, "a", "coroutine is not a valid expression")
end



