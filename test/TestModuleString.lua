-- TestModuleString.lua - check the API for the Emender module 'gendoc'.
-- Copyright (C) 2015 Pavel Tisnovsky
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

TestModuleString = {
    -- required field
    metadata = {
        description = "Check the API for the Emender module 'string'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-04-22",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test if global function with the given name exists.
--
function TestModuleString.testTrimFunction1()
    local str = "Hello world!"
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test if global function with the given name exists.
--
function TestModuleString.testTrimFunction2()
    local str = "   Hello world!"
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test if global function with the given name exists.
--
function TestModuleString.testTrimFunction3()
    local str = "Hello world!   "
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test if global function with the given name exists.
--
function TestModuleString.testTrimFunction4()
    local str = "   Hello world!   "
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end


