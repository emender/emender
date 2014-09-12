-- TestManPages.lua - verify that manual pages are present and valid
-- Copyright (C) 2014 Jaromir Hradilek

-- This file is part of Emender.

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

TestManPages = {
    metadata = {
        description = "Verify that all manual pages are present and valid.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-09-11",
        tags = {"SmokeTest"}
    },
    requires = {"podlint"}
}

function TestManPages.setUp()
    TestManPages.pages = {
        "doc/man/man1/emend.pod",
        "doc/man/man3/emender.pod",
        "doc/man/man5/emender_xml.pod"
    }
end

function TestManPages.testExistence()
    for i, name in ipairs(TestManPages.pages) do
        local file = io.open(name, "r")

        if file ~= nil then
            io.close(file)
            pass("Manual page exists: " .. name)
        else
            fail("Manual page exists: " .. name)
        end
    end
end

function TestManPages.testValidity()
    for i, name in ipairs(TestManPages.pages) do
        local f = assert(io.popen("podlint " .. name .. " 2>/dev/null"))
        local output = f:read("*a")
        f:close()

        is_not_type(output, "nil", "Manual page is valid: " .. name)
    end
end
