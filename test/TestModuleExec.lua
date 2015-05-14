-- TestModuleExec.lua - check the API for the Emender module 'exec'.
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

TestModuleExec = {
    -- required field
    metadata = {
        description = "Check the API for the Emender module 'exec'.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-05-14",
        tags = {"BasicTest", "ModuleTest"},
    }
}



--
-- Test if global function with the given name exists.
--
function TestModuleExec.doesFunctionExist(functionName)
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
-- Check if the following global function exists: 'execCaptureOutputAsTable'.
-- This function should be declared as part of exec module.
--
function TestModuleExec.testFunctionExecCaptureOutputAsTable()
    TestModuleExec.doesFunctionExist("execCaptureOutputAsTable")
end

