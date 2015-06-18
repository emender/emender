-- Module with implementation of the function to show version number.
-- Copyright (C) 2014, 2015 Pavel Tisnovsky
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



--
-- Function to show Emender version
--
local version = {
    major = 0,
    minor = 0,
    revision = 1
}



--
-- Print Emender version to the standard output.
--
function version.showVersion()
    print("Emender version " .. version.major .. "." .. version.minor .. "." .. version.revision)
end



-- export module
return version

