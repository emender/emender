-- TestExec.lua - check the module exec.
-- Copyright (C) 2015 Pavel Tisnovsky
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

TestExec = {
    -- required field
    metadata = {
        description = "Check the module exec.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-04-10",
        tags = {"BasicTest", "SmokeTest"},
    }}

--
-- Test the behaviour of the following function: execCaptureOutputAsString.
--
function TestExec.test1()
    local result = execCaptureOutputAsString("echo 'Test'")
    is_equal(result, "Test", "Check if standard output of 'echo' command is correctly captured")
end

