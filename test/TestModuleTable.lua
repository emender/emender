-- TestModuleTable.lua - check the API for the Emender module 'table'.
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
        description = "Check the API for the Emender module 'table'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-08-04",
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



--
-- Check the function table.contains() - positive results are expected.
--
function TestModuleTable.testContainsPositive1()
    local tbl = {1, 2, 3, 42}
    is_true(table.contains(tbl, 42), "Check table.contains(42) for non empty table.")
    is_true(table.contains(tbl, 1),  "Check table.contains(1) for non empty table.")
    is_true(table.contains(tbl, 2),  "Check table.contains(2) for non empty table.")
    is_true(table.contains(tbl, 3),  "Check table.contains(3) for non empty table.")
end



--
-- Check the function table.contains() - positive results are expected.
--
function TestModuleTable.testContainsPositive2()
    local tbl = {"x", "y", "xyzzy"}
    is_true(table.contains(tbl, "x"),     "Check table.contains(\"x\") for non empty table.")
    is_true(table.contains(tbl, "y"),     "Check table.contains(\"y\") for non empty table.")
    is_true(table.contains(tbl, "xyzzy"), "Check table.contains(\"xyzzy\") for non empty table.")
end



--
-- Check the function table.contains() - positive results are expected.
--
function TestModuleTable.testContainsPositive3()
    local tbl = {nil, "x", "y"}
    is_true(table.contains(tbl, nil),     "Check table.contains(nil) for non empty table.")
    is_true(table.contains(tbl, "x"),     "Check table.contains(\"x\") for non empty table.")
    is_true(table.contains(tbl, "y"),     "Check table.contains(\"y\") for non empty table.")
end



--
-- Check the function table.contains() - positive results are expected.
--
function TestModuleTable.testContainsPositive4()
    local tbl = {1, 2, nil, 3, 4}
    is_true(table.contains(tbl, nil),    "Check table.contains(nil) for non empty table.")
    is_true(table.contains(tbl, 1),      "Check table.contains(1) for non empty table.")
    is_true(table.contains(tbl, 2),      "Check table.contains(2) for non empty table.")
    is_true(table.contains(tbl, 3),      "Check table.contains(3) for non empty table.")
    is_true(table.contains(tbl, 4),      "Check table.contains(4) for non empty table.")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize1()
    local tbl = {}
    is_equal(table.hashTableSize(tbl), 0,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize2()
    local tbl = {1, 2, 3, 4}
    is_equal(table.hashTableSize(tbl), 4,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize3()
    local tbl = {a=1, b=2, c=3, d=4}
    is_equal(table.hashTableSize(tbl), 4,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize4()
    local tbl = {a=1, b=2, c=3, d=4, e=nil}
    is_equal(table.hashTableSize(tbl), 4,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize5()
    local tbl = {1, 2, 3, 4, a=1, b=2, c=3, d=4}
    is_equal(table.hashTableSize(tbl), 8,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize6()
    local tbl = {1, 2, 3, 4, a=1, b=2, c=3, d=4, e=nil}
    is_equal(table.hashTableSize(tbl), 8,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize7()
    local tbl = {1, 2, 3, 4, a=1, b=2, c=3, d=4, e=nil, f=nil}
    is_equal(table.hashTableSize(tbl), 8,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize8()
    local tbl = {1, 2, 3, 4, a=1, b=2, c=3, d=4, e=nil, f=nil}
    is_equal(table.hashTableSize(tbl), 8,    "Check table.hashTableSize().")
end



--
-- Check the function table.hashTableSize().
--
function TestModuleTable.testHashTableSize9()
    local tbl = {x=nil, 1, 2, 3, 4, a=1, b=2, c=3, d=4, e=nil, f=nil}
    is_equal(table.hashTableSize(tbl), 8,    "Check table.hashTableSize().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare1()
    local tbl1 = {}
    local tbl2 = {}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare2()
    local tbl1 = {1, 2, 3, 4}
    local tbl2 = {1, 2, 3, 4}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end




--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare3()
    local tbl1 = {x=1, y=2}
    local tbl2 = {x=1, y=2}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare4()
    local tbl1 = {x=1, y=2, z=nil}
    local tbl2 = {x=1, y=2}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare5()
    local tbl1 = {x=1, y=2}
    local tbl2 = {x=1, y=2, z=nil}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare6()
    local tbl1 = {x=1, y=2, z=nil}
    local tbl2 = {x=1, y=2, w=nil}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare7()
    local tbl1 = {first=nil, x=1, y=2}
    local tbl2 = {x=1, y=2}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.compare().
--
function TestModuleTable.testTableCompare8()
    local tbl1 = {first=nil, x=1, y=2}
    local tbl2 = {first=nil, second=nil, x=1, y=2}
    is_true(table.compare(tbl1, tbl2), "Check table.compare().")
end



--
-- Check the function table.keys().
--
function TestModuleTable.testFunctionKeysOnEmptyTable()
    local tbl = {}
    is_equal(table.keys(tbl), {}, "Check table.keys() on empty table")
end



