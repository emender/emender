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

