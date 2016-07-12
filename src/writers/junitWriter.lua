-- junitWriter.lua - a writer for the JUnit-compatible file format
-- Copyright (C) 2014, 2015, 2016  Pavel Tisnovsky

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
local junitWriter = {
}



--
-- Write the opening report tag to the file:
--
function junitWriter.writeHeader(fout, testReport)
    fout:write('<testsuites>\n')
end



--
-- Write the closing report tag to the file:
--
function junitWriter.writeFooter(fout, testReport)
    fout:write('</testsuites>\n')
end



--
-- Write the opening suite tag to the file:
--
function junitWriter.writeSuiteStart(fout, testSuite)
    local name = testSuite.name
    fout:write('  <testsuite name="' .. name .. '">\n')
end



--
-- Write the closing suite tag to the file:
--
function junitWriter.writeSuiteEnd(fout, testSuite)
    fout:write('  </testsuite>\n')
end



--
-- Write the opening case tag to the file:
--
function junitWriter.writeCaseStart(fout, testCase)
    local name = testCase.name
    fout:write('    <testcase name="' .. name .. '" classname="' .. name .. '">\n')
end



--
-- Write the closing case tag to the file:
--
function junitWriter.writeCaseEnd(fout, testCase)
    fout:write('    </testcase>\n')
end



--
-- Write the test tag with the result attribute set to 'pass' to the file:
--
function junitWriter.writeTestPass(fout, testName, message)
    -- do nothing
    return
end



--
-- Write error message to the output file:
--
function writeErrorMessage(fout, explanation)
    local escapedHTML = explanation:escapeHTML()
    fout:write('        <error message="' .. escapedHTML .. '">' .. escapedHTML .. '</error>\n')
end



--
-- Write the test tag with the result attribute set to 'fail' to the file:
--
function junitWriter.writeTestFail(fout, testName, message)
    local explanation = message[2]
    writeErrorMessage(fout, explanation)
end



--
-- Write the test tag with the result attribute set to 'info' to the file:
--
function junitWriter.writeTestInfo(fout, testName, message)
    -- do nothing
    return
end



--
-- Write the test tag with the result attribute set to 'info' to the file:
--
function junitWriter.writeTestLink(fout, testName, message, url)
    -- do nothing
    return
end



--
-- Write the test tag with the result attribute set to 'info' to the file:
--
function junitWriter.writeTestDebug(fout, testName, message)
    -- do nothing
    return
end



--
-- Write test error to the file:
--
function junitWriter.writeTestError(fout, testName, message)
    local explanation = message[2]
    writeErrorMessage(fout, explanation)
end



--
-- Setup color output or no color output.
--
function junitWriter.setColorOutput(colorOutput)
end



--
-- Called to initialize the writer.
--
function junitWriter.initialize(outdir)
end



--
-- Called to finalize the writer.
--
function junitWriter.finalize(outdir)
end



--
-- Export the module API
--
return junitWriter

