-- Test100Failures1Yap.lua - check that graphs are rendered correctly.
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

Test100Failures1Yap = {
    -- required field
    metadata = {
        description = "Check that graphs are rendered correctly.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2015-12-08",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls fail() 100 times and yap() only once.
-- Yap is called at the end.
--
function Test100Failures1Yap.testA()
    -- call fail() 100 times
    for i = 1, 100 do
        fail("Fail#" .. i)
    end
    -- call yap() once
    yap("Yap")
end



--
-- This function calls yap() once and fail() 100 times.
-- Yap is called at the beginning.
--
function Test100Failures1Yap.testB()
    -- call yap() once
    yap("Yap")
    -- call fail() 100 times
    for i = 1, 100 do
        fail("Fail#" .. i)
    end
end



--
-- This function fail() 50 times, then yap() once and then fail() 50 times.
-- Yap is called in the middle of this test.
--
function Test100Failures1Yap.testC()
    -- call fail() 50 times
    for i = 1, 50 do
        fail("Fail#" .. i)
    end
    -- call yap() once
    yap("Yap")
    -- call fail() 50 times
    for i = 1, 50 do
        fail("Fail#" .. (i+50))
    end
end



--
-- Mixed case.
--
function Test100Failures1Yap.testD()
    -- call fail() once
    fail("Fail#1")
    -- call yap() once
    yap("Yap")
    -- call fail() 99 times
    for i = 1, 99 do
        fail("Fail#" .. i)
    end
end



--
-- Mixed case.
--
function Test100Failures1Yap.testE()
    -- call fail() 99 times
    for i = 1, 99 do
        fail("Fail#" .. i)
    end
    -- call yap() once
    yap("Yap")
    -- call fail() once
    fail("Fail#100")
end



--
-- Mixed case.
--
function Test100Failures1Yap.testF()
    -- call fail() two trimes
    fail("Fail#1")
    fail("Fail#2")
    -- call yap() once
    yap("Yap")
    -- call fail() 98 times
    for i = 1, 98 do
        fail("Fail#" .. i)
    end
end



--
-- Mixed case.
--
function Test100Failures1Yap.testG()
    -- call fail() three trimes
    fail("Fail#1")
    fail("Fail#2")
    fail("Fail#3")
    -- call yap() once
    yap("Yap")
    -- call fail() 97 times
    for i = 1, 97 do
        fail("Fail#" .. i)
    end
end



--
-- Mixed case.
--
function Test100Failures1Yap.testH()
    -- call fail() 98 times
    for i = 1, 98 do
        fail("Fail#" .. i)
    end
    -- call yap() once
    yap("Yap")
    -- call fail() two times
    fail("Fail#99")
    fail("Fail#100")
end



--
-- Mixed case.
--
function Test100Failures1Yap.testI()
    -- call fail() 97 times
    for i = 1, 97 do
        fail("Fail#" .. i)
    end
    -- call yap() once
    yap("Yap")
    -- call fail() three times
    fail("Fail#98")
    fail("Fail#99")
    fail("Fail#100")
end

