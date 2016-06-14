-- TestChangeLogURL.lua - check for basic Emender functionality
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

TestChangeLogURL = {
    -- required field
    metadata = {
        description = "Check that -C and --changelog-url CLI options work correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-06-14",
        tags = {"BasicTest", "SmokeTest"},
    }
}

--
-- Comment bound to the function TestChangeLogURL.testA().
--
function TestChangeLogURL.testChangeLogURL()
    if changeLogURL then
        pass("ChangeLog URL: " .. changeLogURL)
    else
        fail("ChangeLog URL is not set!")
    end
end

