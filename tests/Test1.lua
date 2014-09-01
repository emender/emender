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

Test1 = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-25",
        tags = {"XMLcheck", "BasicTest", "SmokeTest"},
    },
    -- any other values are arbitrary
    val = 42}

function Test1.testA()
    print("\tTest1.testA()")
end

function Test1.testB()
    print("\tTest1.testB()")
end

function Test1.xyzzy()
    print("\t" .. Test1.val)
end

function Test1.foo()
    print("This method should not be called from the tool core!")
end

function Test1.bar()
    self:foo()
end

function Test1.testReadLocalValue()
    print("\t" .. Test1.val)
end

function Test1.testCallOtherFunction()
    Test1.xyzzy()
end

function Test1.testReadWriteLocalValue()
    print("\tOld value: " .. Test1.val)
    Test1.val = 6502
    print("\tNew value: " .. Test1.val)
end

