-- TestRequires4.lua - check if all required tools are available.
--
-- Copyright (C) 2015 Pavel Tisnovsky
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

TestRequires4 = {
    -- required field
    metadata = {
        description = "Check that core works correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-05-26",
        tags = {"BasicTest", "SmokeTest"},
    },
    -- check if the tool work properly with empty table
    requires = {"wget", "ls", "unknown-utility"}
}

function TestRequires4.testA()
    print("\tTestRequires4.testA()")
end

