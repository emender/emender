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
function TestModuleTable.doesModuleExist(moduleName)
    -- try to get global object from the global table _G
    local object = _G[moduleName]

    -- check if global object exists at all
    is_not_nil(object, "Check if global object with the name '" .. moduleName .. "' exists.")
    if not object then
        return
    end

    -- check global object type
    is_type(object, "table", "Check if object with the name '" .. moduleName .. "' has correct type")
end



--
-- Check if the following global module exists: 'table'.
--
function TestModuleTable.testModuleExistence()
    TestModuleTable.doesModuleExist("table")
end



--
-- Check the function table.contains() on empty table.
--
function TestModuleTable.testContainsOnEmptyTable()
    local tbl = {}
    is_false(table.contains(tbl, nil),     "Check table.contains(nil) for empty table.")
    is_false(table.contains(tbl, 42),      "Check table.contains(42) for empty table.")
    is_false(table.contains(tbl, "xyzzy"), "Check table.contains(\"xyzzy\") for empty table.")
    is_false(table.contains(tbl, "{}"),    "Check table.contains({}) for empty table.")
end



--
-- Check the function table.contains() - negative results are expected.
--
function TestModuleTable.testContainsNegative1()
    local tbl = {42}
    is_false(table.contains(tbl, nil),     "Check table.contains(nil) for non empty table.")
    is_false(table.contains(tbl, 0),       "Check table.contains(0) for non empty table.")
    is_false(table.contains(tbl, "xyzzy"), "Check table.contains(\"xyzzy\") for non empty table.")
    is_false(table.contains(tbl, "{}"),    "Check table.contains({}) for non empty table.")
end



--
-- Check the function table.contains() - negative results are expected.
--
function TestModuleTable.testContainsNegative2()
    local tbl = {"Hello world!"}
    is_false(table.contains(tbl, nil),     "Check table.contains(nil) for non empty table.")
    is_false(table.contains(tbl, 42),      "Check table.contains(42) for non empty table.")
    is_false(table.contains(tbl, "xyzzy"), "Check table.contains(\"xyzzy\") for non empty table.")
    is_false(table.contains(tbl, "{}"),    "Check table.contains({}) for non empty table.")
end

