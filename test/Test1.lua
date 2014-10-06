-- Test1.lua - check for basic Emender functionality
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

--
-- Comment bound to the function Test1.testA().
--
function Test1.testA()
    pass("The function Test1.testA() is called properly.")
end

--
-- Comment bound to the function Test1.testB().
--
function Test1.testB()
    pass("The function Test1.testB() is called properly.")
end

function Test1.xyzzy()
    pass("The function Test1.xyzzy() is called from another function.")
end

function Test1.foo()
    fail("This method should not be called from the tool core!")
end

function Test1.bar()
    self:foo()
    fail("This method should not be called from the tool core!")
end

-- This is one line comment.
function Test1.testReadLocalValue()
    pass("Local variable bind to the test has the value " .. Test1.val)
end

--
-- This
-- is
-- multiline
-- comment.
--
function Test1.testCallOtherFunction()
    Test1.xyzzy()
end

function Test1.testReadWriteLocalValue()
    is_true(Test1.val == 42, "Old value is properly set to 42")
    print("\tOld value: " .. Test1.val)
    Test1.val = 6502
    is_true(Test1.val == 6502, "New value is properly set to 42")
    print("\tNew value: " .. Test1.val)
end

