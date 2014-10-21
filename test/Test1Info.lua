-- Test1Info.lua - check the graph & statistic submodules of Emender.
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

Test1Info = {
    -- required field
    metadata = {
        description = "Check the graph & statistic submodules of Emender",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-10-21",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls info() once.
--
function Test1Info.test()
    warn("Info#1")
end

