-- Test100Links1Info.lua - check the following functions: link() and warn().
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

Test100Links1Info = {
    -- required field
    metadata = {
        description = "Check the following functions: link() and warn().",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2016-06-24",
        tags = {"BasicTest", "SmokeTest"},
    },
}



--
-- This function calls link() 100 times and warn() only once.
--
function Test100Links1Info.testA()
    -- call link() 100 times
    for i = 1, 100 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call warn() once
    warn("Info")
end



--
-- This function calls warn() once and link() 100 times.
--
function Test100Links1Info.testB()
    -- call warn() once
    warn("Info")
    -- call link() 100 times
    for i = 1, 100 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- This function link() 50 times, then warn() once and then link() 50 times.
--
function Test100Links1Info.testC()
    -- call link() 50 times
    for i = 1, 50 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call warn() once
    warn("Info")
    -- call link() 50 times
    for i = 1, 50 do
        link("link#" .. (i+50), "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Info.testD()
    -- call link() once
    link("link#1", "https://github.com/emender/")
    -- call warn() once
    warn("Info")
    -- call link() 99 times
    for i = 1, 99 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Info.testE()
    -- call link() 99 times
    for i = 1, 99 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call warn() once
    warn("Info")
    -- call link() once
    link("link#100", "https://github.com/emender/")
end



--
-- Mixed case.
--
function Test100Links1Info.testF()
    -- call link() two trimes
    link("link#1", "https://github.com/emender/")
    link("link#1", "https://github.com/emender/")
    -- call warn() once
    warn("Info")
    -- call link() 98 times
    for i = 1, 98 do
        link("link#" .. i, "https://github.com/emender/")
    end
end



--
-- Mixed case.
--
function Test100Links1Info.testG()
    -- call link() 98 times
    for i = 1, 98 do
        link("link#" .. i, "https://github.com/emender/")
    end
    -- call warn() once
    warn("Info")
    -- call link() two times
    link("link#99", "https://github.com/emender/")
    link("link#100", "https://github.com/emender/")
end

