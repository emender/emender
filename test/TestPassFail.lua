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

TestPassFail = {
    -- required field
    metadata = {
        description = "This is the second test",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-25",
        tags = {"XMLcheck", "BasicTest", "SmokeTest"},
    },
}

function TestPassFail.test1pass()
    pass("1st pass")
end

function TestPassFail.test2passes()
    pass("1st pass")
    pass("2nd pass")
end

function TestPassFail.test3passes()
    for i = 1,3 do
        pass("pass #" ..i)
    end
end

function TestPassFail.test1fail()
    fail("1st fail")
end

function TestPassFail.test2fails()
    fail("1st fail")
    fail("2nd fail")
end

function TestPassFail.test3fails()
    for i = 1,3 do
        fail("fail #" ..i)
    end
end

function TestPassFail.testMixed()
    for i = 1,3 do
        pass("pass #" .. i)
        fail("fail #" .. i)
    end
end

function TestPassFail.testPassFailPass()
    pass("test passed!!!")
    fail("test failed!!!")
    pass("test passed!!!")
end

function TestPassFail.testFailFailPass()
    fail("test failed!!!")
    fail("test failed!!!")
    pass("test passed!!!")
end

function TestPassFail.testPassFailFail()
    pass("test passed!!!")
    fail("test failed!!!")
    fail("test failed!!!")
end

function TestPassFail.xyzzy()
    print(self.val)
end

function TestPassFail.foo()
    print("This method should not be called from the tool core!")
end

function TestPassFail.bar()
    self:foo()
end

