-- TestFrontPageURL.lua - check for basic Emender functionality
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

TestFrontPageURL = {
    -- required field
    metadata = {
        description = "Check that -f and --front-page CLI options work correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-06-06",
        tags = {"BasicTest", "SmokeTest"},
    }
}

--
-- Comment bound to the function TestFrontPageURL.testA().
--
function TestFrontPageURL.testFrontPageURL()
    if frontPageURL then
        pass("Front page URL: " .. frontPageURL)
    else
        fail("Front page URL is not set!")
    end
end

