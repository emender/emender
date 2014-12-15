-- TestAssertionIsLike.lua - test the behavior of the asserts.is_like() function
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

TestAssertionIsLike = {
    -- required field
    metadata = {
        description = "Test the behaviour function asserts.is_like().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-28",
        tags = {"BasicTest"},
    },
}



--
-- Verify that "x" matches "xyzzy".
--
function TestAssertionIsLike.testPositive01()
    is_like("xyzzy", "x", "positive test")
end



--
-- Verify that "xyzzy" matches "xyzzy".
--
function TestAssertionIsLike.testPositive02()
    is_like("xyzzy", "xyzzy", "positive test")
end



--
-- Verify that "zz" matches "xyzzy".
--
function TestAssertionIsLike.testPositive03()
    is_like("xyzzy", "zz", "positive test")
end



--
-- Verify that "ZZ" matches "XYZZY".
--
function TestAssertionIsLike.testPositive04()
    is_like("XYZZY", "ZZ", "positive test")
end



--
-- Verify that "." matches "X".
--
function TestAssertionIsLike.testPositive05()
    is_like("X", ".", "positive test")
end



--
-- Verify that "%." matches ".".
--
function TestAssertionIsLike.testPositive06()
    is_like(".", "%.", "positive test")
end



--
-- Verify that "%%" matches "%".
--
function TestAssertionIsLike.testPositive07()
    is_like("%", "%%", "positive test")
end



--
-- Verify that "[a-z] matches "a".
--
function TestAssertionIsLike.testPositive08()
    is_like("a", "[a-z]", "positive test")
end



--
-- Verify that "[A-Z] matches "A".
--
function TestAssertionIsLike.testPositive09()
    is_like("A", "[A-Z]", "positive test")
end



--
-- Verify that "[0-9] matches "5".
--
function TestAssertionIsLike.testPositive10()
    is_like("5", "[0-9]", "positive test")
end



-- We need to check all the following character classes:
-- %a    letters
-- %c *  control characters
-- %d    digits
-- %l    lower case letters
-- %p *  punctuation characters
-- %s *  space characters
-- %u    upper case letters
-- %w    alphanumeric characters
-- %x    hexadecimal digits
-- %z *  the character with representation 0



--
-- Verify that "%d" matches "12345".
--
function TestAssertionIsLike.testPositive11()
    is_like("12345", "%d", "positive test")
end



--
-- Verify that "%d+" matches "12345".
--
function TestAssertionIsLike.testPositive12()
    is_like("12345", "%d+", "positive test")
end



--
-- Verify that "%d*" matches "12345".
--
function TestAssertionIsLike.testPositive13()
    is_like("12345", "%d*", "positive test")
end



--
-- Verify that "%d-" matches "12345".
--
function TestAssertionIsLike.testPositive14()
    is_like("12345", "%d-", "positive test")
end



--
-- Verify that "%d?" matches "1".
--
function TestAssertionIsLike.testPositive15()
    is_like("1", "%d?", "positive test")
end



--
-- Verify that "%a" matches "abc".
--
function TestAssertionIsLike.testPositive16()
    is_like("abc", "%a", "positive test")
end



--
-- Verify that "%a+" matches "abc".
--
function TestAssertionIsLike.testPositive17()
    is_like("abc", "%a+", "positive test")
end



--
-- Verify that "%a*" matches "abc".
--
function TestAssertionIsLike.testPositive18()
    is_like("abc", "%a*", "positive test")
end



--
-- Verify that "%a-" matches "abc".
--
function TestAssertionIsLike.testPositive19()
    is_like("abc", "%a+", "positive test")
end



--
-- Verify that "%a?" matches "abc".
--
function TestAssertionIsLike.testPositive20()
    is_like("abc", "%a?", "positive test")
end



--
-- Verify that "%l" matches "abc".
--
function TestAssertionIsLike.testPositive21()
    is_like("abc", "%l", "positive test")
end



--
-- Verify that "%l+" matches "abc".
--
function TestAssertionIsLike.testPositive22()
    is_like("abc", "%l+", "positive test")
end



--
-- Verify that "%l*" matches "abc".
--
function TestAssertionIsLike.testPositive23()
    is_like("abc", "%l*", "positive test")
end



--
-- Verify that "%l-" matches "abc".
--
function TestAssertionIsLike.testPositive24()
    is_like("abc", "%l+", "positive test")
end



--
-- Verify that "%l?" matches "abc".
--
function TestAssertionIsLike.testPositive25()
    is_like("abc", "%l?", "positive test")
end



--
-- Verify that "%u" matches "ABC".
--
function TestAssertionIsLike.testPositive26()
    is_like("ABC", "%u", "positive test")
end



--
-- Verify that "%u+" matches "ABC".
--
function TestAssertionIsLike.testPositive27()
    is_like("ABC", "%u+", "positive test")
end



--
-- Verify that "%u*" matches "ABC".
--
function TestAssertionIsLike.testPositive28()
    is_like("ABC", "%u*", "positive test")
end



--
-- Verify that "%u-" matches "ABC".
--
function TestAssertionIsLike.testPositive29()
    is_like("ABC", "%u+", "positive test")
end



--
-- Verify that "%u?" matches "ABC".
--
function TestAssertionIsLike.testPositive30()
    is_like("ABC", "%u?", "positive test")
end



--
-- Verify that "%x" matches "12345".
--
function TestAssertionIsLike.testPositive31()
    is_like("12345", "%x", "positive test")
end



--
-- Verify that "%x+" matches "12345".
--
function TestAssertionIsLike.testPositive32()
    is_like("12345", "%x+", "positive test")
end



--
-- Verify that "%x*" matches "12345".
--
function TestAssertionIsLike.testPositive33()
    is_like("12345", "%x*", "positive test")
end



--
-- Verify that "%x-" matches "12345".
--
function TestAssertionIsLike.testPositive34()
    is_like("12345", "%x-", "positive test")
end



--
-- Verify that "%x?" matches "1".
--
function TestAssertionIsLike.testPositive35()
    is_like("1", "%x?", "positive test")
end



--
-- Verify that "%x" matches "abcdef".
--
function TestAssertionIsLike.testPositive36()
    is_like("abcdef", "%x", "positive test")
end



--
-- Verify that "%x+" matches "abcdef".
--
function TestAssertionIsLike.testPositive37()
    is_like("abcdef", "%x+", "positive test")
end



--
-- Verify that "%x*" matches "abcdef".
--
function TestAssertionIsLike.testPositive38()
    is_like("abcdef", "%x*", "positive test")
end



--
-- Verify that "%x-" matches "abcdef".
--
function TestAssertionIsLike.testPositive39()
    is_like("abcdef", "%x-", "positive test")
end



--
-- Verify that "%x?" matches "abcdef".
--
function TestAssertionIsLike.testPositive40()
    is_like("abcdef", "%x?", "positive test")
end



--
-- Verify that "%w" matches "12345".
--
function TestAssertionIsLike.testPositive41()
    is_like("12345", "%w", "positive test")
end



--
-- Verify that "%w+" matches "12345".
--
function TestAssertionIsLike.testPositive42()
    is_like("12345", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "12345".
--
function TestAssertionIsLike.testPositive43()
    is_like("12345", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "12345".
--
function TestAssertionIsLike.testPositive44()
    is_like("12345", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "1".
--
function TestAssertionIsLike.testPositive45()
    is_like("1", "%w?", "positive test")
end



--
-- Verify that "%w" matches "abcdef".
--
function TestAssertionIsLike.testPositive46()
    is_like("abcdef", "%w", "positive test")
end



--
-- Verify that "%w+" matches "abcdef".
--
function TestAssertionIsLike.testPositive47()
    is_like("abcdef", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "abcdef".
--
function TestAssertionIsLike.testPositive48()
    is_like("abcdef", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "abcdef".
--
function TestAssertionIsLike.testPositive49()
    is_like("abcdef", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "abcdef".
--
function TestAssertionIsLike.testPositive50()
    is_like("abcdef", "%w?", "positive test")
end



--
-- Verify that "%w" matches "xyzzy".
--
function TestAssertionIsLike.testPositive51()
    is_like("xyzzy", "%w", "positive test")
end



--
-- Verify that "%w+" matches "xyzzy".
--
function TestAssertionIsLike.testPositive52()
    is_like("xyzzy", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "xyzzy".
--
function TestAssertionIsLike.testPositive53()
    is_like("xyzzy", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "xyzzy".
--
function TestAssertionIsLike.testPositive54()
    is_like("xyzzy", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "xyzzy".
--
function TestAssertionIsLike.testPositive55()
    is_like("xyzzy", "%w?", "positive test")
end



--
-- Verify that "%c" matches "\n".
--
function TestAssertionIsLike.testPositive56()
    is_like("\n", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\n".
--
function TestAssertionIsLike.testPositive57()
    is_like("\n", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\n".
--
function TestAssertionIsLike.testPositive58()
    is_like("\n", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\n".
--
function TestAssertionIsLike.testPositive59()
    is_like("\n", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\n".
--
function TestAssertionIsLike.testPositive60()
    is_like("\n", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\t".
--
function TestAssertionIsLike.testPositive61()
    is_like("\t", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\t".
--
function TestAssertionIsLike.testPositive62()
    is_like("\t", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\t".
--
function TestAssertionIsLike.testPositive63()
    is_like("\t", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\t".
--
function TestAssertionIsLike.testPositive64()
    is_like("\t", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\t".
--
function TestAssertionIsLike.testPositive65()
    is_like("\t", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\b".
--
function TestAssertionIsLike.testPositive66()
    is_like("\b", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\b".
--
function TestAssertionIsLike.testPositive67()
    is_like("\b", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\b".
--
function TestAssertionIsLike.testPositive68()
    is_like("\b", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\b".
--
function TestAssertionIsLike.testPositive69()
    is_like("\b", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\b".
--
function TestAssertionIsLike.testPositive70()
    is_like("\b", "%c?", "positive test")
end




--
-- Verify that "%c" matches "\v".
--
function TestAssertionIsLike.testPositive71()
    is_like("\v", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\v".
--
function TestAssertionIsLike.testPositive72()
    is_like("\v", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\v".
--
function TestAssertionIsLike.testPositive73()
    is_like("\v", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\v".
--
function TestAssertionIsLike.testPositive74()
    is_like("\v", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\v".
--
function TestAssertionIsLike.testPositive75()
    is_like("\v", "%c?", "positive test")
end



--[[
--
-- Verify that "[0-9]*" matches "12345".
--
function TestAssertionIsLike.testPositive06()
    is_like("12345", "[0-9]*", "positive test")
end



--
-- Verify that "[0-9]*" matches "1".
--
function TestAssertionIsLike.testPositive07()
    is_like("", "[0-9]*", "positive test")
end



--
-- Verify that "[0-9]*" matches "".
--
function TestAssertionIsLike.testPositive08()
    is_like("", "[0-9]*", "positive test")
end






--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsLike.testNegative01()
    is_like()
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsLike.testNegative02()
    is_like(nil)
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsLike.testNegative03()
    is_like("string")
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsLike.testNegative04()
    is_like("string", nil)
end



--
-- Negative test - wrong number of parameters.
--
function TestAssertionIsLike.testNegative05()
    is_like("string", "string")
end



--
-- Negative test - wrong type of the last parameter.
--
function TestAssertionIsLike.testNegative06()
    is_like("string", "string", nil)
end



--
-- Negative test - wrong type of the first parameter.
--
function TestAssertionIsLike.testNegative07()
    is_like(nil, "string", "")
end



--
-- Negative test - wrong type of the second parameter.
--
function TestAssertionIsLike.testNegative07()
    is_like("string", nil, "")
end

function TestAssertionIsLike.testNegative08()
    is_like("", "a", "(expected) negative test")
end

function TestAssertionIsLike.testNegative09()
    is_like("", "[0-9]+", "(expected) negative test")
end

function TestAssertionIsLike.testNegative10()
    is_like("", "%d", "(expected) negative test")
end

function TestAssertionIsLike.testNegative11()
    is_like("", "%d+", "(expected) negative test")
end

--]]
