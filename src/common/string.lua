--
-- Various enhancements of all string objects.
--
-- This file is part of Emender.
-- Copyright (C) 2014, 2015 Pavel Tisnovsky, Jaromir Hradilek, Pavel Vomacka
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
-- Remove trailing and leading whitespace from string.
--
function string.trim(str)
    -- make sure we don't get 'NPE'
    if not str then
        return nil
    end
    if str:find("^%s*$") then -- string contains only whitespace(s)
        return ""
    else
        return str:match("^%s*(.*%S)")
    end
end



--
-- Implementation of classical ltrim() function
-- known from other programming languages.
-- Remove leading whitespace from string.
--
function string.ltrim(str)
    -- make sure we don't get 'NPE'
    if not str then
        return nil
    end
    return str:gsub("^%s*", "")
end



--
-- Implementation of classical rtrim() function
-- known from other programming languages.
-- Remove trailing whitespace from string.
--
function string.rtrim(str)
    -- make sure we don't get 'NPE'
    if not str then
        return nil
    end
    -- this code is not efficient, but should work:
    -- s:gsub("%s*$", "")
    -- (see http://lua-users.org/wiki/CommonFunctions)

    -- try to find the first non-whitespace character from
    -- the right end of the string
    local n = #str
    while n > 0 and str:find("^%s", n) do
        n = n - 1
    end
    return str:sub(1, n)
end



--
-- Function that removes all punctuation characters and spaces from both sides of string.
--
-- @param text string which should be edited
-- @return edited string
--
function string.trimString(str)
    local pattern = "[%p%s]*(%w.*)$"

    -- make sure we don't get 'NPE'
    if not str then
        return nil
    end
    if string.len(str) > 3 then
        local getOutput = str:gmatch(pattern)
        local output = getOutput()
        if not output then
          return ""
        end

        output = output:reverse()

        -- Use the same pattern for the end of reversed string.
        getOutput = output:gmatch(pattern)
        output = getOutput()
        return output:reverse()
    else
        -- special cases for string of length 0 to 3 characters
        local getOutput = str:gmatch("[%p%s]*(%w*)[%p%s]*$")
        local output = getOutput()
        if not output then
            return ""
        else
            return output
        end
    end
end



--
-- Breaks lines at word boundaries, indents the text and aligns it along
-- the left margin:
--
function string.alignLeft(str, width, indent, first_indent)
    width = width or 75
    indent = indent or 0
    first_indent = first_indent or indent

    local line_length = 0

    local result = string.gsub(str, "(%s*)(%S+)",
        function (space, word)
            local word_length = string.len(word)
            local space_length = string.len(space)

            if line_length == 0 then
                line_length = first_indent + word_length
                return string.rep(" ", first_indent) .. word
            end

            if line_length + space_length + word_length > width then
                line_length = indent + word_length
                return "\n" .. string.rep(" ", indent) .. word
            end

            line_length = line_length + space_length + word_length

            return space .. word
        end
    )

    return result
end



--
-- Breaks lines at word boundaries, indents the text and aligns it along
-- the right margin:
--
function string.alignRight(str, width, indent, first_indent)
    width = width or 75

    local result = string.gsub(string.alignLeft(str, width, indent, first_indent), "([^\r\n]+)",
        function (line)
            local line_length = string.len(line)

            if line_length < width then
                return string.rep(" ", width - line_length) .. line
            end

            return line
        end
    )

    return result
end



--
-- Breaks lines at word boundaries, indents the text and centers it:
--
function string.alignCenter(str, width, indent, first_indent)
    width = width or 75

    local result = string.gsub(string.alignLeft(str, width, indent, first_indent), "([^\r\n]+)",
        function (line)
            local line_length = string.len(line)

            if line_length < width then
                -- we need to use explicit rounding here, because string.rep()
                -- is unstable when repeatCount is floating point value
                -- instead of integer (difference between Lua 5.2.2 and 5.2.3 etc.)
                local numOfSpaces = math.floor(0.5 + (width - line_length) / 2)
                return string.rep(" ", numOfSpaces) .. line
            end

            return line
        end
    )

    return result
end



--
-- Aligns two strings along the left and right margin and fills the space
-- between them with selected characters:
--
function string.horizontalFill(left_str, right_str, width, filler)
    width = width or 75
    filler = filler or " "

    local left_length = string.len(left_str)
    local right_length = string.len(right_str)

    if left_length + right_length < width then
        return left_str .. string.rep(filler, width - left_length - right_length) .. right_str
    end

    return left_str .. right_str
end



--
-- Escape common HTML characters in a given string.
--
function string.escapeHTML(str)
    -- be sure the string is not nil nor false
    if not str then
        return str
    end
    -- escape all four common HTML characters ie.
    -- transform them into corresponding HTML entities
    str = str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;")
    return str
end



--
-- Implementation of split() function. Many other ideas how to implement
-- this functionality are discussed here:
-- http://lua-users.org/wiki/SplitJoin
--
function string:split(separator)
    -- if separator is not given, simply return a table containing
    -- just one item - the string itself
    if not separator then
        return {self}
    end

    -- table which would contain result - parts of original string
    local parts = {}
    local pattern = string.format("([^%s]+)", separator)
    -- split the string using anonymous function called for each group
    self:gsub(pattern, function(c) parts[#parts+1] = c end)
    return parts
end



--
-- Implementation of classical lastIndexOf() function
--
function string:lastIndexOf(str)
    local i = self:match(".*" .. str .. "()")
    if not i then
        return nil
    else
        return i-1 end
end



--
--- Function that create sha256 hash from given string.
--
--  @param str string from which the hash will be counted.
--  @return sha256 hash
function string.getHash(str)
	-- If the function got nil or something else than string then return nil
	if not str or type(str) ~= "string" then
		return nil
	end

	-- Execute command and get sha256 hash.
	local command = "echo -n '" .. str .. "' | sha256sum"
	local sha256 = execCaptureOutputAsString(command)

	-- Return the hash.
	return string.trimString(sha256)
end

