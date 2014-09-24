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

TestAssertionIsEqual = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_equal().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-09-23",
        tags = {"BasicTest"},
    },
}

--
-- Check if two boolean values "true" are equal.
--
function TestAssertionIsEqual.testPositive01()
    -- perform comparison
    is_equal(true, true, "positive equality test:two booleans")
end

--
-- Check if two boolean values "false" are equal.
--
function TestAssertionIsEqual.testPositive02()
    -- perform comparison
    is_equal(false, false, "positive equality test:two booleans")
end

--
-- Check if two integer values are equal.
--
function TestAssertionIsEqual.testPositive03()
    -- perform comparison
    is_equal(42, 42, "positive equality test: two integers")
end

--
-- Check if two float values are equal.
--
function TestAssertionIsEqual.testPositive04()
    -- perform comparison
    is_equal(3.14, 3.14, "positive equality test: two floats")
end

--
-- Check if two empty strings are equal.
--
function TestAssertionIsEqual.testPositive05()
    -- perform comparison
    is_equal("", "", "positive equality test: two empty strings")
end

--
-- Check if two non-empty strings are equal.
--
function TestAssertionIsEqual.testPositive06()
    -- perform comparison
    is_equal("x", "x", "positive equality test: two strings")
end

--
-- Check if two non-empty strings (containing special character) are equal.
--
function TestAssertionIsEqual.testPositive07()
    -- perform comparison
    is_equal("\n", "\n", "positive equality test: two strings")
end

--
-- Check if two empty tables are equal.
--
function TestAssertionIsEqual.testPositive08()
    -- perform comparison
    is_equal({}, {}, "positive equality test: two empty tables")
end

--
-- Check if two tables are equal.
--
function TestAssertionIsEqual.testPositive09()
    -- perform comparison
    is_equal({1,2}, {1,2}, "positive equality test: two tables, items are integers")
end

--
-- Check if two tables are equal.
--
function TestAssertionIsEqual.testPositive10()
    -- perform comparison
    is_equal({1,2,3,4}, {1,2,3,4}, "positive equality test: two tables, items are integers")
end

--
-- Check if two tables are equal.
--
function TestAssertionIsEqual.testPositive11()
    -- perform comparison
    is_equal({"x", "y"}, {"x", "y"}, "positive equality test: two tables, items are strings")
end

--
-- Check if two nested tables are equal.
--
function TestAssertionIsEqual.testPositive12()
    -- perform comparison
    is_equal({1,{2,3},4}, {1,{2,3},4}, "positive equality test: two nested tables")
end

--
-- Check if two nested tables are equal.
--
function TestAssertionIsEqual.testPositive13()
    -- perform comparison
    is_equal({1,{2,{3}},4}, {1,{2,{3}},4}, "positive equality test: two deeply nested tables")
end

--
-- Check if two nested tables are equal.
--
function TestAssertionIsEqual.testPositive14()
    local table1 = {"a",{"b",{"c",{"d", {"e"}}}}}
    local table2 = {"a",{"b",{"c",{"d", {"e"}}}}}
    -- perform comparison
    is_equal(table1, table2, "positive equality test: two deeply nested tables")
end

--
-- Check if two hash tables are equal.
--
function TestAssertionIsEqual.testPositive15()
    local table1 = {}
    local table2 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    -- fill in second table
    table2["first"]  = 1
    table2["second"] = 2
    table2["third"]  = 3

    -- perform comparison
    is_equal(table1, table2, "positive equality test: two hash tables")
end

--
-- Check if two hash tables are equal.
--
function TestAssertionIsEqual.testPositive16()
    local table1 = {}
    local table2 = {}

    -- fill in the first table
    table1["first"]  = "!"
    table1["second"] = "@"
    table1["third"]  = "#"

    -- fill in second table
    table2["first"]  = "!"
    table2["second"] = "@"
    table2["third"]  = "#"

    -- perform comparison
    is_equal(table1, table2, "positive equality test: two hash tables")
end

--
-- Check if two nested hash tables are equal.
--
function TestAssertionIsEqual.testPositive17()
    local table1 = {}
    local table2 = {}

    -- fill in the first table
    table1["first"]  = {1,2,3}
    table1["second"] = {4,5,6}
    table1["third"]  = {7,8,9}

    -- fill in second table
    table2["first"]  = {1,2,3}
    table2["second"] = {4,5,6}
    table2["third"]  = {7,8,9}

    -- perform comparison
    is_equal(table1, table2, "positive equality test: two nested hash tables")
end

--
-- Verify that true!=false.
--
function TestAssertionIsEqual.testNegative01()
    -- perform comparison
    is_equal(true, false, "(expected) negative equality test")
end

function TestAssertionIsEqual.testNegative2()
    is_equal(false, true, "(expected) negative equality test")
end

function TestAssertionIsEqual.testNegative3()
    is_equal(1, 2, "(expected) integers are not the same")
end

function TestAssertionIsEqual.testNegative4()
    is_equal("x", "y", "(expected) strings are not the same")
end

function TestAssertionIsEqual.testNegative5()
    is_equal()
end

function TestAssertionIsEqual.testNegative6()
    is_equal(1)
end

function TestAssertionIsEqual.testNegative7()
    is_equal(1, 1)
end

function TestAssertionIsEqual.testNegative8()
    is_equal(nil, nil, "What's wrong?")
end

