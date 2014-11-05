-- TestEscapingHTML.lua - check for basic Emender functionality
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

TestEscapingHTML = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-10-30",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- Test if no escaping is performed for string that don't contains
-- any special HTML character.
--
function TestEscapingHTML.test1()
    fail("No special HTML characters.")
end



--
-- Test if escaping is performed for string that contains one special
-- HTML character: < (less than).
--
function TestEscapingHTML.testLessThan()
    fail("One special HTML character (less than): <")
end



--
-- Test if escaping is performed for string that contains one special
-- HTML character: > (greater than).
--
function TestEscapingHTML.testGreaterThan()
    fail("One special HTML character (greater than): >")
end



--
-- Test if escaping is performed for string that contains one special
-- HTML character: & (ampersand).
--
function TestEscapingHTML.testAmpersand()
    fail("One special HTML character (ampersand): &")
end



--
-- Test if escaping is performed for string that contains one special
-- HTML character: " (quote).
--
function TestEscapingHTML.testQuote()
    fail("One special HTML character (quote): \"")
end

