-- TestModuleGetopt.lua - check the API for the Emender module 'getopt'.
-- Copyright (C) 2014 Pavel Tisnovsky
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

TestModuleGetopt = {
    -- required field
    metadata = {
        description = "Check the API for the Emender module 'getopt'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-11",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test if global object with the given name exists.
--
function TestModuleGetopt.doesObjectExist(objectName)
    -- try to get global object from the global table _G
    local func = _G[objectName]

    -- check if global object exists at all
    is_not_nil(func, "Check if global object with the name '" .. objectName .. "' exists.")
    if not func then
        return
    end

    -- check global object type
    is_type(func, "table", "Check if object with the name '" .. objectName .. "' has correct type")
end



--
-- Check if the following global object exists: 'getopt'.
-- This function should be declared as part of getopt module.
--
function TestModuleGetopt.testObjectGetopt()
    TestModuleGetopt.doesObjectExist("getopt")
end

