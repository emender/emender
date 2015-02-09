-- Test100Failures1Pass.lua - check that graphs are rendered correctly.
--
-- Copyright (C) 2014, 2015  Pavel Tisnovsky
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

Test100Failures1Pass = {
    -- required field
    metadata = {
        description = "Check that graphs are rendered correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-02-09",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls fail() 100 times and pass() only once.
--
function Test100Failures1Pass.testA()
    -- call fail() 100 times
    for i = 1, 100 do
        fail("Fail#" .. i)
    end
    -- call pass() once
    pass("Pass")
end



--
-- This function calls pass() once and fail() 100 times.
--
function Test100Failures1Pass.testB()
    -- call pass() once
    pass("Pass")
    -- call fail() 100 times
    for i = 1, 100 do
        fail("Fail#" .. i)
    end
end



--
-- This function fail() 50 times, then pass() once and then fail() 50 times.
--
function Test100Failures1Pass.testC()
    -- call fail() 50 times
    for i = 1, 50 do
        fail("Fail#" .. i)
    end
    -- call pass() once
    pass("Pass")
    -- call fail() 50 times
    for i = 1, 50 do
        fail("Fail#" .. (i+50))
    end
end



--
-- Mixed case.
--
function Test100Failures1Pass.testD()
    -- call fail() once
    fail("Fail#1")
    -- call pass() once
    pass("Pass")
    -- call fail() 99 times
    for i = 1, 99 do
        fail("Fail#" .. i)
    end
end



--
-- Mixed case.
--
function Test100Failures1Pass.testE()
    -- call fail() 99 times
    for i = 1, 99 do
        fail("Fail#" .. i)
    end
    -- call pass() once
    pass("Pass")
    -- call fail() once
    fail("Fail#100")
end



--
-- Mixed case.
--
function Test100Failures1Pass.testF()
    -- call fail() two trimes
    fail("Fail#1")
    fail("Fail#1")
    -- call pass() once
    pass("Pass")
    -- call fail() 98 times
    for i = 1, 98 do
        fail("Fail#" .. i)
    end
end



--
-- Mixed case.
--
function Test100Failures1Pass.testG()
    -- call fail() 98 times
    for i = 1, 98 do
        fail("Fail#" .. i)
    end
    -- call pass() once
    pass("Pass")
    -- call fail() two times
    fail("Fail#99")
    fail("Fail#100")
end

