-- TestUnderscoreInNames.lua - check that docunit core works correctly.
-- Copyright (C) 2014, 2015, 2016 Pavel Tisnovsky
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

TestUnderscoreInNames = {
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
-- Comment bound to the function TestUnderscoreInNames.testA().
--
function TestUnderscoreInNames.testA()
    pass("The function TestUnderscoreInNames.testA() is called properly.")
end

--
-- Comment bound to the function TestUnderscoreInNames.testB().
--
function TestUnderscoreInNames.testWord1Word2()
    pass("The function TestUnderscoreInNames.testWord1Word2() is called properly.")
end

function TestUnderscoreInNames.testWord1_Word2()
    pass("The function TestUnderscoreInNames.testWord1_Word2() is called properly.")
end

function TestUnderscoreInNames.testWord1_word2_word3()
    pass("The function TestUnderscoreInNames.testWord1_word2_word3() is called properly.")
end

