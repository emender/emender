-- exec.lua - a module containing functions for new commands execution and capure outputs.
--
-- Copyright (C) 2015  Pavel Tisnovsky
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



function execCaptureOutputAsTable(command)
    -- execute new process
    local process,x = io.popen(command, "r")

    -- check the return value (io.popen can fail)
    if not process then
        return nil
    end

    -- capture whole output (if any)
    local lines = process:lines()
    if not lines then
        return nil
    end

    -- transform output to table
    -- (clone is needed here because the process will be closed ASAP)
    local result = {}
    -- loop over all lines and insert each line into table
    for line in lines do
        table.insert(result, line)
    end

    -- be nice to operating system and remove PID as soon as possible ;)
    process:close()
    return result
end

