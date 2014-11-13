-- Test100Failures1Info.lua - check that graphs are rendered correctly.
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

Test100Failures1Info = {
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
-- This function calls fail() 100 times and pass() only once.
--
function Test100Failures1Info.testA()
    -- call fail() 100 times
    for i = 1, 100 do
        fail("Fail#" .. i)
    end
    -- call pass() once
    warn("Info")
end



--
-- This function calls pass() once and fail() 100 times.
--
function Test100Failures1Info.testB()
    -- call pass() once
    warn("Info")
    -- call fail() 100 times
    for i = 1, 100 do
        fail("Fail#" .. i)
    end
end



--
-- This function fail() 50 times, then pass() once and then fail() 50 times.
--
function Test100Failures1Info.testC()
    -- call fail() 50 times
    for i = 1, 50 do
        fail("Fail#" .. i)
    end
    -- call pass() once
    warn("Info")
    -- call fail() 50 times
    for i = 1, 50 do
        fail("Fail#" .. (i+50))
    end
end

