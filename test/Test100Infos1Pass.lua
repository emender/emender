-- Test100Infos1Pass.lua - check that graphs are rendered correctly.
-- Copyright (C) 2014 Pavel Tisnovsky
--
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

Test100Infos1Pass = {
    -- required field
    metadata = {
        description = "Check that graphs are rendered correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-13",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls pass() 100 times and fail() only once.
--
function Test100Infos1Pass.testA()
    -- call pass() 100 times
    for i = 1, 100 do
        warn("Info#" .. i)
    end
    -- call fail() once
    pass("Pass")
end



--
-- This function calls fail() once and pass() 100 times.
--
function Test100Infos1Pass.testB()
    -- call fail() once
    pass("Pass")
    -- call pass() 100 times
    for i = 1, 100 do
        warn("Info#" .. i)
    end
end



--
-- This function pass() 50 times, then fail() once and then pass() 50 times.
--
function Test100Infos1Pass.testC()
    -- call pass() 50 times
    for i = 1, 50 do
        warn("Info#" .. i)
    end
    -- call fail() once
    pass("Pass")
    -- call pass() 50 times
    for i = 1, 50 do
        warn("Info#" .. (i+50))
    end
end

