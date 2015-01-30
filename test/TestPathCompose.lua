-- TestPathCompose.lua - test the behavior of the path.compose() method
-- Copyright (C) 2015 Jaromir Hradilek

-- This file is part of Emender.

-- This program is free software:  you can redistribute it and/or modify it
-- under the terms of  the  GNU General Public License  as published by the
-- Free Software Foundation, version 3 of the License.
--
-- This program  is  distributed  in the hope  that it will be useful,  but
-- WITHOUT  ANY WARRANTY;  without  even the implied warranty of MERCHANTA-
-- BILITY or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
-- License for more details.
--
-- You should have received a copy of the GNU General Public License  along
-- with this program. If not, see <http://www.gnu.org/licenses/>.

TestPathCompose = {
    metadata = {
        description = "Test the behavior of the path.compose() method.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2015-01-29",
        tags = {"BasicTest", "SmokeTest"}
    }
}

--
-- Verify that the method returns nil when no arguments are supplied:
--
function TestPathCompose.testNil()
    local directory = path.compose()
    is_nil(directory, "The method returns nil: '" .. tostring(directory) .. "'")
end

--
-- Verify that the method returns nil when an empty string is supplied:
--
function TestPathCompose.testEmptyString()
    local directory = path.compose("")
    is_nil(directory, "The method returns nil: '" .. tostring(directory) .. "'")
end

--
-- Verify that the method returns nil when an empty space is supplied:
--
function TestPathCompose.testWhiteSpace()
    local directory = path.compose(" ")
    is_nil(directory, "The method returns nil: '" .. tostring(directory) .. "'")
end

--
-- Verify that the method accepts the root directory:
--
function TestPathCompose.testRootDirectory()
    local directory = tostring(path.compose("/"))
    is_equal(directory, "/", "The method returns the root directory: '" .. directory .. "'")
end

--
-- Verify that the method correctly processes an absolute path:
--
function TestPathCompose.testAbsolutePath()
    local directory = tostring(path.compose("/", "usr", "local", "bin", "emend"))
    is_equal(directory, "/usr/local/bin/emend", "The method returns an absolute path: '" .. directory .. "'")
end

--
-- Verify that the method correctly processes a relative path:
--
function TestPathCompose.testRelativePath()
    local directory = tostring(path.compose("~", ".local", "bin", "emend"))
    is_equal(directory, "~/.local/bin/emend", "The method returns a relative path: '" .. directory .. "'")
end

--
-- Verify that the method correctly strips trailing forward slashes:
--
function TestPathCompose.testTrailingSlashes()
    local directory = tostring(path.compose("/", "usr/", "local/", "bin/", "emend"))
    is_equal(directory, "/usr/local/bin/emend", "The method strips trailing forward slashes: '" .. directory .. "'")
end

--
-- Verify that the method correctly strips trailing forward slashes:
--
function TestPathCompose.testTrailingSpaces()
    local directory = tostring(path.compose(" / ", " usr ", " local ", " bin ", " emend "))
    is_equal(directory, "/usr/local/bin/emend", "The method strips leading and trailing spaces: '" .. directory .. "'")
end
