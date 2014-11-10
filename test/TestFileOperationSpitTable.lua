-- TestFileOperationSpitTable.lua - check file I/O operations.
--     the function spitTable().
--
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

TestFileOperationSpitTable = {
    -- required field
    metadata = {
        description = "Check file I/O operations.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-07",
        tags = {"BasicTest", "FileIO"},
    }
}



--
-- Positive test: check if it's possible to write to local file.
--
function TestFileOperationSpitTable.testSpitTable01()
    -- try to read file
    local content = spitTable("delete01.txt", {"this", "is", "table"})
    -- check if file is writable
    is_not_nil(content, "delete01.txt file should be writable")
end



--
-- Positive test: check if it's possible to write to local file.
--
function TestFileOperationSpitTable.testSpitTable02()
    -- try to read file
    local content = spitTable("./delete02.txt", {"this", "is", "table"})
    -- check if file is writable
    is_not_nil(content, "./delete02.txt file should be writable")
end



--
-- Positive test: check if it's possible to write to local file.
--
function TestFileOperationSpitTable.testSpitTable03()
    -- try to read file
    local content = spitTable("./././delete03.txt", {"this", "is", "table"})
    -- check if file is writable
    is_not_nil(content, "./././delete03.txt file should be writable")
end



--
-- Negative test: check if it is not possible to write to non-local file.
--
function TestFileOperationSpitTable.testSpitTable04()
    -- try to read file
    local content = spitTable("/delete.txt", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "/delete.txt file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpitTable.testSpitTable05()
    -- try to read file
    local content = spitTable("", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "'' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpitTable.testSpitTable06()
    -- try to read file
    local content = spitTable("/", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "'/' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpitTable.testSpitTable07()
    -- try to read file
    local content = spitTable("//", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "'//' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpitTable.testSpitTable08()
    -- try to read file
    local content = spitTable("./", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "'./' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpitTable.testSpitTable09()
    -- try to read file
    local content = spitTable("/./", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "'/./' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a read-only file.
--
function TestFileOperationSpitTable.testSpitTable10()
    -- try to read file
    local content = spitTable("/proc/kcore", {"this", "is", "table"})
    -- check if file is not writable
    is_nil(content, "'/proc/kcore' file should not be writable")
end

