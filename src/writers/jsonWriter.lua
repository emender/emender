-- textWriter.lua - a writer for the plain text file format
-- Copyright (C) 2014, 2015, 2016  Pavel Tisnovsky, Jaromir Hradilek

-- This file is part of Emender.

-- This program is free software:  you can redistribute it and/or modify it
-- under the terms of  the  GNU General Public License  as published by the
-- Free Software Foundation, version 3 of the License.
--
-- This program  is  distributed  in the hope  that it will be useful,  but
-- WITHOUT  ANY WARRANTY;  without  even the implied warranty of MERCHANTA-
-- BILITY or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
-- License for more details.
--
-- You should have received a copy of the GNU General Public License  along
-- with this program. If not, see <http://www.gnu.org/licenses/>.



--
-- Data structure that holds all exported variables and functions
--
local textWriter = {
    firstTestCase = nil,
    firstTestStep = nil,
    firstTestInSuite =nil
}



function textWriter.testSeparator(fout)
    if not textWriter.firstTestInSuite then
        fout:write(",\n")
    end
    textWriter.firstTestInSuite = false
end



function textWriter.testStepSeparator(fout)
    if not textWriter.firstTestStep then
        fout:write(",\n")
    end
    textWriter.firstTestStep = false
end



function textWriter.testCaseSeparator(fout)
    if not textWriter.firstTestCase then
        fout:write(",\n")
    end
    textWriter.firstTestCase = false
end



--
-- Do nothing:
--
function textWriter.writeHeader(fout, results)
    fout:write('{\n')
    textWriter.firstTestInSuite = true
end



--
-- Write the report footer to the file:
--
function textWriter.writeFooter(fout, results)
    fout:write('\n}\n')
end



--
-- Write the test suite header to the file:
--
function textWriter.writeSuiteStart(fout, testSuite)
    local name = testSuite.name
    textWriter.testSeparator(fout)
    fout:write("    \"" .. name .. "\": {\n")
    textWriter.firstTestCase = true
end



--
-- Write the test suite footer to the file:
--
function textWriter.writeSuiteEnd(fout, testSuite)
    fout:write("\n    }")
end



--
-- Write the test case header to the file:
--
function textWriter.writeCaseStart(fout, testCase)
    local name = testCase.name
    textWriter.testCaseSeparator(fout)
    fout:write("        \"" .. name .. "\": [\n")
    textWriter.firstTestStep = true
end



--
-- Do nothing:
--
function textWriter.writeCaseEnd(fout, testCaseInfo)
    fout:write("\n")
    fout:write("        ]")
end



--
-- Write the test result to the file:
--
function textWriter.writeTestPass(fout, testName, message)
    local explanation = message[2]
    textWriter.testStepSeparator(fout)
    fout:write("            {\n")
    fout:write("                \"status\":  \"pass\",\n")
    fout:write("                \"message\": \"" .. explanation .. "\"\n")
    fout:write("            }")
end



--
-- Write the test result to the file:
--
function textWriter.writeTestFail(fout, testName, message)
    local explanation = message[2]
    textWriter.testStepSeparator(fout)
    fout:write("            {\n")
    fout:write("                \"status\":  \"fail\",\n")
    fout:write("                \"message\": \"" .. explanation .. "\"\n")
    fout:write("            }")
end



--
-- Write the test result to the file:
--
function textWriter.writeTestInfo(fout, testName, message)
    local explanation = message[2]
    textWriter.testStepSeparator(fout)
    fout:write("            {\n")
    fout:write("                \"status\":  \"info\",\n")
    fout:write("                \"message\": \"" .. explanation .. "\"\n")
    fout:write("            }")
end



--
-- Write the test result to the file:
--
function textWriter.writeTestLink(fout, testName, message,  url)
    local explanation = message[2]
    textWriter.testStepSeparator(fout)
    fout:write("            {\n")
    fout:write("                \"status\":  \"link\",\n")
    fout:write("                \"message\": \"" .. explanation .. "\",\n")
    fout:write("                \"url\": \"" .. url .. "\"\n")
    fout:write("            }")
end



--
-- Write the test result to the file:
--
function textWriter.writeTestDebug(fout, testName, message)
    local explanation = message[2]
    textWriter.testStepSeparator(fout)
    fout:write("            {\n")
    fout:write("                \"status\":  \"debug\",\n")
    fout:write("                \"message\": \"" .. explanation .. "\"\n")
    fout:write("            }")
end



--
-- Do nothing:
--
function textWriter.writeTestError(fout, testName, message)
    return
end



--
-- Setup color output or no color output.
--
function textWriter.setColorOutput(colorOutput)
end



--
-- Called to initialize the writer.
--
function textWriter.initialize(outdir)
end



--
-- Called to finalize the writer.
--
function textWriter.finalize(outdir)
end



--
-- Export the module API
--
return textWriter

