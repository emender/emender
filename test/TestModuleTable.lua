-- TestModuleTable.lua - check the API for the Emender module 'gendoc'.
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

TestModuleTable = {
    -- required field
    metadata = {
        description = "Check the API for the Emender module 'gendoc'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-06-11",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test if global module with the given name exists.
--
function TestModuleTable.doesModuleExist(functionName)
    -- try to get global object from the global table _G
    local object = _G[functionName]

    -- check if global object exists at all
    is_not_nil(object, "Check if global object with the name '" .. functionName .. "' exists.")
    if not object then
        return
    end

    -- check global object type
    is_type(object, "table", "Check if object with the name '" .. functionName .. "' has correct type")
end



--
-- Check if the following global module exists: 'table'.
--
function TestModuleTable.testModuleExistence()
    TestModuleTable.doesModuleExist("table")
end

