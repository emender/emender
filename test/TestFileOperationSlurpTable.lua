-- TestFileOperationSlurpTable.lua - check file I/O operations.
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

TestFileOperationSlurpTable = {
    -- required field
    metadata = {
        description = "Check file I/O operations.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-07",
        tags = {"BasicTest", "FileIO"},
    },
    -- any other values are arbitrary
    val = 42}



--
-- Positive test: check if it's possible to read from /etc/passwd
--
function TestFileOperationSlurpTable.testSlurpTable1()
    -- try to read file
    local content = slurpTable("/etc/passwd")
    -- check if file could be read
    is_not_nil(content, "/etc/passwd file should be readable")
end



--
-- Positive test: check if it's possible to read from /etc/fstab
--
function TestFileOperationSlurpTable.testSlurpTable2()
    -- try to read file
    local content = slurpTable("/etc/fstab")
    -- check if file could be read
    is_not_nil(content, "/etc/fstab file should be readable")
end



--
-- Negative test: check if it is not possible to read from /foo/bar/baz
--
function TestFileOperationSlurpTable.testSlurpTable3()
    -- try to read file
    local content = slurpTable("/foo/bar/baz")
    -- check if file can't be read
    is_nil(content, "/foo/bar/baz file can't be readable")
end



--
-- Negative test: check if it is not possible to read from ""
--
function TestFileOperationSlurpTable.testSlurpTable4()
    -- try to read file
    local content = slurpTable("")
    -- check if file can't be read
    is_nil(content, "file can't be readable")
end



--
-- Negative test: check if it is not possible to read from "?"
--
function TestFileOperationSlurpTable.testSlurpTable5()
    -- try to read file
    local content = slurpTable("?")
    -- check if file can't be read
    is_nil(content, "? file can't be readable")
end



--
-- Negative test: check if it is not possible to read from "*"
--
function TestFileOperationSlurpTable.testSlurpTable6()
    -- try to read file
    local content = slurpTable("*")
    -- check if file can't be read
    is_nil(content, "* file can't be readable")
end

