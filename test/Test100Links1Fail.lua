-- Test100Links1Fail.lua - check the following functions: link() and fail().
--
-- Copyright (C) 2014, 2015, 2016  Pavel Tisnovsky
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

Test100Links1Fail = {
    -- required field
    metadata = {
        description = "Check the following functions: link() and fail().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-06-24",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls link() 100 times and fail() only once.
--
function Test100Links1Fail.testA()
    -- call link() 100 times
    for i = 1, 100 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call fail() once
    fail("Fail")
end



--
-- This function calls fail() once and link() 100 times.
--
function Test100Links1Fail.testB()
    -- call fail() once
    fail("Fail")
    -- call link() 100 times
    for i = 1, 100 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- This function link() 50 times, then fail() once and then link() 50 times.
--
function Test100Links1Fail.testC()
    -- call link() 50 times
    for i = 1, 50 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call fail() once
    fail("Fail")
    -- call link() 50 times
    for i = 1, 50 do
        link("link#" .. (i+50), "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Fail.testD()
    -- call link() once
    link("link#1", "https://github.com/emender/")
    -- call fail() once
    fail("Fail")
    -- call link() 99 times
    for i = 1, 99 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Fail.testE()
    -- call link() 99 times
    for i = 1, 99 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call fail() once
    fail("Fail")
    -- call link() once
    link("link#100", "https://github.com/emender/")
end



--
-- Mixed case.
--
function Test100Links1Fail.testF()
    -- call link() two trimes
    link("link#1", "https://github.com/emender/")
    link("link#1", "https://github.com/emender/")
    -- call fail() once
    fail("Fail")
    -- call link() 98 times
    for i = 1, 98 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Fail.testG()
    -- call link() 98 times
    for i = 1, 98 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call fail() once
    fail("Fail")
    -- call link() two times
    link("link#99", "https://github.com/emender/")
    link("link#100", "https://github.com/emender/")
end

