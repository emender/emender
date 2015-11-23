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
        changed = "2015-10-03",
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
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction01()
    local str = "Hello world!"
    is_equal(str:ltrim(), "Hello world!", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction02()
    local str = "   Hello world!"
    is_equal(str:ltrim(), "Hello world!", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction03()
    local str = "Hello world!   "
    is_equal(str:ltrim(), "Hello world!   ", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction04()
    local str = "   Hello world!   "
    is_equal(str:ltrim(), "Hello world!   ", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction05()
    local str = ""
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction06()
    local str = " "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction07()
    local str = "  "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction08()
    local str = "   "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction09()
    local str = "\n"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction10()
    local str = "\t"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction11()
    local str = "\n "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction12()
    local str = " \n"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction13()
    local str = "\t "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction14()
    local str = " \t"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction15()
    local str = "\n\t"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction16()
    local str = " \n\t"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction17()
    local str = "\n \t"
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction18()
    local str = "\n\t "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction19()
    local str = " \n\t "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:ltrim().
--
function TestModuleString.testLtrimFunction20()
    local str = " \n \t "
    is_equal(str:ltrim(), "", "Test if ltrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction01()
    local str = "Hello world!"
    is_equal(str:rtrim(), "Hello world!", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction02()
    local str = "   Hello world!"
    is_equal(str:rtrim(), "   Hello world!", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction03()
    local str = "Hello world!   "
    is_equal(str:rtrim(), "Hello world!", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction04()
    local str = "   Hello world!   "
    is_equal(str:rtrim(), "   Hello world!", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction05()
    local str = ""
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction06()
    local str = " "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction07()
    local str = "  "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction08()
    local str = "   "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction09()
    local str = "\n"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction10()
    local str = "\t"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction11()
    local str = "\n "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction12()
    local str = " \n"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction13()
    local str = "\t "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction14()
    local str = " \t"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction15()
    local str = "\n\t"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction16()
    local str = " \n\t"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction17()
    local str = "\n \t"
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction18()
    local str = "\n\t "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction19()
    local str = " \n\t "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:rtrim().
--
function TestModuleString.testRtrimFunction20()
    local str = " \n \t "
    is_equal(str:rtrim(), "", "Test if rtrim() function works correctly")
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



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction01()
    local str = "abcdef";
    is_true(str:startsWith("abc"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction02()
    local str = "abcdef";
    is_true(str:startsWith("a"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction03()
    local str = "abcdef";
    is_true(str:startsWith(""), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction04()
    local str = "abcdef";
    is_true(str:startsWith(""), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction05()
    local str = "";
    is_true(str:startsWith(""), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction06()
    local str = " ";
    is_true(str:startsWith(""), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction07()
    local str = " ";
    is_true(str:startsWith(" "), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction08()
    local str = "***";
    is_true(str:startsWith(""), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction09()
    local str = "***";
    is_true(str:startsWith("*"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction10()
    local str = "***";
    is_true(str:startsWith("**"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction11()
    local str = "***";
    is_true(str:startsWith("***"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction12()
    local str = "\nxyzzy"
    is_true(str:startsWith("\n"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction13()
    local str = "\nxyzzy"
    is_true(str:startsWith("\nxyzzy"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction14()
    local str = "\txyzzy"
    is_true(str:startsWith("\t"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction15()
    local str = "\txyzzy"
    is_true(str:startsWith("\txyzzy"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction16()
    local str = "\n\txyzzy"
    is_true(str:startsWith("\n\t"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction17()
    local str = "\n\txyzzy"
    is_true(str:startsWith("\n\tx"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction18()
    local str = "\n\txyzzy"
    is_true(str:startsWith("\n\txyzzy"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction19()
    local str = "xyzzy\t"
    is_true(str:startsWith("xyzzy"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction20()
    local str = "xyzzy\n"
    is_true(str:startsWith("xyzzy"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction21()
    local str = "xyzzy\n\t"
    is_true(str:startsWith("xyzzy"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction22()
    local str = "xyzzy\n\t"
    is_true(str:startsWith("xyzzy\n"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:startsWith().
--
function TestModuleString.testStartsWithFunction23()
    local str = "xyzzy\n\t"
    is_true(str:startsWith("xyzzy\n\t"), "Test if startsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction01()
    local str = "abcdef";
    is_true(str:endsWith("def"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction02()
    local str = "abcdef";
    is_true(str:endsWith("ef"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction03()
    local str = "abcdef";
    is_true(str:endsWith("f"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction04()
    local str = "abcdef";
    is_true(str:endsWith(""), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction05()
    local str = "";
    is_true(str:endsWith(""), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction06()
    local str = "---";
    is_true(str:endsWith("---"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction07()
    local str = "\n"
    is_true(str:endsWith("\n"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction08()
    local str = "\t"
    is_true(str:endsWith("\t"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction09()
    local str = "xyzzy\n"
    is_true(str:endsWith("\n"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:endsWith().
--
function TestModuleString.testEndsWithFunction10()
    local str = "xyzzy\t"
    is_true(str:endsWith("\t"), "Test if endsWith() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:subs().
--
function TestModuleString.testSubsFunction01()
    local str = "abcdef";
    is_equal(str:subs(1, 2), "ab", "Test if subs() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:subs().
--
function TestModuleString.testSubsFunction02()
    local str = "abcdef";
    is_equal(str:subs(0, 2), "ab", "Test if subs() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:subs().
--
function TestModuleString.testSubsFunction03()
    local str = "abcdef";
    is_equal(str:subs(1, 1), "a", "Test if subs() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:subs().
--
function TestModuleString.testSubsFunction04()
    local str = "abcdef";
    is_equal(str:subs(2, 2), "b", "Test if subs() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:subs().
--
function TestModuleString.testSubsFunction05()
    local str = "abcdef";
    is_equal(str:subs(0, 0), "", "Test if subs() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:subs().
--
function TestModuleString.testSubsFunction06()
    local str = "abcdef";
    is_equal(str:subs(1, 1000), "abcdef", "Test if subs() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:substring().
--
function TestModuleString.testSubstringFunction01()
    local str = "abcdef";
    is_equal(str:substring(1, 2), "ab", "Test if substring() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:substring().
--
function TestModuleString.testSubstringFunction02()
    local str = "abcdef";
    is_equal(str:substring(0, 2), "ab", "Test if substring() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:substring().
--
function TestModuleString.testSubstringFunction03()
    local str = "abcdef";
    is_equal(str:substring(1, 1), "a", "Test if substring() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:substring().
--
function TestModuleString.testSubstringFunction04()
    local str = "abcdef";
    is_equal(str:substring(2, 2), "b", "Test if substring() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:substring().
--
function TestModuleString.testSubstringFunction05()
    local str = "abcdef";
    is_equal(str:substring(0, 0), "", "Test if substring() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:substring().
--
function TestModuleString.testSubstringFunction06()
    local str = "abcdef";
    is_equal(str:substring(1, 1000), "abcdef", "Test if substring() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:lastIndexOf().
--
function TestModuleString.testLastIndexOf1()
    local str = "abcdef";
    is_equal(str:lastIndexOf("a"), 1, "Test if lastIndexOf() function works correctly")
    is_equal(str:lastIndexOf("b"), 2, "Test if lastIndexOf() function works correctly")
    is_equal(str:lastIndexOf("c"), 3, "Test if lastIndexOf() function works correctly")
    is_equal(str:lastIndexOf("d"), 4, "Test if lastIndexOf() function works correctly")
    is_equal(str:lastIndexOf("e"), 5, "Test if lastIndexOf() function works correctly")
    is_equal(str:lastIndexOf("f"), 6, "Test if lastIndexOf() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:lastIndexOf().
--
function TestModuleString.testLastIndexOf2()
    local str = "abc_def";
    is_equal(str:lastIndexOf("_"), 4, "Test if lastIndexOf() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:lastIndexOf().
--
function TestModuleString.testLastIndexOf3()
    local str = "";
    is_nil(str:lastIndexOf("a"), "Test if lastIndexOf() function works correctly")
    is_nil(str:lastIndexOf("_"), "Test if lastIndexOf() function works correctly")
    is_nil(str:lastIndexOf(" "), "Test if lastIndexOf() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft1()
    is_equal("", string.alignLeft(""),       "Test if alignLeft() function works correctly")
    is_equal(" ", string.alignLeft(" "),     "Test if alignLeft() function works correctly")
    is_equal("  ", string.alignLeft("  "),   "Test if alignLeft() function works correctly")
    is_equal("   ", string.alignLeft("   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft2()
    is_equal("x",    string.alignLeft("x"),    "Test if alignLeft() function works correctly")
    is_equal("x ",   string.alignLeft("x "),   "Test if alignLeft() function works correctly")
    is_equal("x  ",  string.alignLeft("x  "),  "Test if alignLeft() function works correctly")
    is_equal("x   ", string.alignLeft("x   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft3()
    is_equal("x",    string.alignLeft(" x"),    "Test if alignLeft() function works correctly")
    is_equal("x ",   string.alignLeft(" x "),   "Test if alignLeft() function works correctly")
    is_equal("x  ",  string.alignLeft(" x  "),  "Test if alignLeft() function works correctly")
    is_equal("x   ", string.alignLeft(" x   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft4()
    is_equal("x x x",    string.alignLeft(" x x x"),    "Test if alignLeft() function works correctly")
    is_equal("x x x ",   string.alignLeft(" x x x "),   "Test if alignLeft() function works correctly")
    is_equal("x x x  ",  string.alignLeft(" x x x  "),  "Test if alignLeft() function works correctly")
    is_equal("x x x   ", string.alignLeft(" x x x   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft5()
    is_equal("word",    string.alignLeft(" word"),    "Test if alignLeft() function works correctly")
    is_equal("word ",   string.alignLeft(" word "),   "Test if alignLeft() function works correctly")
    is_equal("word  ",  string.alignLeft(" word  "),  "Test if alignLeft() function works correctly")
    is_equal("word   ", string.alignLeft(" word   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft6()
    is_equal("word",    string.alignLeft("  word"),    "Test if alignLeft() function works correctly")
    is_equal("word ",   string.alignLeft("  word "),   "Test if alignLeft() function works correctly")
    is_equal("word  ",  string.alignLeft("  word  "),  "Test if alignLeft() function works correctly")
    is_equal("word   ", string.alignLeft("  word   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft7()
    is_equal("word",    string.alignLeft("  word"),    "Test if alignLeft() function works correctly")
    is_equal("word ",   string.alignLeft("  word "),   "Test if alignLeft() function works correctly")
    is_equal("word  ",  string.alignLeft("  word  "),  "Test if alignLeft() function works correctly")
    is_equal("word   ", string.alignLeft("  word   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft8()
    is_equal("word word",    string.alignLeft("  word word"),    "Test if alignLeft() function works correctly")
    is_equal("word word ",   string.alignLeft("  word word "),   "Test if alignLeft() function works correctly")
    is_equal("word word  ",  string.alignLeft("  word word  "),  "Test if alignLeft() function works correctly")
    is_equal("word word   ", string.alignLeft("  word word   "), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft9()
    is_equal("word word",    string.alignLeft("  word word", 100),    "Test if alignLeft() function works correctly")
    is_equal("word word ",   string.alignLeft("  word word ", 100),   "Test if alignLeft() function works correctly")
    is_equal("word word  ",  string.alignLeft("  word word  ", 100),  "Test if alignLeft() function works correctly")
    is_equal("word word   ", string.alignLeft("  word word   ", 100), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft10()
    is_equal("          word word",    string.alignLeft("  word word", 100, 10),    "Test if alignLeft() function works correctly")
    is_equal("          word word ",   string.alignLeft("  word word ", 100, 10),   "Test if alignLeft() function works correctly")
    is_equal("          word word  ",  string.alignLeft("  word word  ", 100, 10),  "Test if alignLeft() function works correctly")
    is_equal("          word word   ", string.alignLeft("  word word   ", 100, 10), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft11()
    is_equal("x x",    string.alignLeft("  x x", 100),    "Test if alignLeft() function works correctly")
    is_equal("x x ",   string.alignLeft("  x x ", 100),   "Test if alignLeft() function works correctly")
    is_equal("x x  ",  string.alignLeft("  x x  ", 100),  "Test if alignLeft() function works correctly")
    is_equal("x x   ", string.alignLeft("  x x   ", 100), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft12()
    is_equal("          x x",    string.alignLeft("  x x", 100, 10),    "Test if alignLeft() function works correctly")
    is_equal("          x x ",   string.alignLeft("  x x ", 100, 10),   "Test if alignLeft() function works correctly")
    is_equal("          x x  ",  string.alignLeft("  x x  ", 100, 10),  "Test if alignLeft() function works correctly")
    is_equal("          x x   ", string.alignLeft("  x x   ", 100, 10), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft13()
    is_equal(" end-of-line",                              string.alignLeft("  end-of-line", 100, 1), "Test if alignLeft() function works correctly")
    is_equal("          end-of-line",                     string.alignLeft("  end-of-line", 100, 10), "Test if alignLeft() function works correctly")
    is_equal("                    end-of-line",           string.alignLeft("  end-of-line", 100, 20), "Test if alignLeft() function works correctly")
    is_equal("                              end-of-line", string.alignLeft("  end-of-line", 100, 30), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignLeft().
--
function TestModuleString.testAlignLeft14()
    is_equal("end-of-line", string.alignLeft("  end-of-line", 100, -1), "Test if alignLeft() function works correctly")
    is_equal("end-of-line", string.alignLeft("  end-of-line", 100, -10), "Test if alignLeft() function works correctly")
    is_equal("end-of-line", string.alignLeft("  end-of-line", 100, -20), "Test if alignLeft() function works correctly")
    is_equal("end-of-line", string.alignLeft("  end-of-line", 100, -30), "Test if alignLeft() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight1()
    is_equal("", string.alignRight(""),       "Test if alignRight() function works correctly")
             --75xSPACE
    is_equal("                                                                           ",
             string.alignRight(" "),     "Test if alignRight() function works correctly")
    is_equal("                                                                           ",
             string.alignRight("  "),     "Test if alignRight() function works correctly")
    is_equal("                                                                           ",
             string.alignRight("   "),     "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight2()
    is_equal("", string.alignRight("", 10), "Test if alignRight() function works correctly")
    is_equal("          ", string.alignRight(" ", 10),    "Test if alignRight() function works correctly")
    is_equal("          ", string.alignRight("  ", 10),   "Test if alignRight() function works correctly")
    is_equal("          ", string.alignRight("   ", 10),  "Test if alignRight() function works correctly")
    is_equal("          ", string.alignRight("    ", 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight3()
    is_equal("         x", string.alignRight("x", 10),    "Test if alignRight() function works correctly")
    is_equal("        x ", string.alignRight("x ", 10),   "Test if alignRight() function works correctly")
    is_equal("       x  ", string.alignRight("x  ", 10),  "Test if alignRight() function works correctly")
    is_equal("      x   ", string.alignRight("x   ", 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight4()
    is_equal("     x x x", string.alignRight("x x x", 10),    "Test if alignRight() function works correctly")
    is_equal("    x x x ", string.alignRight("x x x ", 10),   "Test if alignRight() function works correctly")
    is_equal("   x x x  ", string.alignRight("x x x  ", 10),  "Test if alignRight() function works correctly")
    is_equal("  x x x   ", string.alignRight("x x x   ", 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight5()
    is_equal("      word", string.alignRight("word", 10),    "Test if alignRight() function works correctly")
    is_equal("     word ", string.alignRight("word ", 10),   "Test if alignRight() function works correctly")
    is_equal("    word  ", string.alignRight("word  ", 10),  "Test if alignRight() function works correctly")
    is_equal("   word   ", string.alignRight("word   ", 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight6()
    is_equal("word", string.alignRight("word", 2),       "Test if alignRight() function works correctly")
    is_equal("word ", string.alignRight("word ", 2),     "Test if alignRight() function works correctly")
    is_equal("word  ", string.alignRight("word  ", 2),   "Test if alignRight() function works correctly")
    is_equal("word   ", string.alignRight("word   ", 2), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight7()
    is_equal(" word", string.alignRight("word", 5),      "Test if alignRight() function works correctly")
    is_equal("word ", string.alignRight("word ", 5),     "Test if alignRight() function works correctly")
    is_equal("word  ", string.alignRight("word  ", 5),   "Test if alignRight() function works correctly")
    is_equal("word   ", string.alignRight("word   ", 5), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight8()
    is_equal("word", string.alignRight("word", -1),       "Test if alignRight() function works correctly")
    is_equal("word ", string.alignRight("word ", -1),     "Test if alignRight() function works correctly")
    is_equal("word  ", string.alignRight("word  ", -1),   "Test if alignRight() function works correctly")
    is_equal("word   ", string.alignRight("word   ", -1), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight9()
    is_equal("word", string.alignRight("word", -10),       "Test if alignRight() function works correctly")
    is_equal("word ", string.alignRight("word ", -10),     "Test if alignRight() function works correctly")
    is_equal("word  ", string.alignRight("word  ", -10),   "Test if alignRight() function works correctly")
    is_equal("word   ", string.alignRight("word   ", -10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight10()
    is_equal("word", string.alignRight("word", -100),       "Test if alignRight() function works correctly")
    is_equal("word ", string.alignRight("word ", -100),     "Test if alignRight() function works correctly")
    is_equal("word  ", string.alignRight("word  ", -100),   "Test if alignRight() function works correctly")
    is_equal("word   ", string.alignRight("word   ", -100), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight11()
    is_equal("          word", string.alignRight("word", 10, 10),       "Test if alignRight() function works correctly")
    is_equal("          word ", string.alignRight("word ", 10, 10),     "Test if alignRight() function works correctly")
    is_equal("          word  ", string.alignRight("word  ", 10, 10),   "Test if alignRight() function works correctly")
    is_equal("          word   ", string.alignRight("word   ", 10, 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight12()
    is_equal("                    word", string.alignRight("word", 10, 20),       "Test if alignRight() function works correctly")
    is_equal("                    word ", string.alignRight("word ", 10, 20),     "Test if alignRight() function works correctly")
    is_equal("                    word  ", string.alignRight("word  ", 10, 20),   "Test if alignRight() function works correctly")
    is_equal("                    word   ", string.alignRight("word   ", 10, 20), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight13()
    is_equal("                    word", string.alignRight("word", 20, 20),       "Test if alignRight() function works correctly")
    is_equal("                    word ", string.alignRight("word ", 20, 20),     "Test if alignRight() function works correctly")
    is_equal("                    word  ", string.alignRight("word  ", 20, 20),   "Test if alignRight() function works correctly")
    is_equal("                    word   ", string.alignRight("word   ", 20, 20), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight14()
    is_equal("                word", string.alignRight("word", 20, 10),    "Test if alignRight() function works correctly")
    is_equal("               word ", string.alignRight("word ", 20, 10),   "Test if alignRight() function works correctly")
    is_equal("              word  ", string.alignRight("word  ", 20, 10),  "Test if alignRight() function works correctly")
    is_equal("             word   ", string.alignRight("word   ", 20, 10), "Test if alignRight() function works correctly")
end




--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight15()
    is_equal("               word ", string.alignRight("word ", 20, 10),    "Test if alignRight() function works correctly")
    is_equal("              word  ", string.alignRight("word  ", 20, 10),   "Test if alignRight() function works correctly")
    is_equal("             word   ", string.alignRight("word   ", 20, 10),  "Test if alignRight() function works correctly")
    is_equal("            word    ", string.alignRight("word    ", 20, 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignRight().
--
function TestModuleString.testAlignRight16()
    is_equal("              word  ", string.alignRight("word  ", 20, 10),    "Test if alignRight() function works correctly")
    is_equal("             word   ", string.alignRight("word   ", 20, 10),   "Test if alignRight() function works correctly")
    is_equal("            word    ", string.alignRight("word    ", 20, 10),  "Test if alignRight() function works correctly")
    is_equal("           word     ", string.alignRight("word     ", 20, 10), "Test if alignRight() function works correctly")
end



--
-- Test the behaviour of the following Emender function: string:alignCenter().
--
function TestModuleString.testAlignCenter1()
    is_equal("", string.alignCenter(""),       "Test if alignCenter() function works correctly")
    -- 38x SPACE (std. width is 75 chars, so 75/2=37 + one space
    is_equal("                                      ", string.alignCenter(" "),   "Test if alignCenter() function works correctly")
    is_equal("                                      ", string.alignCenter(" "),   "Test if alignCenter() function works correctly")
    -- 39x SPACE
    is_equal("                                       ", string.alignCenter("  "),  "Test if alignCenter() function works correctly")
    is_equal("                                       ", string.alignCenter("   "), "Test if alignCenter() function works correctly")
end



-- TODO:
-- string.alignCenter(str, width, indent, first_indent)
-- string.horizontalFill(left_str, right_str, width, filler)
-- string.escapeHTML(str)
-- string:split(separator)
-- string:lastIndexOf(str)

