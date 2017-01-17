-- TestIniFileReader.lua - check the module iniFileReader.
-- Copyright (C) 2017 Pavel Tisnovsky
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

TestIniFileReader = {
    -- required field
    metadata = {
        description = "Check the module iniFileReader.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2017-01-17",
        tags = {"BasicTest", "SmokeTest"},
    },
}

--
-- Comment bound to the function Test2.testA().
--
function TestIniFileReader.testIniFile1()
    local data = iniFileReader.readIni("test/ini1.ini")
    is_not_nil(data.section, "Check if returned table contains expected section")
    if data.section then
        is_not_nil(data.section.name, "Check if returned table contains expected section")
        is_equal(data.section.name, "value", "Check if INI entry is contained in parsed INI file")
    else
        fail("INI was not read properly")
    end
end

