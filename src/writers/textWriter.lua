-- textWriter.lua - a writer for the plain text file format
-- Copyright (C) 2014 Pavel Tisnovsky, Jaromir Hradilek

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
}

-- Do nothing:
function textWriter.writeHeader(fout, results)
    return
end

-- Write the report footer to the file:
function textWriter.writeFooter(fout, results)
    writeSummary(fout, results, false, true)
end

-- Write the test suite header to the file:
function textWriter.writeSuiteStart(fout, testSuite)
    writeTestSuiteStart(fout, testSuite, false)
end

-- Write the test suite footer to the file:
function textWriter.writeSuiteEnd(fout, testSuite)
    writeTestSuiteEnd(fout, testSuite, false)
end

-- Write the test case header to the file:
function textWriter.writeCaseStart(fout, testCase)
    local name = testCase.name
    local result = determineTestResult(testCase.pass, testCase.fail, testCase.info, testCase.errors)

    fout:write(formatTestCaseTitle("Test Case: " .. name, string.upper(result)))
end

-- Do nothing:
function textWriter.writeCaseEnd(fout, testCaseInfo)
    return
end

-- Write the test result to the file:
function textWriter.writeTestPass(fout, testName, message)
    local explanation = message[2]
    writeTestPass(fout, testName, explanation, false)
end

-- Write the test result to the file:
function textWriter.writeTestFail(fout, testName, message)
    local explanation = message[2]
    writeTestFail(fout, testName, explanation, false)
end

-- Write the test result to the file:
function textWriter.writeTestInfo(fout, testName, message)
    local explanation = message[2]
    writeTestInfo(fout, testName, explanation, false)
end

-- Write the test result to the file:
function textWriter.writeTestDebug(fout, testName, message)
    local explanation = message[2]
    writeTestDebug(fout, testName, explanation, false)
end

-- Do nothing:
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

