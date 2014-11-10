-- TestFileOperationSlurpTable.lua - check file I/O operations.
--     the function slurpTable().
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

TestFileOperationSlurpTable = {
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
-- Positive test: check if it's possible to read from /etc/passwd
--
function TestFileOperationSlurpTable.testSlurpTable01()
    -- try to read file
    local content = slurpTable("/etc/passwd")
    -- check if file could be read
    is_not_nil(content, "/etc/passwd file should be readable")
end



--
-- Positive test: check if it's possible to read from /etc/group
--
function TestFileOperationSlurpTable.testSlurpTable02()
    -- try to read file
    local content = slurpTable("/etc/group")
    -- check if file could be read
    is_not_nil(content, "/etc/group file should be readable")
end



--
-- Positive test: check if it's possible to read from /etc/fstab
--
function TestFileOperationSlurpTable.testSlurpTable03()
    -- try to read file
    local content = slurpTable("/etc/fstab")
    -- check if file could be read
    is_not_nil(content, "/etc/fstab file should be readable")
end



--
-- Positive test: check if it's possible to read from /etc/issue
--
function TestFileOperationSlurpTable.testSlurpTable04()
    -- try to read file
    local content = slurpTable("/etc/issue")
    -- check if file could be read
    is_not_nil(content, "/etc/issue file should be readable")
end



--
-- Negative test: check if it is not possible to read from /foo/bar/baz
--
function TestFileOperationSlurpTable.testSlurpTable05()
    -- try to read file
    local content = slurpTable("/foo/bar/baz")
    -- check if file can't be read
    is_nil(content, "/foo/bar/baz file can't be readable")
end



--
-- Negative test: check if it is not possible to read from ""
--
function TestFileOperationSlurpTable.testSlurpTable06()
    -- try to read file
    local content = slurpTable("")
    -- check if file can't be read
    is_nil(content, "file can't be readable")
end



--
-- Negative test: check if it is not possible to read from "?"
--
function TestFileOperationSlurpTable.testSlurpTable07()
    -- try to read file
    local content = slurpTable("?")
    -- check if file can't be read
    is_nil(content, "? file can't be readable")
end



--
-- Negative test: check if it is not possible to read from "*"
--
function TestFileOperationSlurpTable.testSlurpTable08()
    -- try to read file
    local content = slurpTable("*")
    -- check if file can't be read
    is_nil(content, "* file can't be readable")
end



--
-- Negative test: check if it is not possible to read from ":"
--
function TestFileOperationSlurpTable.testSlurpTable09()
    -- try to read file
    local content = slurpTable(":")
    -- check if file can't be read
    is_nil(content, ": file can't be readable")
end



--
-- Negative test: check if it is not possible to read from "/proc/kcore"
--
function TestFileOperationSlurpTable.testSlurpTable10()
    -- try to read file
    local content = slurpTable("/proc/kcore")
    -- check if file can't be read
    is_nil(content, "/proc/kcore file can't be readable")
end

