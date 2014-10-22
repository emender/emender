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
-- between them with space characters:
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
