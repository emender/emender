-- Documentation generation module.
--
-- Copyright (C) 2014, 2015  Pavel Tisnovsky

-- This file is part of Emender.

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

-- Define the module:
local gendoc = {
}



--
-- Get comment that would be read up to the given line.
-- All comment lines should start with "--"
-- Comments are read in the opposite direction: from the function definition 'higher'.
--
function getComment(testSource, endLine)
    -- comment lines should END just before the line containing function name
    local i = endLine - 1

    -- check if we are still at the beginning of the test source (it is unlikely)
    if i <= 1 then
        print("Test function is at the beggining of the test source...strange.")
    end

    -- output accumulator
    local output = ""

    -- try to read all relevant lines containing comment
    -- and join it into one "big" string
    repeat
        local line = testSource[i]
        -- check for nil
        assert(line)

        local commentLine = line:startsWith("--")
        assert(commentLine ~= nil)

        -- insert comment line _before_ previous comment lines
        -- (because we read comments from the end to the beginning)
        if commentLine then
            local x = line:subs(3):trim()
            output = x .. " " .. output
        end

        -- go to the previous line
        i = i - 1
    until i == 1 or not commentLine

    -- trim whitespaces
    output = output:trim()

    -- is function commented at all?
    if output == "" then
        return "(not commented)"
    else
        return output
    end
end



--
-- Generate documentation for one selected function for the given test.
--
function generateDocForOneFunction(testName, testFunction, testSource)

    -- be sure everything is ok
    if not _G or not _G[testName] or not _G[testName][testFunction] then
        print("    Internal error; it should not happen in the perfect world!")
        return
    end

    -- read the selected function from the global table
    local f = _G[testName][testFunction]

    -- try to get debuginfo for the function
    local debugInfo = debug.getinfo(f)

    -- check if debuginfo can be read
    if not debugInfo then
        print("    Internal error; can not read debuginfo for the test function " .. testName .. "." .. testFunction)
        return
    end

    -- all we need is line number
    local line = debugInfo.linedefined

    -- check if linedefined item can be read from the debuginfo
    if not line then
        print("    Internal error; can not read debuginfo for the test function " .. testName .. "." .. testFunction)
        return
    end

    local comment = getComment(testSource, line)
    print("", testFunction .. ":", comment)
end



--
-- Print warning about the test without any test functions.
--
function printWarning()
    print("    Warning - no test functions found in this test.")
    print("    Please make sure the test is really correct.")
end



--
-- Generate simple documentation for one selected test.
--
function generateDocForOneTest(core, testName, scriptDirectory, filename)
    core.checkTestNameShadowing(testName)

    -- load or reload the test so we could use reflection
    dofile(scriptDirectory .. "test/" .. filename)

    -- if test is properly loaded its structure must be stored in a global table _G
    local test = _G[testName]
    if test then
        print("Test: " .. testName)
        -- retrieve all test functions
        local testFunctions = core.getListOfTestFunctionNames(testName)

        -- simple check if at least one function is specified in the test
        if not testFunctions or #testFunctions==0 then
            printWarning()
        end

        -- read whole source file and store it in a table (line-by-line)
        local testSource = slurpTable(scriptDirectory .. "test/" .. testName .. ".lua")

        -- produce doc output for each test function
        for i, testFunction in ipairs(testFunctions) do
            generateDocForOneFunction(testName, testFunction, testSource)
        end
    else
        print("Test '" .. testName .. "' can't be loaded or there's name mismatch")
        print("(test name is different from the name of test file).")
        print("Please check the content of file " .. filename)
    end
end



--
-- Generate simple documentation (comments for all functions)
-- for the given list of tests.
--
function generateDocForAllTests(core, testList, scriptDirectory)
    -- loop over all (possible) tests
    for _, filename in ipairs(testList) do
        local testName = core.updateTestName(filename)
        -- if the filename is the real test name, generate documentation for it
        if testName then
            generateDocForOneTest(core, testName, scriptDirectory, filename)
        end
    end
end



--
-- Generate simple documentation (comments for all test functions found
-- in all tests).
--
function gendoc.generateDocForAllTests(core)
    local scriptDirectory = getScriptDirectory()
    local testList = getTestList()
    -- generate simple documentation for the given list of tests
    generateDocForAllTests(core, testList, scriptDirectory)
end



--
-- Write header into selected output file
--
function writeHeader(type, fout)
    if type == "html" then
        fout:write([[<!DOCTYPE html>
<html>
<head>
    <title>Emender API documentation</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <link href="css/default.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/page_effects.js" type="text/javascript"></script>
</head>
<body>
    <div id="header">
        <h2>Generated by <a href="https://github.com/emender/emender">Emender</a></h2>
        <h1><a href="index.html">Emender API documentation</a></h1>
    </div>]])
    end
end



--
-- Write footer into selected output file
--
function writeFooter(type, fout)
    if type == "html" then
        fout:write([[</body>
</html>]])
    end
end



function writeSourceFileName(sourceFile, type, fout)
    if type == "txt" then
        fout:write("[" .. sourceFile .. "]\n\n")
    elseif type == "html" then
        fout:write("<h1>" .. sourceFile .. "</h1>\n")
    end
end

function writeFunctionName(functionName, type, fout)
    if type == "txt" then
        fout:write(functionName .. "\n")
    elseif type == "html" then
        fout:write("<h2>" .. functionName .. "</h2>\n")
    end
end

function writeComment(comment, type, fout)
    if type == "txt" then
        fout:write(comment .. "\n\n")
    elseif type == "html" then
        fout:write("<p>" .. comment .. "</p>\n")
    end
end



--
-- Generate header into all output files
--
function generateHeader(outputFiles)
    for _,outputFile in pairs(outputFiles) do
        local type = outputFile[1]
        local fout = outputFile[2]
        writeHeader(type, fout)
    end
end



--
-- Generate footer into all output files
--
function generateFooter(outputFiles)
    for _,outputFile in pairs(outputFiles) do
        local type = outputFile[1]
        local fout = outputFile[2]
        writeFooter(type, fout)
    end
end



--
-- Generate simple documentation for one selected source file.
--
function generateDocForOneSourceFile(sourceFile, colorOutput, outputFiles)
    print("***", sourceFile, "***")
    for _,outputFile in pairs(outputFiles) do
        local type = outputFile[1]
        local fout = outputFile[2]
        local name = sourceFile:substring(1+sourceFile:lastIndexOf("/"))
        writeSourceFileName(name, type, fout)
    end
    local source = slurpTable(sourceFile)
    for lineNumber, lineContent in ipairs(source) do
        if lineContent:startsWith("function ") then
            local functionNameParams = lineContent:substring(lineContent:find("function") + 9)
            if functionNameParams then
                local comment = getComment(source, lineNumber)
                print(lineNumber, functionNameParams)
                print(comment)
                print()
                for _,outputFile in pairs(outputFiles) do
                    local type = outputFile[1]
                    local fout = outputFile[2]
                    writeFunctionName(functionNameParams, type, fout)
                    writeComment(comment, type, fout)
                end
            end
        end
    end
end



--
-- Generate simple documentation for Emender (comments for all test functions
-- found in all Emender modules).
--
function gendoc.generateDocForWholeEmender(scriptDirectory, colorOutput, outputFiles)
    openOutputFiles(outputFiles)

    generateHeader(outputFiles)

    local listSourcesCmd = "tree -f -i -n -P *.lua " .. scriptDirectory .. "src/"
    local sourceList = execCaptureOutputAsTable(listSourcesCmd)

    -- add the main script into the table
    table.insert(sourceList, 1, scriptDirectory .. "emend")
    for _, sourceFile in ipairs(sourceList) do
        -- "emend" is special case, because name of this script does not end with ".lua"
        if sourceFile:endsWith(".lua") or sourceFile:endsWith("emend") then
            generateDocForOneSourceFile(sourceFile, colorOutput, outputFiles)
        end
    end

    generateFooter(outputFiles)

    closeOutputFiles(outputFiles)
end



-- Export the module:
return gendoc

