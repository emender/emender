-- Test1InfoLink.lua - check the graph & statistic submodules of Emender.
-- Copyright (C) 2017 Pavel Tisnovsky
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

Test1InfoLink = {
    -- required field
    metadata = {
        description = "Check the behaviour of info() function.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-06-26",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls warn() once.
--
function Test1InfoLink.test()
    warn("Info text", "https://github.com/emender/")
    pass("Pass#1")
end

