-- TestDocComments.lua - check that docunit core works correctly.
-- Copyright (C) 2016 Pavel Tisnovsky
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

TestDocComments = {
    -- required field
    metadata = {
        description = "Check that docunit core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-12-02",
        tags = {"BasicTest", "SmokeTest"},
    },
}

--- This is comment for the testA.
function TestDocComments.testA()
    pass("The function TestDocComments.testA() is called properly.")
end

--
-- Comment bound to the function TestDocComments.testB().
--- This is comment for the testB.
--
function TestDocComments.testB()
    pass("The function TestDocComments.testB() is called properly.")
end

--
-- Comment bound to the function TestDocComments.testC().
--
function TestDocComments.testC()
    pass("The function TestDocComments.testC() is called properly.")
end

--
-- This
-- is
-- multiline
--- This is comment for the testD.
-- comment.
--
function TestDocComments.testD()
    pass("The function TestDocComments.testD() is called properly.")
end

--- TestE, 1st line
--- TestE, 2nd line
--- TestE, 3rd line
function TestDocComments.testE()
    pass("The function TestDocComments.testE() is called properly.")
end

