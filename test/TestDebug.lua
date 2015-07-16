-- TestDebug.lua - check the yap() function.
-- Copyright (C) 2014 Pavel Tisnovsky
--
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

TestDebug = {
    -- required field
    metadata = {
        description = "Check the yap() function.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-07-15",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls Debug() once.
--
function TestDebug.test1()
    yap("Info#1")
end



--
-- This function calls Debug() once.
--
function TestDebug.test2()
    yap("Info#1")
    pass("OK")
end



--
-- This function calls Debug() once.
--
function TestDebug.test3()
    yap("Info#1")
    fail("Error")
end

