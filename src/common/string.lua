--
-- This file is part of Emender.
-- Copyright (C) 2014 Pavel Tisnovsky, Jaromir Hradilek
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



--
-- Module containing various functions and methods for string processing.
--



--
-- Tests if the given string starts with the specified prefix.
--
function string.startsWith(str, prefix)
    local substring = string.sub(str, 1, string.len(prefix))
    return prefix == "" or substring == prefix
end

--
-- Tests if the given string ends with the specified suffix.
--
function string.endsWith(str, suffix)
    local substring = string.sub(str, -string.len(suffix))
    return suffix == "" or substring == suffix
end

--
-- Just an alias for sub()
--
function string.subs(str, from, to)
    return string.sub(str, from, to)
end

--
-- Another alias for sub()
-- (for Java developers :)
--
function string.substring(str, from, to)
    return string.sub(str, from, to)
end

--
-- Implementation of classical trim() function
-- known from other programming languages.
--
function string.trim(str)
    if str:find("^%s*$") then -- string contains only whitespace(s)
        return ""
    else
        return str:match("^%s*(.*%S)")
    end
end

