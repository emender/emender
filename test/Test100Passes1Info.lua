-- Test100Passes1Info.lua - check that graphs are rendered correctly.
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

Test100Passes1Info = {
    -- required field
    metadata = {
        description = "Check that graphs are rendered correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-10-08",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls pass() 100 times and info() only once.
--
function Test100Passes1Info.testA()
    -- call pass() 100 times
    for i = 1, 100 do
        pass("Pass#" .. i)
    end
    -- call info() once
    info("Info message")
end



--
-- This function calls info() once and pass() 100 times.
--
function Test100Passes1Info.testB()
    -- call info() once
    info("Info message")
    -- call pass() 100 times
    for i = 1, 100 do
        pass("Pass#" .. i)
    end
end



--
-- This function pass() 50 times, then info() once and then pass() 50 times.
--
function Test100Passes1Info.testC()
    -- call pass() 50 times
    for i = 1, 50 do
        pass("Pass#" .. i)
    end
    -- call info() once
    info("Info message")
    -- call pass() 50 times
    for i = 1, 50 do
        pass("Pass#" .. (i+50))
    end
end

