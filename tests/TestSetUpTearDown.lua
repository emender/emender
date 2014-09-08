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

TestSetUpTearDown = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-25",
        tags = {"BasicTest"},
    }
}

function TestSetUpTearDown.setUp()
    print("\tsetUp() function called")
end

function TestSetUpTearDown.tearDown()
    print("\ttearDown() function called")
end

function TestSetUpTearDown.testA()
    print("\tTestSetUpTearDown.testA()")
end

function TestSetUpTearDown.testB()
    print("\tTestSetUpTearDown.testB()")
end

