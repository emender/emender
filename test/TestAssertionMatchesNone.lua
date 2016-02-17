-- TestAssertionMatchesNone.lua - test the behavior of the asserts.matches_none() function
-- Copyright (C) 2016 Pavel Tisnovsky
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

TestAssertionMatchesNone = {
    metadata = {
        description = "Test the behavior of the asserts.matches_none() function.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-02-17",
        tags = {"BasicTest", "SmokeTest"}
    }
}



--
-- Verify that the function accepts a string as its argument:
--
function TestAssertionMatchesNone.testPositive01()
    matches_none({"aaa", "bbb", "ccc"}, "xx", "pass() expected")
    matches_none({"aaa", "bbb", "ccc"}, "xxx", "pass() expected")
end



--
-- Verify that the function accepts a string as its argument:
--
function TestAssertionMatchesNone.testNegative01()
    matches_none({"aaa", "bbb", "ccc"}, "bb", "fail() expected")
    matches_none({"aaa", "bbb", "ccc"}, "bbb", "fail() expected")
end

