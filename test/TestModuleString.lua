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
        changed = "2015-05-11",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction01()
    local str = "Hello world!"
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction02()
    local str = "   Hello world!"
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction03()
    local str = "Hello world!   "
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction04()
    local str = "   Hello world!   "
    is_equal(str:trim(), "Hello world!", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction05()
    local str = ""
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction06()
    local str = " "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction07()
    local str = "  "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction08()
    local str = "   "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction09()
    local str = "\n"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction10()
    local str = "\t"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction11()
    local str = "\n "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction12()
    local str = " \n"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction13()
    local str = "\t "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction14()
    local str = " \t"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction15()
    local str = "\n\t"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction16()
    local str = " \n\t"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction17()
    local str = "\n \t"
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction18()
    local str = "\n\t "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction19()
    local str = " \n\t "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trim().
--
function TestModuleString.testTrimFunction20()
    local str = " \n \t "
    is_equal(str:trim(), "", "Test if trim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction01()
    local str = "Hello world!"
    warn("Original string: " .. str)
    warn("Trimmed string:  " .. str:trimString())
    is_equal(str:trimString(), "Hello world", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction02()
    local str = "   Hello world!"
    is_equal(str:trimString(), "Hello world", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction03()
    local str = "Hello world!   "
    is_equal(str:trimString(), "Hello world", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction04()
    local str = "   Hello world!   "
    is_equal(str:trimString(), "Hello world", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction05()
    local str = ""
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction06()
    local str = " "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction07()
    local str = "  "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction08()
    local str = "   "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction09()
    local str = " x "
    is_equal(str:trimString(), "x", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction10()
    local str = " xx "
    is_equal(str:trimString(), "xx", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction11()
    local str = "\n "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction12()
    local str = " \n"
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction13()
    local str = "\t "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction14()
    local str = " \t"
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction15()
    local str = "\n\t"
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction16()
    local str = " \n\t"
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction17()
    local str = "\n \t"
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction18()
    local str = "\n\t "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction19()
    local str = " \n\t "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction20()
    local str = " \n \t "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:trimString().
--
function TestModuleString.testTrimStringFunction21()
    local str = "  \n \t  "
    is_equal(str:trimString(), "", "Test if trimString() function works correctly")
end



