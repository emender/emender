-- TestComments.lua - check that docunit core works correctly.
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

TestComments = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-08-25",
        tags = {"BasicTest", "SmokeTest"},
    },
}

-- This is one line comment.
function TestComments.testA()
    pass("The function TestComments.testA() is called properly.")
end

--
-- Comment bound to the function TestComments.testB().
--
function TestComments.testB()
    pass("The function TestComments.testB() is called properly.")
end

--
-- Comment bound to the function TestComments.testC().
--
function TestComments.testC()
    pass("The function TestComments.testC() is called properly.")
end

--
-- This
-- is
-- multiline
-- comment.
--
function TestComments.testD()
    pass("The function TestComments.testD() is called properly.")
end

function TestComments.testE()
    pass("The function TestComments.testE() is called properly.")
end

--
function TestComments.testF()
    pass("The function TestComments.testF() is called properly.")
end

--
--
--
function TestComments.testG()
    pass("The function TestComments.testG() is called properly.")
end

--
-- This is not test comment!
--

function TestComments.testH()
    pass("The function TestComments.testH() is called properly.")
end

