-- Lua version checker module.
-- Copyright (C) 2014 Pavel Tisnovsky

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



-- Basic module structure.
local luaVersionChecker = {
    MINIMAL_MAJOR_VERSION = 5,
    MINIMAL_MINOR_VERSION = 1
}



--
-- Try to find a separator (dot) between Lua major version and minor version.
-- If the separator can't be found, exception is thrown.
--
function luaVersionChecker.getIndexOfDotSeparator(versionString)
    -- % is the escape character in Lua patterns
    local dotIndex = versionString:find("%.")

    -- index might not be found
    if not dotIndex then
        error("Error parsing language version.")
    end
    return dotIndex
end



--
-- Check the Lua major version.
--
function luaVersionChecker.checkMajorVersion(majorVersion)
    if majorVersion < luaVersionChecker.MINIMAL_MAJOR_VERSION then
        error("Wrong Lua version " .. majorVersion .. ". " .. badVersionString)
    end
end



--
-- Check the Lua minor version.
--
function luaVersionChecker.checkMinorVersion(majorVersion, minorVersion)
    if majorVersionInt == luaVersionChecker.MINIMAL_MAJOR_VERSION and
       minorVersionInt < luaVersionChecker.MINIMAL_MINOR_VERSION then
        error("Wrong Lua version 5." .. minorVersionInt .. ". " .. badVersionString)
    end
end



--
-- Check the Lua major and minor versions that are tested against constant
-- attributes MINIMAL_MAJOR_VERSION and MINIMAL_MINOR_VERSION.
--
function luaVersionChecker.checkMajorAndMinorVersions(versionString)
    local badVersionString = "Version >=" .. luaVersionChecker.MINIMAL_MAJOR_VERSION .. "." ..
                             luaVersionChecker.MINIMAL_MINOR_VERSION ..
                             " is required to use this tool."

    local dotIndex = luaVersionChecker.getIndexOfDotSeparator(versionString)
    -- the major version is placed after the "Lua " prefix
    local majorVersionStr = versionString:sub(5, dotIndex - 1)
    -- the minor version is placed after the separator (dot)
    local minorVersionStr = versionString:sub(dotIndex + 1)

    -- check for existence of major and minor versions
    if not majorVersionStr or not minorVersionStr then
        error("Error parsing language version.")
    end

    -- convert major and minor versions to numbers to be able to compare
    -- them with numeric constants
    local majorVersionInt = tonumber(majorVersionStr)
    local minorVersionInt = tonumber(minorVersionStr)

    -- perform both checks
    luaVersionChecker.checkMajorVersion(majorVersionInt)
    luaVersionChecker.checkMinorVersion(majorVersionInt, minorVersionInt)
end



--
-- Check if version of Lua used to run this application is correct and conform
-- to minimal requirements.
--
function luaVersionChecker.checkLuaVersion()
    local versionString = _VERSION
    if not versionString then
        error("Can not read _VERSION variable, that might mean that very old Lua is installed.")
    end

    local languageName = versionString:sub(1, 3)
    if languageName ~= "Lua" then
        error("Wrong language name: '" .. languageName .. "' ('Lua' name is expected)")
    end

    luaVersionChecker.checkMajorAndMinorVersions(versionString)
end



-- return the full structure if this module
return luaVersionChecker

