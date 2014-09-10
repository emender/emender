-- TestAssertionPass.lua - test the behavior of the asserts.pass() function
-- Copyright (C) 2014 Jaromir Hradilek

-- This file is part of Emender.

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

TestAssertionPass = {
    metadata = {
        description = "Test the behavior of the asserts.pass() function.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-09-10",
        tags = {"BasicTest"}
    }
}

-- Verify that the function accepts a string as its argument:
function TestAssertionPass.testString()
    pass("The pass() function expects a string as its argument.")
end

-- Verify that the function requires at least one argument:
function TestAssertionPass.testEmpty()
    pass()
end

-- Verify that the function does not accept nil as an argument:
function TestAssertionPass.testNil()
    pass(nil)
end

-- Verify that the function does not accept a boolean as an argument:
function TestAssertionPass.testBoolean()
    pass(true)
end

-- Verify that the function does not accept a number as an argument:
function TestAssertionPass.testNumber()
    pass(42)
end
