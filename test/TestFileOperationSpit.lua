-- TestFileOperationSpit.lua - check file I/O operations.
--     the function spit().
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

TestFileOperationSpit = {
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
function TestFileOperationSpit.testSpit01()
    -- try to read file
    local content = spit("delete01.txt", "delete me")
    -- check if file is writable
    is_not_nil(content, "delete01.txt file should be writable")
end



--
-- Positive test: check if it's possible to write to local file.
--
function TestFileOperationSpit.testSpit02()
    -- try to read file
    local content = spit("./delete02.txt", "delete me")
    -- check if file is writable
    is_not_nil(content, "./delete02.txt file should be writable")
end



--
-- Positive test: check if it's possible to write to local file.
--
function TestFileOperationSpit.testSpit03()
    -- try to read file
    local content = spit("./././delete03.txt", "delete me")
    -- check if file is writable
    is_not_nil(content, "./././delete03.txt file should be writable")
end



--
-- Negative test: check if it is not possible to write to non-local file.
--
function TestFileOperationSpit.testSpit04()
    -- try to read file
    local content = spit("/delete.txt", "delete me")
    -- check if file is not writable
    is_nil(content, "/delete.txt file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpit.testSpit05()
    -- try to read file
    local content = spit("", "delete me")
    -- check if file is not writable
    is_nil(content, "'' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpit.testSpit06()
    -- try to read file
    local content = spit("/", "delete me")
    -- check if file is not writable
    is_nil(content, "'/' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpit.testSpit07()
    -- try to read file
    local content = spit("//", "delete me")
    -- check if file is not writable
    is_nil(content, "'//' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpit.testSpit08()
    -- try to read file
    local content = spit("./", "delete me")
    -- check if file is not writable
    is_nil(content, "'./' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a file with wrong name.
--
function TestFileOperationSpit.testSpit09()
    -- try to read file
    local content = spit("/./", "delete me")
    -- check if file is not writable
    is_nil(content, "'/./' file should not be writable")
end



--
-- Negative test: check if it is not possible to write to a read-only file.
--
function TestFileOperationSpit.testSpit10()
    -- try to read file
    local content = spit("/proc/kcore", "delete me")
    -- check if file is not writable
    is_nil(content, "'/proc/kcore' file should not be writable")
end

