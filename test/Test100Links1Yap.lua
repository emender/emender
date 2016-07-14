-- Test100Links1Yap.lua - check the following functions: link() and yap().
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

Test100Links1Yap = {
    -- required field
    metadata = {
        description = "Check the following functions: link() and yap().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-06-24",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls link() 100 times and yap() only once.
--
function Test100Links1Yap.testA()
    -- call link() 100 times
    for i = 1, 100 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call yap() once
    yap("Yap")
end



--
-- This function calls yap() once and link() 100 times.
--
function Test100Links1Yap.testB()
    -- call yap() once
    yap("Yap")
    -- call link() 100 times
    for i = 1, 100 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- This function link() 50 times, then yap() once and then link() 50 times.
--
function Test100Links1Yap.testC()
    -- call link() 50 times
    for i = 1, 50 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call yap() once
    yap("Yap")
    -- call link() 50 times
    for i = 1, 50 do
        link("link#" .. (i+50), "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Yap.testD()
    -- call link() once
    link("link#1", "https://github.com/emender/")
    -- call yap() once
    yap("Yap")
    -- call link() 99 times
    for i = 1, 99 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Yap.testE()
    -- call link() 99 times
    for i = 1, 99 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call yap() once
    yap("Yap")
    -- call link() once
    link("link#100", "https://github.com/emender/")
end



--
-- Mixed case.
--
function Test100Links1Yap.testF()
    -- call link() two trimes
    link("link#1", "https://github.com/emender/")
    link("link#1", "https://github.com/emender/")
    -- call yap() once
    yap("Yap")
    -- call link() 98 times
    for i = 1, 98 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Yap.testG()
    -- call link() 98 times
    for i = 1, 98 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call yap() once
    yap("Yap")
    -- call link() two times
    link("link#99", "https://github.com/emender/")
    link("link#100", "https://github.com/emender/")
end

