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
-- Verify that the function does not accept an nil as an first argument:
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
-- Verify that the first argument has type boolean:
--
function TestAssertionIsTrue.testNegative09()
    is_true(42, "42 is not a valid expression")
end



--
-- Verify that the second argument has type string:
--
function TestAssertionIsTrue.testNegative10()
    is_true(1==1, 42)
end



--
-- Verify that the second argument has type string:
--
function TestAssertionIsTrue.testNegative11()
    is_true(1==1, nil)
end



