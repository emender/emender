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
function TestAssertionIsLike.testPositive001()
    is_like("xyzzy", "x", "positive test")
end



--
-- Verify that "xyzzy" matches "xyzzy".
--
function TestAssertionIsLike.testPositive002()
    is_like("xyzzy", "xyzzy", "positive test")
end



--
-- Verify that "zz" matches "xyzzy".
--
function TestAssertionIsLike.testPositive003()
    is_like("xyzzy", "zz", "positive test")
end



--
-- Verify that "ZZ" matches "XYZZY".
--
function TestAssertionIsLike.testPositive004()
    is_like("XYZZY", "ZZ", "positive test")
end



--
-- Verify that "." matches "X".
--
function TestAssertionIsLike.testPositive005()
    is_like("X", ".", "positive test")
end



--
-- Verify that "%." matches ".".
--
function TestAssertionIsLike.testPositive006()
    is_like(".", "%.", "positive test")
end



--
-- Verify that "%%" matches "%".
--
function TestAssertionIsLike.testPositive007()
    is_like("%", "%%", "positive test")
end



--
-- Verify that "[a-z] matches "a".
--
function TestAssertionIsLike.testPositive008()
    is_like("a", "[a-z]", "positive test")
end



--
-- Verify that "[A-Z] matches "A".
--
function TestAssertionIsLike.testPositive009()
    is_like("A", "[A-Z]", "positive test")
end



--
-- Verify that "[0-9] matches "5".
--
function TestAssertionIsLike.testPositive010()
    is_like("5", "[0-9]", "positive test")
end



-- We need to check all the following character classes:
-- %a    letters
-- %c    control characters
-- %d    digits
-- %l    lower case letters
-- %p *  punctuation characters
-- %s    space characters
-- %u    upper case letters
-- %w    alphanumeric characters
-- %x    hexadecimal digits
-- %z    the character with representation 0



--
-- Verify that "%d" matches "12345".
--
function TestAssertionIsLike.testPositive011()
    is_like("12345", "%d", "positive test")
end



--
-- Verify that "%d+" matches "12345".
--
function TestAssertionIsLike.testPositive012()
    is_like("12345", "%d+", "positive test")
end



--
-- Verify that "%d*" matches "12345".
--
function TestAssertionIsLike.testPositive013()
    is_like("12345", "%d*", "positive test")
end



--
-- Verify that "%d-" matches "12345".
--
function TestAssertionIsLike.testPositive014()
    is_like("12345", "%d-", "positive test")
end



--
-- Verify that "%d?" matches "1".
--
function TestAssertionIsLike.testPositive015()
    is_like("1", "%d?", "positive test")
end



--
-- Verify that "%a" matches "abc".
--
function TestAssertionIsLike.testPositive016()
    is_like("abc", "%a", "positive test")
end



--
-- Verify that "%a+" matches "abc".
--
function TestAssertionIsLike.testPositive017()
    is_like("abc", "%a+", "positive test")
end



--
-- Verify that "%a*" matches "abc".
--
function TestAssertionIsLike.testPositive018()
    is_like("abc", "%a*", "positive test")
end



--
-- Verify that "%a-" matches "abc".
--
function TestAssertionIsLike.testPositive019()
    is_like("abc", "%a+", "positive test")
end



--
-- Verify that "%a?" matches "abc".
--
function TestAssertionIsLike.testPositive020()
    is_like("abc", "%a?", "positive test")
end



--
-- Verify that "%l" matches "abc".
--
function TestAssertionIsLike.testPositive021()
    is_like("abc", "%l", "positive test")
end



--
-- Verify that "%l+" matches "abc".
--
function TestAssertionIsLike.testPositive022()
    is_like("abc", "%l+", "positive test")
end



--
-- Verify that "%l*" matches "abc".
--
function TestAssertionIsLike.testPositive023()
    is_like("abc", "%l*", "positive test")
end



--
-- Verify that "%l-" matches "abc".
--
function TestAssertionIsLike.testPositive024()
    is_like("abc", "%l+", "positive test")
end



--
-- Verify that "%l?" matches "abc".
--
function TestAssertionIsLike.testPositive025()
    is_like("abc", "%l?", "positive test")
end



--
-- Verify that "%u" matches "ABC".
--
function TestAssertionIsLike.testPositive026()
    is_like("ABC", "%u", "positive test")
end



--
-- Verify that "%u+" matches "ABC".
--
function TestAssertionIsLike.testPositive027()
    is_like("ABC", "%u+", "positive test")
end



--
-- Verify that "%u*" matches "ABC".
--
function TestAssertionIsLike.testPositive028()
    is_like("ABC", "%u*", "positive test")
end



--
-- Verify that "%u-" matches "ABC".
--
function TestAssertionIsLike.testPositive029()
    is_like("ABC", "%u+", "positive test")
end



--
-- Verify that "%u?" matches "ABC".
--
function TestAssertionIsLike.testPositive030()
    is_like("ABC", "%u?", "positive test")
end



--
-- Verify that "%x" matches "12345".
--
function TestAssertionIsLike.testPositive031()
    is_like("12345", "%x", "positive test")
end



--
-- Verify that "%x+" matches "12345".
--
function TestAssertionIsLike.testPositive032()
    is_like("12345", "%x+", "positive test")
end



--
-- Verify that "%x*" matches "12345".
--
function TestAssertionIsLike.testPositive033()
    is_like("12345", "%x*", "positive test")
end



--
-- Verify that "%x-" matches "12345".
--
function TestAssertionIsLike.testPositive034()
    is_like("12345", "%x-", "positive test")
end



--
-- Verify that "%x?" matches "1".
--
function TestAssertionIsLike.testPositive035()
    is_like("1", "%x?", "positive test")
end



--
-- Verify that "%x" matches "abcdef".
--
function TestAssertionIsLike.testPositive036()
    is_like("abcdef", "%x", "positive test")
end



--
-- Verify that "%x+" matches "abcdef".
--
function TestAssertionIsLike.testPositive037()
    is_like("abcdef", "%x+", "positive test")
end



--
-- Verify that "%x*" matches "abcdef".
--
function TestAssertionIsLike.testPositive038()
    is_like("abcdef", "%x*", "positive test")
end



--
-- Verify that "%x-" matches "abcdef".
--
function TestAssertionIsLike.testPositive039()
    is_like("abcdef", "%x-", "positive test")
end



--
-- Verify that "%x?" matches "abcdef".
--
function TestAssertionIsLike.testPositive040()
    is_like("abcdef", "%x?", "positive test")
end



--
-- Verify that "%w" matches "12345".
--
function TestAssertionIsLike.testPositive041()
    is_like("12345", "%w", "positive test")
end



--
-- Verify that "%w+" matches "12345".
--
function TestAssertionIsLike.testPositive042()
    is_like("12345", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "12345".
--
function TestAssertionIsLike.testPositive043()
    is_like("12345", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "12345".
--
function TestAssertionIsLike.testPositive044()
    is_like("12345", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "1".
--
function TestAssertionIsLike.testPositive045()
    is_like("1", "%w?", "positive test")
end



--
-- Verify that "%w" matches "abcdef".
--
function TestAssertionIsLike.testPositive046()
    is_like("abcdef", "%w", "positive test")
end



--
-- Verify that "%w+" matches "abcdef".
--
function TestAssertionIsLike.testPositive047()
    is_like("abcdef", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "abcdef".
--
function TestAssertionIsLike.testPositive048()
    is_like("abcdef", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "abcdef".
--
function TestAssertionIsLike.testPositive049()
    is_like("abcdef", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "abcdef".
--
function TestAssertionIsLike.testPositive050()
    is_like("abcdef", "%w?", "positive test")
end



--
-- Verify that "%w" matches "xyzzy".
--
function TestAssertionIsLike.testPositive051()
    is_like("xyzzy", "%w", "positive test")
end



--
-- Verify that "%w+" matches "xyzzy".
--
function TestAssertionIsLike.testPositive052()
    is_like("xyzzy", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "xyzzy".
--
function TestAssertionIsLike.testPositive053()
    is_like("xyzzy", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "xyzzy".
--
function TestAssertionIsLike.testPositive054()
    is_like("xyzzy", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "xyzzy".
--
function TestAssertionIsLike.testPositive055()
    is_like("xyzzy", "%w?", "positive test")
end



--
-- Verify that "%c" matches "\n".
--
function TestAssertionIsLike.testPositive056()
    is_like("\n", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\n".
--
function TestAssertionIsLike.testPositive057()
    is_like("\n", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\n".
--
function TestAssertionIsLike.testPositive058()
    is_like("\n", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\n".
--
function TestAssertionIsLike.testPositive059()
    is_like("\n", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\n".
--
function TestAssertionIsLike.testPositive060()
    is_like("\n", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\t".
--
function TestAssertionIsLike.testPositive061()
    is_like("\t", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\t".
--
function TestAssertionIsLike.testPositive062()
    is_like("\t", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\t".
--
function TestAssertionIsLike.testPositive063()
    is_like("\t", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\t".
--
function TestAssertionIsLike.testPositive064()
    is_like("\t", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\t".
--
function TestAssertionIsLike.testPositive065()
    is_like("\t", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\b".
--
function TestAssertionIsLike.testPositive066()
    is_like("\b", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\b".
--
function TestAssertionIsLike.testPositive067()
    is_like("\b", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\b".
--
function TestAssertionIsLike.testPositive068()
    is_like("\b", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\b".
--
function TestAssertionIsLike.testPositive069()
    is_like("\b", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\b".
--
function TestAssertionIsLike.testPositive070()
    is_like("\b", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\v".
--
function TestAssertionIsLike.testPositive071()
    is_like("\v", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\v".
--
function TestAssertionIsLike.testPositive072()
    is_like("\v", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\v".
--
function TestAssertionIsLike.testPositive073()
    is_like("\v", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\v".
--
function TestAssertionIsLike.testPositive074()
    is_like("\v", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\v".
--
function TestAssertionIsLike.testPositive075()
    is_like("\v", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\f".
--
function TestAssertionIsLike.testPositive076()
    is_like("\f", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\f".
--
function TestAssertionIsLike.testPositive077()
    is_like("\f", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\f".
--
function TestAssertionIsLike.testPositive078()
    is_like("\f", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\f".
--
function TestAssertionIsLike.testPositive079()
    is_like("\f", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\f".
--
function TestAssertionIsLike.testPositive080()
    is_like("\f", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\r".
--
function TestAssertionIsLike.testPositive081()
    is_like("\r", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\r".
--
function TestAssertionIsLike.testPositive082()
    is_like("\r", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\r".
--
function TestAssertionIsLike.testPositive083()
    is_like("\r", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\r".
--
function TestAssertionIsLike.testPositive084()
    is_like("\r", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\r".
--
function TestAssertionIsLike.testPositive085()
    is_like("\r", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\a".
--
function TestAssertionIsLike.testPositive086()
    is_like("\a", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\a".
--
function TestAssertionIsLike.testPositive087()
    is_like("\a", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\a".
--
function TestAssertionIsLike.testPositive088()
    is_like("\a", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\a".
--
function TestAssertionIsLike.testPositive089()
    is_like("\a", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\a".
--
function TestAssertionIsLike.testPositive090()
    is_like("\a", "%c?", "positive test")
end



--
-- Verify that "%z" matches "\0".
--
function TestAssertionIsLike.testPositive091()
    is_like("\0", "%z", "positive test")
end



--
-- Verify that "%z+" matches "\0".
--
function TestAssertionIsLike.testPositive092()
    is_like("\0", "%z+", "positive test")
end



--
-- Verify that "%z*" matches "\0".
--
function TestAssertionIsLike.testPositive093()
    is_like("\0", "%z*", "positive test")
end



--
-- Verify that "%z-" matches "\0".
--
function TestAssertionIsLike.testPositive094()
    is_like("\0", "%z-", "positive test")
end



--
-- Verify that "%z?" matches "\0".
--
function TestAssertionIsLike.testPositive095()
    is_like("\0", "%z?", "positive test")
end



--
-- Verify that "%s" matches " ".
--
function TestAssertionIsLike.testPositive096()
    is_like(" ", "%s", "positive test")
end



--
-- Verify that "%s+" matches " ".
--
function TestAssertionIsLike.testPositive097()
    is_like(" ", "%s+", "positive test")
end



--
-- Verify that "%s*" matches " ".
--
function TestAssertionIsLike.testPositive098()
    is_like(" ", "%s*", "positive test")
end



--
-- Verify that "%s-" matches " ".
--
function TestAssertionIsLike.testPositive099()
    is_like(" ", "%s-", "positive test")
end



--
-- Verify that "%s?" matches " ".
--
function TestAssertionIsLike.testPositive100()
    is_like(" ", "%s?", "positive test")
end



--
-- Verify that "%s" matches "\t".
--
function TestAssertionIsLike.testPositive101()
    is_like("\t", "%s", "positive test")
end



--
-- Verify that "%s+" matches "\t".
--
function TestAssertionIsLike.testPositive102()
    is_like("\t", "%s+", "positive test")
end



--
-- Verify that "%s*" matches "\t".
--
function TestAssertionIsLike.testPositive103()
    is_like("\t", "%s*", "positive test")
end



--
-- Verify that "%s-" matches "\t".
--
function TestAssertionIsLike.testPositive104()
    is_like("\t", "%s-", "positive test")
end



--
-- Verify that "%s?" matches "\t".
--
function TestAssertionIsLike.testPositive105()
    is_like("\t", "%s?", "positive test")
end



--
-- Verify that "%s" matches "\t \t".
--
function TestAssertionIsLike.testPositive106()
    is_like("\t \t", "%s", "positive test")
end



--
-- Verify that "%s+" matches "\t \t".
--
function TestAssertionIsLike.testPositive107()
    is_like("\t \t", "%s+", "positive test")
end



--
-- Verify that "%s*" matches "\t \t".
--
function TestAssertionIsLike.testPositive108()
    is_like("\t \t", "%s*", "positive test")
end



--
-- Verify that "%s-" matches "\t \t".
--
function TestAssertionIsLike.testPositive109()
    is_like("\t \t", "%s-", "positive test")
end



--
-- Verify that "%s?" matches "\t \t".
--
function TestAssertionIsLike.testPositive110()
    is_like("\t \t", "%s?", "positive test")
end



--
-- Verify that "%p" matches ".".
--
function TestAssertionIsLike.testPositive111()
    is_like(".", "%p", "positive test")
end



--
-- Verify that "%p+" matches ".".
--
function TestAssertionIsLike.testPositive112()
    is_like(".", "%p+", "positive test")
end



--
-- Verify that "%p*" matches ".".
--
function TestAssertionIsLike.testPositive113()
    is_like(".", "%p*", "positive test")
end



--
-- Verify that "%p-" matches ".".
--
function TestAssertionIsLike.testPositive114()
    is_like(".", "%p-", "positive test")
end



--
-- Verify that "%p?" matches ".".
--
function TestAssertionIsLike.testPositive115()
    is_like(".", "%p?", "positive test")
end



--
-- Verify that "%d" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive116()
    is_like("prefix@12345", "prefix@%d", "positive test")
end



--
-- Verify that "%d+" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive117()
    is_like("prefix@12345", "prefix@%d+", "positive test")
end



--
-- Verify that "%d*" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive118()
    is_like("prefix@12345", "prefix@%d*", "positive test")
end



--
-- Verify that "%d-" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive119()
    is_like("prefix@12345", "prefix@%d-", "positive test")
end



--
-- Verify that "%d?" matches "1".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive120()
    is_like("prefix@1", "prefix@%d?", "positive test")
end



--
-- Verify that "%a" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive121()
    is_like("prefix@abc", "prefix@%a", "positive test")
end



--
-- Verify that "%a+" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive122()
    is_like("prefix@abc", "prefix@%a+", "positive test")
end



--
-- Verify that "%a*" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive123()
    is_like("prefix@abc", "prefix@%a*", "positive test")
end



--
-- Verify that "%a-" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive124()
    is_like("prefix@abc", "prefix@%a+", "positive test")
end



--
-- Verify that "%a?" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive125()
    is_like("prefix@abc", "prefix@%a?", "positive test")
end



--
-- Verify that "%x" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive126()
    is_like("prefix@12345", "%x", "positive test")
end



--
-- Verify that "%x+" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive127()
    is_like("prefix@12345", "%x+", "positive test")
end



--
-- Verify that "%x*" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive128()
    is_like("prefix@12345", "%x*", "positive test")
end



--
-- Verify that "%x-" matches "12345".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive129()
    is_like("prefix@12345", "%x-", "positive test")
end



--
-- Verify that "%x?" matches "1".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive130()
    is_like("prefix@1", "%x?", "positive test")
end



--
-- Verify that "%x" matches "abcdef".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive131()
    is_like("prefix@abcdef", "%x", "positive test")
end



--
-- Verify that "%x+" matches "abcdef".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive132()
    is_like("prefix@abcdef", "%x+", "positive test")
end



--
-- Verify that "%x*" matches "abcdef".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive133()
    is_like("prefix@abcdef", "%x*", "positive test")
end



--
-- Verify that "%x-" matches "abcdef".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive134()
    is_like("prefix@abcdef", "%x-", "positive test")
end



--
-- Verify that "%x?" matches "abcdef".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive135()
    is_like("prefix@abcdef", "%x?", "positive test")
end



--
-- Verify that "%l" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive136()
    is_like("prefix@abc", "%l", "positive test")
end



--
-- Verify that "%l+" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive137()
    is_like("prefix@abc", "%l+", "positive test")
end



--
-- Verify that "%l*" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive138()
    is_like("prefix@abc", "%l*", "positive test")
end



--
-- Verify that "%l-" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive139()
    is_like("prefix@abc", "%l+", "positive test")
end



--
-- Verify that "%l?" matches "abc".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive140()
    is_like("prefix@abc", "%l?", "positive test")
end



--
-- Verify that "%u" matches "ABC".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive141()
    is_like("prefix@ABC", "%u", "positive test")
end



--
-- Verify that "%u+" matches "ABC".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive142()
    is_like("prefix@ABC", "%u+", "positive test")
end



--
-- Verify that "%u*" matches "ABC".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive143()
    is_like("prefix@ABC", "%u*", "positive test")
end



--
-- Verify that "%u-" matches "ABC".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive144()
    is_like("prefix@ABC", "%u+", "positive test")
end



--
-- Verify that "%u?" matches "ABC".
-- (modified version that uses prefix)
--
function TestAssertionIsLike.testPositive145()
    is_like("prefix@ABC", "%u?", "positive test")
end



--
-- Verify that "%w" matches "12345".
--
function TestAssertionIsLike.testPositive146()
    is_like("prefix@12345", "%w", "positive test")
end



--
-- Verify that "%w+" matches "12345".
--
function TestAssertionIsLike.testPositive147()
    is_like("prefix@12345", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "12345".
--
function TestAssertionIsLike.testPositive148()
    is_like("prefix@12345", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "12345".
--
function TestAssertionIsLike.testPositive149()
    is_like("prefix@12345", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "1".
--
function TestAssertionIsLike.testPositive150()
    is_like("prefix@1", "%w?", "positive test")
end



--
-- Verify that "%w" matches "abcdef".
--
function TestAssertionIsLike.testPositive151()
    is_like("prefix@abcdef", "%w", "positive test")
end



--
-- Verify that "%w+" matches "abcdef".
--
function TestAssertionIsLike.testPositive152()
    is_like("prefix@abcdef", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "abcdef".
--
function TestAssertionIsLike.testPositive153()
    is_like("prefix@abcdef", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "abcdef".
--
function TestAssertionIsLike.testPositive154()
    is_like("prefix@abcdef", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "abcdef".
--
function TestAssertionIsLike.testPositive155()
    is_like("prefix@abcdef", "%w?", "positive test")
end



--
-- Verify that "%w" matches "xyzzy".
--
function TestAssertionIsLike.testPositive156()
    is_like("prefix@xyzzy", "%w", "positive test")
end



--
-- Verify that "%w+" matches "xyzzy".
--
function TestAssertionIsLike.testPositive157()
    is_like("prefix@xyzzy", "%w+", "positive test")
end



--
-- Verify that "%w*" matches "xyzzy".
--
function TestAssertionIsLike.testPositive158()
    is_like("prefix@xyzzy", "%w*", "positive test")
end



--
-- Verify that "%w-" matches "xyzzy".
--
function TestAssertionIsLike.testPositive159()
    is_like("prefix@xyzzy", "%w-", "positive test")
end



--
-- Verify that "%w?" matches "xyzzy".
--
function TestAssertionIsLike.testPositive160()
    is_like("prefix@xyzzy", "%w?", "positive test")
end



--
-- Verify that "%c" matches "\n".
--
function TestAssertionIsLike.testPositive161()
    is_like("prefix@\n", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\n".
--
function TestAssertionIsLike.testPositive162()
    is_like("prefix@\n", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\n".
--
function TestAssertionIsLike.testPositive163()
    is_like("prefix@\n", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\n".
--
function TestAssertionIsLike.testPositive164()
    is_like("prefix@\n", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\n".
--
function TestAssertionIsLike.testPositive165()
    is_like("prefix@\n", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\t".
--
function TestAssertionIsLike.testPositive166()
    is_like("prefix@\t", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\t".
--
function TestAssertionIsLike.testPositive167()
    is_like("prefix@\t", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\t".
--
function TestAssertionIsLike.testPositive168()
    is_like("prefix@\t", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\t".
--
function TestAssertionIsLike.testPositive169()
    is_like("prefix@\t", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\t".
--
function TestAssertionIsLike.testPositive170()
    is_like("prefix@\t", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\b".
--
function TestAssertionIsLike.testPositive171()
    is_like("prefix@\b", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\b".
--
function TestAssertionIsLike.testPositive172()
    is_like("prefix@\b", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\b".
--
function TestAssertionIsLike.testPositive173()
    is_like("prefix@\b", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\b".
--
function TestAssertionIsLike.testPositive174()
    is_like("prefix@\b", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\b".
--
function TestAssertionIsLike.testPositive175()
    is_like("prefix@\b", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\v".
--
function TestAssertionIsLike.testPositive176()
    is_like("prefix@\v", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\v".
--
function TestAssertionIsLike.testPositive177()
    is_like("prefix@\v", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\v".
--
function TestAssertionIsLike.testPositive178()
    is_like("prefix@\v", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\v".
--
function TestAssertionIsLike.testPositive179()
    is_like("prefix@\v", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\v".
--
function TestAssertionIsLike.testPositive180()
    is_like("prefix@\v", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\f".
--
function TestAssertionIsLike.testPositive181()
    is_like("prefix@\f", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\f".
--
function TestAssertionIsLike.testPositive182()
    is_like("prefix@\f", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\f".
--
function TestAssertionIsLike.testPositive183()
    is_like("prefix@\f", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\f".
--
function TestAssertionIsLike.testPositive184()
    is_like("prefix@\f", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\f".
--
function TestAssertionIsLike.testPositive185()
    is_like("prefix@\f", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\r".
--
function TestAssertionIsLike.testPositive186()
    is_like("prefix@\r", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\r".
--
function TestAssertionIsLike.testPositive187()
    is_like("prefix@\r", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\r".
--
function TestAssertionIsLike.testPositive188()
    is_like("prefix@\r", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\r".
--
function TestAssertionIsLike.testPositive189()
    is_like("prefix@\r", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\r".
--
function TestAssertionIsLike.testPositive190()
    is_like("prefix@\r", "%c?", "positive test")
end



--
-- Verify that "%c" matches "\a".
--
function TestAssertionIsLike.testPositive191()
    is_like("prefix@\a", "%c", "positive test")
end



--
-- Verify that "%c+" matches "\a".
--
function TestAssertionIsLike.testPositive192()
    is_like("prefix@\a", "%c+", "positive test")
end



--
-- Verify that "%c*" matches "\a".
--
function TestAssertionIsLike.testPositive193()
    is_like("prefix@\a", "%c*", "positive test")
end



--
-- Verify that "%c-" matches "\a".
--
function TestAssertionIsLike.testPositive194()
    is_like("prefix@\a", "%c-", "positive test")
end



--
-- Verify that "%c?" matches "\a".
--
function TestAssertionIsLike.testPositive195()
    is_like("prefix@\a", "%c?", "positive test")
end



--
-- Verify that "%z" matches "\0".
--
function TestAssertionIsLike.testPositive196()
    is_like("prefix@\0", "%z", "positive test")
end



--
-- Verify that "%z+" matches "\0".
--
function TestAssertionIsLike.testPositive197()
    is_like("prefix@\0", "%z+", "positive test")
end



--
-- Verify that "%z*" matches "\0".
--
function TestAssertionIsLike.testPositive198()
    is_like("prefix@\0", "%z*", "positive test")
end



--
-- Verify that "%z-" matches "\0".
--
function TestAssertionIsLike.testPositive199()
    is_like("prefix@\0", "%z-", "positive test")
end



--
-- Verify that "%z?" matches "\0".
--
function TestAssertionIsLike.testPositive200()
    is_like("prefix@\0", "%z?", "positive test")
end



--
-- Verify that "%s" matches " ".
--
function TestAssertionIsLike.testPositive201()
    is_like("prefix@ ", "%s", "positive test")
end



--
-- Verify that "%s+" matches " ".
--
function TestAssertionIsLike.testPositive202()
    is_like("prefix@ ", "%s+", "positive test")
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



--
-- Negative test - wrong assertion.
--
function TestAssertionIsLike.testNegative08()
    is_like("", "a", "(expected) negative test")
end



--
-- Negative test - wrong assertion.
--
function TestAssertionIsLike.testNegative09()
    is_like("", "[0-9]+", "(expected) negative test")
end



--
-- Negative test - wrong assertion.
--
function TestAssertionIsLike.testNegative10()
    is_like("", "%d", "(expected) negative test")
end



--
-- Negative test - wrong assertion.
--
function TestAssertionIsLike.testNegative11()
    is_like("", "%d+", "(expected) negative test")
end



--
-- Verify that the function does not accept an integer as the first argument:
--
function TestAssertionIsLike.testNegative12()
    is_like(1, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a real number as the first argument:
--
function TestAssertionIsLike.testNegative13()
    is_like(1, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept an empty table as the first argument:
--
function TestAssertionIsLike.testNegative14()
    is_like({}, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a table as the first argument:
--
function TestAssertionIsLike.testNegative15()
    is_like({1,2,3}, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept nested table as the first argument:
--
function TestAssertionIsLike.testNegative16()
    is_like({{{1},2},3}, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a hash table as an argument:
--
function TestAssertionIsLike.testNegative17()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_like(table1, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsLike.testNegative18()
    is_like(print, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsLike.testNegative19()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_like() function with the function as its argument
    is_like(func, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsLike.testNegative20()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_like() function with the closure as its argument
    is_like(closure, "a", "(expected) negative test")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsLike.testNegative21()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_like() function with the coroutine as its argument
    is_like(func, "a", "coroutine is not a valid expression")
end

