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
    if path.file_exists("publican.cfg") then
        theTest.publicanInstance = publican.create("publican.cfg")

        if not theTest.publicanInstance then
            fail("Failed to create the Publican object. Ending now.")
        else
            yap("Publican object created.")
        end
    else
        fail("publican.cfg does not exist")
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



--
-- Create the DocBook object.
--
function createDocbookInstance(theTest)
    theTest.docbookInstance = docbook.create(theTest.mainFile)

    if not theTest.docbookInstance then
        fail("Failed to create the DocBook object. Ending now.")
    else
        yap("Docbook object created.")
    end
end



--
-- Create the XML object.
--
function createXMLInstance(theTest)
    theTest.xmlInstance = xml.create(theTest.mainFile)

    if not theTest.xmlInstance then
        fail("Failed to create the XML object. Ending now.")
    else
        yap("XML object created.")
    end
end



--
-- Create the Author_Group object.
--
function createAuthorGroupInstance(theTest)
    theTest.authInstance = theTest.docbookInstance:getAuthorGroup()

    if not theTest.authInstance then
        fail("Failed to create the Author_Group object. Ending now.")
    else
        yap("Author group object created.")
    end
end



--
-- Create the Book_Info object.
--
function createBookInfoInstance(theTest)
    theTest.bookInfoInstance = theTest.docbookInstance:getInfoFile()

    if not theTest.bookInfoInstance then
        fail("Failed to create the Book_Info object. Ending now.")
    else
        yap("Book_Info object created.")
    end
end



--
-- Create the Revision_History object.
--
function createRevisionHistoryInstance(theTest)
    theTest.revisionHistoryInstance = theTest.docbookInstance:getRevHistory()

    if not theTest.revisionHistoryInstance then
        fail("Failed to create the Revision_History object. Ending now.")
    else
        yap("Revision History object created.")
    end
end

local actualTest = nil

--
-- Setup phase of the test.
--
function setupPublicanTest(theTest)
    actualTest = theTest
    loadAllPublicanLibraries()
    createPublicanInstance(theTest)
    if theTest.publicanInstance then
        loadMainFile(theTest)
        createDocbookInstance(theTest)
        createXMLInstance(theTest)
        createAuthorGroupInstance(theTest)
        createBookInfoInstance(theTest)
        createRevisionHistoryInstance(theTest)
    else
        warn("Can not initialize, skipping all other steps")
    end
end



function getDocumentTitle()
    return actualTest.bookInfoInstance:documentTitle()
end

function getPublicanOption(name)
    return actualTest.publicanInstance:getOption(name)
end

function getEmails()
    return actualTest.authInstance:emails()
end

function getOrgdiv()
    return actualTest.authInstance:orgdiv()
end

function is_not_missing(value, message)
    is_not_nil(value, message)
end

function is_not_empty_string(stringValue, message)
    if stringValue then
        is_true(stringValue:trim() ~= "", message)
    else
        fail("Value is nil")
    end
end

function getBrandList()
    return table.concat(actualTest.brands, ", ")
end

function checkBrand(brand)
    return table.contains(actualTest.brands, brand)
end

function readXMLFile(filename)
    return path.compose(actualTest.language, filename)
end

function readXMLContent(filename)
    -- Compose the file name:
    local file = readXMLFile(filename)

    -- Create a local XML object:
    return xml.create(file)
end

function getCurrentYear()
    return os.date("%Y")
end

function isRedHatEmail(email)
    return string.match(email, "%a+@redhat%.com")
end

