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
        changed = "2014-09-22",
        tags = {"BasicTest"},
    },
}

function TestAssertionIsEqual.testPositive01()
    is_equal(true, true, "positive equality test:two booleans")
end

function TestAssertionIsEqual.testPositive02()
    is_equal(false, false, "positive equality test:two booleans")
end

function TestAssertionIsEqual.testPositive03()
    is_equal(42, 42, "positive equality test: two integers")
end

function TestAssertionIsEqual.testPositive04()
    is_equal(3.14, 3.14, "positive equality test: two floats")
end

function TestAssertionIsEqual.testPositive05()
    is_equal("", "", "positive equality test: two empty strings")
end

function TestAssertionIsEqual.testPositive06()
    is_equal("x", "x", "positive equality test: two strings")
end

function TestAssertionIsEqual.testPositive07()
    is_equal({}, {}, "positive equality test: two empty tables")
end

function TestAssertionIsEqual.testPositive08()
    is_equal({1,2}, {1,2}, "positive equality test: two tables, items are integers")
end

function TestAssertionIsEqual.testPositive09()
    is_equal({1,2,3,4}, {1,2,3,4}, "positive equality test: two tables, items are integers")
end

function TestAssertionIsEqual.testPositive10()
    is_equal({"x", "y"}, {"x", "y"}, "positive equality test: two tables, items are strings")
end

function TestAssertionIsEqual.testPositive11()
    is_equal({1,{2,3},4}, {1,{2,3},4}, "positive equality test: two nested tables")
end

function TestAssertionIsEqual.testPositive12()
    is_equal({1,{2,{3}},4}, {1,{2,{3}},4}, "positive equality test: two deeply nested tables")
end

function TestAssertionIsEqual.testPositive13()
    local table1 = {}
    local table2 = {}

    table1["first"] = 1
    table1["second"] = 2
    table1["third"] = 3

    table2["first"] = 1
    table2["second"] = 2
    table2["third"] = 3
    is_equal(table1, table2, "positive equality test: two hash tables")
end

function TestAssertionIsEqual.testPositive14()
    local table1 = {}
    local table2 = {}

    table1["first"] = "!"
    table1["second"] = "@"
    table1["third"] = "#"

    table2["first"] = "!"
    table2["second"] = "@"
    table2["third"] = "#"
    is_equal(table1, table2, "positive equality test: two hash tables")
end

function TestAssertionIsEqual.testNegative1()
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

