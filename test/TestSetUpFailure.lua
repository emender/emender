-- TestSetUpFailure.lua - check for basic Emender functionality
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

TestSetUpFailure = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-12-11",
        tags = {"BasicTest"},
    }
}

function TestSetUpFailure.testA()
    pass("TestSetUpFailure.testA() function properly called.")
end

function TestSetUpFailure.testB()
    pass("TestSetUpFailure.testB() function properly called.")
end



--
-- setUp() function fails that means that the whole test should
-- fail immediatelly.
--
function TestSetUpFailure.setUp()
    fail("setUp() failure.")
end

