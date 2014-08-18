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
        author = "Pavel Tisnovsky",
        email = "ptisnovs@redhat.com",
        tags = {"XMLcheck", "BasicTest", "SmokeTest"},
    },
    -- any other values are arbitrary
    val = 42}

function Test1:testA()
    print("Test1:testA()")
end

function Test1:testB()
    print("Test1:testB()")
end

function Test1:xyzzy()
    print(self.val)
end

function Test1:foo()
    print("This method should not be called from the tool core!")
end

function Test1:bar()
    self:foo()
end

function Test1:testLocalValue()
    print("Test1:testLocalValue()")
    print(self.val)
end

