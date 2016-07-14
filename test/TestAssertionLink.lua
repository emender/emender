-- TestAssertionLink.lua - test the behavior of the asserts.warn() function.
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

TestAssertionLink = {
    -- required field
    metadata = {
        description = "Test the behavior of the asserts.warn() function.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-07-14",
        tags = {"BasicTest", "SmokeTest"},
    }
}



--
-- Verify that the function accepts a string as its argument:
--
function TestAssertionLink.testPositive01()
    link("The warn() function expects a string as its argument.", "")
end



--
-- Verify that the function accepts an empty string as its argument:
--
function TestAssertionLink.testPositive02()
    link("", "")
end



--
-- Verify that the function requires at least two arguments:
--
function TestAssertionLink.testNegative01()
    link()
end



--
-- Verify that the function requires at least two arguments:
--
function TestAssertionLink.testNegative02()
    link("")
end



