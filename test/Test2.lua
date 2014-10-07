-- Test2.lua - check that docunit core works correctly.
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

Test2 = {
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
-- Comment bound to the function Test2.testA().
--
function Test2.testA()
    pass("The function Test2.testA() is called properly.")
end

--
-- Comment bound to the function Test2.testB().
--
function Test2.testB()
    pass("The function Test2.testB() is called properly.")
end

function Test2.xyzzy()
    pass("The function Test2.xyzzy() is called from another function.")
end

function Test2.foo()
    fail("This method should not be called from the tool core!")
end

function Test2.bar()
    fail("This method should not be called from the tool core!")
    self:foo()
end

-- This is one line comment.
function Test2.testReadLocalValue()
    pass("Local variable bind to the test has the value " .. Test2.val)
end

--
-- This
-- is
-- multiline
-- comment.
--
function Test2.testCallOtherFunction()
    Test2.xyzzy()
end

function Test2.testReadWriteLocalValue()
    is_true(Test2.val == 42, "Old value is properly set to 42")
    print("\tOld value: " .. Test2.val)
    Test2.val = 6502
    is_true(Test2.val == 6502, "New value is properly set to 42")
    print("\tNew value: " .. Test2.val)
end

