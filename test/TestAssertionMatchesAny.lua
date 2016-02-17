-- TestAssertionMatchesAny.lua - test the behavior of the asserts.matches_any() function
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

TestAssertionMatchesAny = {
    metadata = {
        description = "Test the behavior of the asserts.matches_any() function.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-02-17",
        tags = {"BasicTest", "SmokeTest"}
    }
}



--
-- Verify that the function accepts a string as its argument:
--
function TestAssertionMatchesAny.testPositive01()
    matches_any({"aaa", "bbb", "ccc"}, "bb", "pass() expected")
    matches_any({"aaa", "bbb", "ccc"}, "bbb", "pass() expected")
end



--
-- Verify that the function accepts a string as its argument:
--
function TestAssertionMatchesAny.testNegative01()
    matches_any({"aaa", "bbb", "ccc"}, "xx", "fail() expected")
    matches_any({"aaa", "bbb", "ccc"}, "xxx", "fail() expected")
end

