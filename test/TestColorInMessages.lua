-- TestColorInMessages.lua - check how color in messages are rendered.
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

TestColorInMessages = {
    metadata = {
        description = "Check how color in messages are rendered",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-12-04",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls pass() once.
--
function TestColorInMessages.test01()
    pass("No colors.")
end



--
-- This function calls pass() once.
--
function TestColorInMessages.test02()
    pass("One **emphasized** word.")
end



--
-- This function calls pass() once.
--
function TestColorInMessages.test03()
    pass("Two **emphasized** colored **words**.")
end



--
-- This function calls pass() once.
--
function TestColorInMessages.test04()
    pass("Do **you** want **to** see **many** colorized **words**?")
end

