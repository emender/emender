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
-- Return true if table contains given element, false otherwise.
--
function table.contains(table, element)
    -- loop over all table items
    for i = 1, #table do
        if table[i] == element then
            return true
        end
    end
    return false
end



--
-- Compute table size for hash tables (not necessarry for arrays)
--
function table.hashTableSize(table)
    i = 0
    -- loop over all pairs (or ipairs)
    for k,v in pairs(table) do
        i = i + 1
    end
    return i
end



--
-- Make a shallow copy of the given table.
-- (the behaviour is very different from the simple
-- assignment local table1=table2)
--
function table.copy(src)
    local dest = {}
    for key, value in pairs(src) do
        dest[key] = value
    end
    return dest
end



--
-- Performs a "deep" comparison of items stored in a table.
-- (please note that this algorithm needs to be recursive)
--
function table.compare(src, dst)
    -- 1st step - we would need to know type of source and destination
    local srcType = type(src)
    local destType = type(dst)

    -- when both values are tables, perform deep comparison
    if srcType == "table" and destType == "table" then

        -- compare all pairs key:val from the source table with the
        -- destination table
        for key, val1 in pairs(src) do
            -- try to find the value with the same key in the destination table
            local val2 = dst[key]
            if val2 == nil then
                return false
            end
            -- values could be tables too!
            if not table.compare(val1, val2) then
                return false
            end
        end

        -- compare all pairs key:val from the destination table with the
        -- source table
        for key, val1 in pairs(dst) do
            -- try to find the value with the same key in the source table
            local val2 = src[key]
            if val2 == nil then
                return false
            end
            -- values could be tables too!
            if not table.compare(val1, val2) then
                return false
            end
        end

        -- if we are here -> tables/subtables are the same
        return true
    else
        -- other values might be compared directly
        return src == dst
    end
end

