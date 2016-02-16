-- Publican tests core.
-- Copyright (C) 2016  Pavel Tisnovsky
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
-- Load all libraries required by this test.
--
function loadAllPublicanLibraries()
    dofile(getScriptDirectory() .. "lib/xml.lua")
    dofile(getScriptDirectory() .. "lib/docbook.lua")
    dofile(getScriptDirectory() .. "lib/publican.lua")
    dofile(getScriptDirectory() .. "lib/authorgroup.lua")
    dofile(getScriptDirectory() .. "lib/infofile.lua")
    dofile(getScriptDirectory() .. "lib/revhistory.lua")
    yap("All libraries loaded.")
end



--
-- Create the Publican object.
--
function createPublicanInstance(theTest)
    -- Create the Publican object:
    theTest.publicanInstance = publican.create("publican.cfg")

    if not theTest.publicanInstance then
        fail("Failed to create the Publican object. Ending now.")
    else
        yap("Publican object created.")
    end
end



--
-- Find the main file (name_of_the_book.xml).
--
function loadMainFile(theTest)
    -- Find the main file
    theTest.mainFile = theTest.publicanInstance:findMainFile()

    if not theTest.mainFile then
        fail("Failed to load/read main file.")
    else
        yap("Main file found: " .. theTest.mainFile)
    end
end



