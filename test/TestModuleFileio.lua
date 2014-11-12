-- TestModuleFileio.lua - check the API for the Emender module 'fileio'.
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

TestModuleFileio = {
    -- required field
    metadata = {
        description = "Check the API for the Emender module 'fileio'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-11",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test if global function with the given name exists.
--
function TestModuleFileio.doesFunctionExist(functionName)
    -- try to get global object from the global table _G
    local func = _G[functionName]

    -- check if global object exists at all
    is_not_nil(func, "Check if global object with the name '" .. functionName .. "' exists.")
    if not func then
        return
    end

    -- check global object type
    is_type(func, "function", "Check if object with the name '" .. functionName .. "' has correct type")
end



--
-- Check if the following global function exists: 'spit'.
-- This function should be declared as part of fileio module.
--
function TestModuleFileio.testFunctionSpit()
    TestModuleFileio.doesFunctionExist("spit")
end



--
-- Check if the following global function exists: 'spitTable'.
-- This function should be declared as part of fileio module.
--
function TestModuleFileio.testFunctionSpitTable()
    TestModuleFileio.doesFunctionExist("spitTable")
end



--
-- Check if the following global function exists: 'slurp'.
-- This function should be declared as part of fileio module.
--
function TestModuleFileio.testFunctionSlurp()
    TestModuleFileio.doesFunctionExist("slurp")
end



--
-- Check if the following global function exists: 'slurpTable'.
-- This function should be declared as part of fileio module.
--
function TestModuleFileio.testFunctionSlurpTable()
    TestModuleFileio.doesFunctionExist("slurpTable")
end



