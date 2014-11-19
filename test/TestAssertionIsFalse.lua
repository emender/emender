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



function TestAssertionIsFalse.testNegative1()
    is_false(true, "(expected) true is definitely not false")
end

function TestAssertionIsFalse.testNegative2()
    is_false(1==1, "(expected) equals!")
end

function TestAssertionIsFalse.testNegative3()
    is_false()
end

function TestAssertionIsFalse.testNegative4()
    is_false(1==1)
end

function TestAssertionIsFalse.testNegative5()
    is_false(1==1, nil)
end

function TestAssertionIsFalse.testNegative6()
    is_false(nil, "What's wrong?")
end

function TestAssertionIsFalse.testNegative7()
    is_false(1==1, 42)
end

function TestAssertionIsFalse.testNegative8()
    is_false(42, "42 is not a valid expression")
end

