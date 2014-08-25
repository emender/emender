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

Test2 = {
    -- required field
    metadata = {
        description = "This is the second test",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-25",
        tags = {"XMLcheck", "BasicTest", "SmokeTest"},
    },
    -- any other values are arbitrary
    val = 42}

function Test2:testA()
    print("Test2:testA()")
end

function Test2:testB()
    print("Test2:testB()")
end

function Test2:xyzzy()
    print(self.val)
end

function Test2:foo()
    print("This method should not be called from the tool core!")
end

function Test2:bar()
    self:foo()
end

function Test2:testLocalValue()
    print("Test2:testLocalValue()")
    print(self.val)
end

