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



--
-- Module containing standard logger.
--



local logger = {
    codes = {
        bold = "",
        reset = "",
        color_red = "",
        color_green = "",
        color_yellow = "",
        color_blue = "",
        color_magenta = "",
        color_cyan = "",
    }
}

function readTputControlSequence(code)
    local handle = io.popen("tput " .. code)
    local result = handle:read("*a")
    handle:close()
    return result
end

function logger.setColorOutput(colorOutput)
    if colorOutput then
        logger.codes.bold          = readTputControlSequence("bold")
        logger.codes.reset         = readTputControlSequence("sgr0")
        logger.codes.color_red     = readTputControlSequence("setaf 1")
        logger.codes.color_green   = readTputControlSequence("setaf 2")
        logger.codes.color_yellow  = readTputControlSequence("setaf 3")
        logger.codes.color_blue    = readTputControlSequence("setaf 4")
        logger.codes.color_magenta = readTputControlSequence("setaf 5")
        logger.codes.color_cyan    = readTputControlSequence("setaf 6")
    end
end

function logger.log(message)
    print(message)
end

function logger.warning(message)
    print(message)
end

function logger.error(message)
    print(message)
end

return logger

