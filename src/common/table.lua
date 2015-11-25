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



--
-- Return all keys stored in an association array.
-- Please note that keys are not sorted and values are returned
-- in "random" order.
--
function table.keys(src)
    -- table used to store all keys
    local keys = {}
    local i = 1

    -- loop over the whole table
    for key, value in pairs(src) do
        -- put key into the result array
        keys[i] = key
        i = i + 1
    end

    -- return the array containing all keys from the source table
    return keys
end



--
-- Return all keys stored in an association array.
-- Keys are sorted.
--
function table.sortedKeys(src)
    -- retrieve array containing all keys from the source table
    local allKeys = table.keys(src)
    -- sort that array
    table.sort(allKeys)
    return allKeys
end



--
-- Return all values stored in an association array.
-- Please note that values are not sorted and values are returned
-- in "random" order.
--
function table.values(src)
    -- table used to store all values
    local values = {}
    local i = 1

    -- loop over the whole table
    for key, value in pairs(src) do
        -- put value into the result array
        values[i] = value
        i = i + 1
    end

    -- return the array containing all values from the source table
    return values
end



--
-- Return all values stored in an association array.
-- Values are sorted.
--
function table.sortedValues(src)
    -- retrieve array containing all keys from the source table
    local allValues = table.values(src)
    -- sort that array
    table.sort(allValues)
    return allValues
end



--
-- Returns true if table does not exists or if its empty.
--
function table.isEmpty(tbl)
    -- if tbl == nil then return true as well
    return not tbl or next(tbl) == nil
end

--
-- Function which converts table from {[1]="a", [2]="b", etc.}
-- to {[a]=true. [b]=true, etc.}. Just because of speed
-- of finding items.
-- @param tbl the table which should be converted.
-- @return converted table.
function table.setValueToKey(tbl)
    if not tbl then
        return nil
    end

    local convertedTable = {}

    for _, value in ipairs(tbl) do
        convertedTable[value] = true
    end

    return convertedTable
end



--
-- Appends two tables into one. The values in second table will be added
-- at the end of the first table. This function works for tables which have keys
-- from 1 to x without any spaces.
--
--  @param table1 table which will be extended
--  @param table2 table which will be append to the table1
--  @return table with values from both tables
function table.appendTables(table1, table2)
    -- If at least one of tables is nil then return nil.
    if not table1 or not table2 then
        return nil
    end

    -- Prepare variable for result.
    local resultT = {}

    -- Copy content of table1 because we dont want to change this variable.
    for key, value in ipairs(table1) do
        resultT[key] = value
    end

    -- Add items from table #2 to the end of table #1.
    for i=1, #table2 do
        resultT[#resultT+1] = table2[i]
    end

    -- Return table.
    return resultT
end


--
-- Joins two table into one. It can be used for tables with various keys.
-- If there is the same key in the table1 and in the table2, the result
-- table will contain only value from the table2.
--
-- @param table1 table which will be extended
-- @param table2 table which items will be moved to the table1
-- @return table with all values.
function table.joinTables(table1, table2)
    -- If at least one of tables is nil then return nil.
    if not table1 or not table2 then
        return nil
    end

    -- Prepare variable for result.
    local resultT = {}

    -- Copy content of the first table.
    for key, value in pairs(table1) do
        resultT[key] = value
    end

    -- Go through all key-value pairs and insert them to the table1.
    for key, value in pairs(table2) do
        resultT[key] = value
    end

    -- Return table.
    return resultT
end
