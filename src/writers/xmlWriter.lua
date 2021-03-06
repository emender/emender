-- xmlWriter.lua - a writer for the XML file format
-- Copyright (C) 2014 - 2017  Jaromir Hradilek, Pavel Tisnovsky

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
local xmlWriter = {
}



--
-- Write the result of a single test function to the file:
--
function xmlWriter.writeTestResult(fout, result, explanation, url)
    -- get rid of all unwanted special HTML/XML characters
    -- -> use corresponding HTML/XML entities instead
    local escapedHTML = explanation:escapeHTML()
    if not url then
        fout:write('      <test result="' .. result .. '">' .. escapedHTML .. '</test>\n')
    else
        fout:write('      <test result="' .. result .. '"><link url="' .. url .. '">' .. escapedHTML .. '</link></test>\n')
    end
end



--
-- Determine the result of a single test case or a test suite:
--
function determineTestResult(passed, failed, infos, errors)
    if passed + failed + infos + errors == 0 then
        return 'fail'
    end

    if failed + errors > 0 then
        return 'fail'
    end

    return 'pass'
end



--
-- Write the opening report tag to the file:
--
function xmlWriter.writeHeader(fout, testReport)
    fout:write('<report xmlns="http://emender.blackened.cz/1.0/">\n')
end



--
-- Write the closing report tag to the file:
--
function xmlWriter.writeFooter(fout, testReport)
    fout:write('</report>\n')
end



--
-- Write the opening suite tag and the info tag to the file:
--
function xmlWriter.writeSuiteStart(fout, testSuite)
    local name = testSuite.name
    local description = testSuite.description
    local authors = testSuite.authors
    local emails = testSuite.emails
    local modified = testSuite.modified
    local tags = testSuite.tags
    local result = determineTestResult(testSuite.passCount, testSuite.failCount, 0, testSuite.errorCount)

    fout:write('  <suite name="' .. name .. '" result="' .. result .. '">\n')
    fout:write('    <info>\n')
    fout:write('      <description>' .. description .. '</description>\n')
    fout:write('      <authors>' .. authors .. '</authors>\n')
    fout:write('      <emails>' .. emails .. '</emails>\n')
    fout:write('      <modified>' .. modified .. '</modified>\n')
    fout:write('      <tags>\n')

    for i, tag in ipairs(tags) do
        fout:write('        <tag>' .. tag .. '</tag>\n')
    end

    fout:write('      </tags>\n')
    fout:write('    </info>\n')
end



--
-- Write the closing suite tag to the file:
--
function xmlWriter.writeSuiteEnd(fout, testSuite)
    fout:write('  </suite>\n')
end



--
-- Write the opening case tag to the file:
--
function xmlWriter.writeCaseStart(fout, testCase)
    local name = testCase.name
    local result = determineTestResult(testCase.pass, testCase.fail, testCase.info, testCase.errors)

    fout:write('    <case name="' .. name .. '" result="' .. result .. '">\n')
end



--
-- Write the closing case tag to the file:
--
function xmlWriter.writeCaseEnd(fout, testCase)
    fout:write('    </case>\n')
end



--
-- Write the test tag with the result attribute set to 'pass' to the file:
--
function xmlWriter.writeTestPass(fout, testName, message)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'pass', explanation)
end



--
-- Write the test tag with the result attribute set to 'fail' to the file:
--
function xmlWriter.writeTestFail(fout, testName, message)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'fail', explanation)
end



--
-- Write the test tag with the result attribute set to 'fail' to the file:
--
function xmlWriter.writeTestFailLink(fout, testName, message, url)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'fail', url .. ":" .. explanation)
end



--
-- Write the test tag with the result attribute set to 'info' to the file:
--
function xmlWriter.writeTestInfo(fout, testName, message)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'info', explanation)
end



--
-- Write the test tag with the result attribute set to 'info' to the file:
--
function xmlWriter.writeTestInfoLink(fout, testName, message, url)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'info', url .. ":" .. explanation)
end



--
-- Write the test tag with the result attribute set to 'link' to the file:
--
function xmlWriter.writeTestLink(fout, testName, message, url)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'link', explanation, url)
end



--
-- Write the test tag with the result attribute set to 'info' to the file:
--
function xmlWriter.writeTestDebug(fout, testName, message)
    local explanation = message[2]
    xmlWriter.writeTestResult(fout, 'debug', explanation)
end



--
-- Do nothing:
--
function xmlWriter.writeTestError(fout, testName, message)
    return
end



--
-- Setup color output or no color output.
--
function xmlWriter.setColorOutput(colorOutput)
end



--
-- Called to initialize the writer.
--
function xmlWriter.initialize(outdir)
end



--
-- Called to finalize the writer.
--
function xmlWriter.finalize(outdir)
end



--
-- Export the module API
--
return xmlWriter

