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

TestWithoutFunctions = {
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
function TestWithoutFunctions._testA()
    pass("The function TestWithoutFunctions._testA() is called properly.")
end

--
-- Comment bound to the function TestWithoutFunctions._testB().
--
function TestWithoutFunctions._testB()
    pass("The function TestWithoutFunctions._testB() is called properly.")
end

--
-- Comment bound to the function TestWithoutFunctions._testC().
--
function TestWithoutFunctions._testC()
    pass("The function TestWithoutFunctions._testC() is called properly.")
end

--
-- This
-- is
-- multiline
-- comment.
--
function TestWithoutFunctions._testD()
    pass("The function TestWithoutFunctions._testD() is called properly.")
end

function TestWithoutFunctions._testE()
    pass("The function TestWithoutFunctions._testE() is called properly.")
end

--
function TestWithoutFunctions._testF()
    pass("The function TestWithoutFunctions._testF() is called properly.")
end

--
--
--
function TestWithoutFunctions._testG()
    pass("The function TestWithoutFunctions._testG() is called properly.")
end

