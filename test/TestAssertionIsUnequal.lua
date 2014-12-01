-- TestAssertionIsUnequal.lua - check for basic Emender functionality
-- Copyright (C) 2014 Pavel Tisnovsky
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

TestAssertionIsUnequal = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_unequal().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-12-01",
        tags = {"BasicTest"},
    },
}



--
-- Verify that true!=false.
--
function TestAssertionIsUnequal.testPositive01()
    -- perform comparison
    is_unequal(true, false, "(expected) positive unequality test")
end



--
-- Verify that false!=true.
--
function TestAssertionIsUnequal.testPositive02()
    -- perform comparison
    is_unequal(false, true, "(expected) positive unequality test")
end



--
-- Verify that 1!=2.
--
function TestAssertionIsUnequal.testPositive03()
    -- perform comparison
    is_unequal(1, 2, "(expected) integers are not the same")
end



--
-- Verify that 1.9!=2.0.
--
function TestAssertionIsUnequal.testPositive04()
    -- perform comparison
    is_unequal(1.9, 2.0, "(expected) integers are not the same")
end



--
-- Compare two different strings.
--
function TestAssertionIsUnequal.testPositive05()
    -- perform comparison
    is_unequal("x", "y", "(expected) strings are not the same")
end



--
-- Compare two different strings (first one is empty).
--
function TestAssertionIsUnequal.testPositive06()
    -- perform comparison
    is_unequal("", "y", "(expected) strings are not the same")
end



--
-- Compare two different strings (first one contains special character).
--
function TestAssertionIsUnequal.testPositive07()
    -- perform comparison
    is_unequal("\n", "y", "(expected) strings are not the same")
end



--
-- Comparison of two tables.
--
function TestAssertionIsUnequal.testPositive08()
    -- perform comparison
    is_unequal({}, {1}, "positive unequality test: two tables")
end



--
-- Comparison of two tables.
--
function TestAssertionIsUnequal.testPositive09()
    -- perform comparison
    is_unequal({1,2}, {2,1}, "positive unequality test: two tables, items are integers")
end



--
-- Comparison of two tables.
--
function TestAssertionIsUnequal.testPositive10()
    -- perform comparison
    is_unequal({1,2,3,4}, {1,2,3,4,5,6,7}, "positive unequality test: two tables, items are integers")
end



--
-- Comparison of two tables.
--
function TestAssertionIsUnequal.testPositive11()
    -- perform comparison
    is_unequal({"x", "y"}, {"x", "z"}, "positive unequality test: two tables, items are strings")
end



--
-- Comparison of two nested tables.
--
function TestAssertionIsUnequal.testPositive12()
    -- perform comparison
    is_unequal({1,{2,3},4}, {1,{2,9999},4}, "positive unequality test: two nested tables")
end



--
-- Comparison of two nested tables.
--
function TestAssertionIsUnequal.testPositive13()
    -- perform comparison
    is_unequal({1,{2,{3}},4}, {1,{2,{}},4}, "positive unequality test: two deeply nested tables")
end



--
-- Comparison of two nested tables.
--
function TestAssertionIsUnequal.testPositive14()
    local table1 = {"a",{"b",{"c",{"d", {"e"}}}}}
    local table2 = {"X",{"b",{"c",{"d", {"e"}}}}}
    -- perform comparison
    is_unequal(table1, table2, "positive unequality test: two deeply nested tables")
end



--
-- Comparison of two hash tables.
--
function TestAssertionIsUnequal.testPositive15()
    local table1 = {}
    local table2 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    -- fill in second table
    table2["first"]  = 10
    table2["second"] = 20
    table2["third"]  = 30

    -- perform comparison
    is_unequal(table1, table2, "positive unequality test: two hash tables")
end



--
-- Comparison of two hash tables.
--
function TestAssertionIsUnequal.testPositive16()
    local table1 = {}
    local table2 = {}

    -- fill in the first table
    table1["first"]  = "!"
    table1["second"] = "@"
    table1["third"]  = "#"

    -- fill in second table
    table2["first-"]  = "!"
    table2["second-"] = "@"
    table2["third-"]  = "#"

    -- perform comparison
    is_unequal(table1, table2, "positive unequality test: two hash tables")
end



--
-- Comparison of two nested hash tables.
--
function TestAssertionIsUnequal.testPositive17()
    local table1 = {}
    local table2 = {}

    -- fill in the first table
    table1["first"]  = {1,2,3}
    table1["second"] = {4,5,6}
    table1["third"]  = {7,8,9}

    -- fill in second table
    table2["first"]  = {"1","2","3"}
    table2["second"] = {"2","5","6"}
    table2["third"]  = {"3","8","9"}

    -- perform comparison
    is_unequal(table1, table2, "positive unequality test: two nested hash tables")
end



--
-- Test comparison of integer with boolean.
--
function TestAssertionIsUnequal.testPositive18()
    -- perform comparison
    is_unequal(1, true, "positive unequality test: comparison of integer with boolean")
end



--
-- Test comparison of integer with boolean.
--
function TestAssertionIsUnequal.testPositive19()
    -- perform comparison
    is_unequal(1, false, "positive unequality test: comparison of integer with boolean")
end



--
-- Test comparison of boolean with integer.
--
function TestAssertionIsUnequal.testPositive20()
    -- perform comparison
    is_unequal(true, 1, "positive unequality test: comparison of boolean with integer")
end



--
-- Test comparison of boolean with integer.
--
function TestAssertionIsUnequal.testPositive21()
    -- perform comparison
    is_unequal(false, 1, "positive unequality test: comparison of boolean with integer")
end



--
-- Test comparison of string with boolean.
--
function TestAssertionIsUnequal.testPositive22()
    -- perform comparison
    is_unequal("xyzzy", true, "positive unequality test: comparison of string with boolean")
end



--
-- Test comparison of string with boolean.
--
function TestAssertionIsUnequal.testPositive23()
    -- perform comparison
    is_unequal("xyzzy", false, "positive unequality test: comparison of string with boolean")
end



--
-- Test comparison of boolean with string.
--
function TestAssertionIsUnequal.testPositive24()
    -- perform comparison
    is_unequal(true, "xyzzy", "positive unequality test: comparison of boolean with string")
end



--
-- Test comparison of boolean with string.
--
function TestAssertionIsUnequal.testPositive25()
    -- perform comparison
    is_unequal(false, "xyzzy", "positive unequality test: comparison of boolean with string")
end



--
-- Test comparison of table with boolean.
--
function TestAssertionIsUnequal.testPositive26()
    -- perform comparison
    is_unequal({1,2,3}, true, "positive unequality test: comparison of table with boolean")
end



--
-- Test comparison of table with boolean.
--
function TestAssertionIsUnequal.testPositive27()
    -- perform comparison
    is_unequal({1,2,3}, false, "positive unequality test: comparison of table with boolean")
end



--
-- Test comparison of boolean with table.
--
function TestAssertionIsUnequal.testPositive28()
    -- perform comparison
    is_unequal(true, {1,2,3}, "positive unequality test: comparison of boolean with table")
end



--
-- Test comparison of boolean with table.
--
function TestAssertionIsUnequal.testPositive29()
    -- perform comparison
    is_unequal(false, {1,2,3}, "positive unequality test: comparison of boolean with table")
end



--
-- Test comparison of table with boolean.
--
function TestAssertionIsUnequal.testPositive30()
    -- perform comparison
    is_unequal({true}, true, "positive unequality test: comparison of table with boolean")
end



--
-- Test comparison of table with boolean.
--
function TestAssertionIsUnequal.testPositive31()
    -- perform comparison
    is_unequal({false}, false, "positive unequality test: comparison of table with boolean")
end



--
-- Test comparison of boolean with table.
--
function TestAssertionIsUnequal.testPositive32()
    -- perform comparison
    is_unequal(true, {true}, "positive unequality test: comparison of boolean with table")
end



--
-- Test comparison of boolean with table.
--
function TestAssertionIsUnequal.testPositive33()
    -- perform comparison
    is_unequal(false, {false}, "positive unequality test: comparison of boolean with table")
end



--
-- Test comparison of table with string.
--
function TestAssertionIsUnequal.testPositive34()
    -- perform comparison
    is_unequal({"xyzzy"}, "xyzzy", "positive unequality test: comparison of table with string")
end



--
-- Test comparison of table with number.
--
function TestAssertionIsUnequal.testPositive35()
    -- perform comparison
    is_unequal({42}, 42, "positive unequality test: comparison of table with number")
end



--
-- Test comparison of string with table.
--
function TestAssertionIsUnequal.testPositive36()
    -- perform comparison
    is_unequal("xyzzy", {"xyzzy"}, "positive unequality test: comparison of string with table")
end



--
-- Test comparison of number with table.
--
function TestAssertionIsUnequal.testPositive37()
    -- perform comparison
    is_unequal(42, {42}, "positive unequality test: comparison of number with table")
end



