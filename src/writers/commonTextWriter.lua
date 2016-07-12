-- commonTextWriter.lua - support for terminal output (using colors if possible).
-- Copyright (C) 2015, 2016  Jaromir Hradilek, Pavel Tisnovsky

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



local textWidth = 75
local horizontalSeparator = string.rep("-", 75) .. "\n"

function colorMessage(message)
    local highlightStart = _G["logger"].codes.color_red .. _G["logger"].codes.bold
    local highlightStop = _G["logger"].codes.reset
    local output = ""
    local insideStars = false
    local wannaCloseRedBlock = false
    local i = 1

    while i <= #message do
        local char = message:sub(i,i)
        local twoChars = message:sub(i, i+1)

        -- two stars means we need to use the red color
        -- but those two stars are used at the beggining *and* at the end too
        if twoChars == "**" and not wannaCloseRedBlock then
            i = i + 1
            if insideStars then
                -- we are probably at the end of 'red' block, but we need to
                -- take care of the remaining stars: '*'
                wannaCloseRedBlock = true
            else
                insideStars = true
                wannaCloseRedBlock = false
                output = output .. highlightStart
            end
        -- take care of more than two stars at the end of 'red' block, etc.:
        -- "** xx ***"
        -- "*****"
        -- or even
        -- "******"
        -- and
        -- "*******"
        elseif wannaCloseRedBlock then
            if char == "*" then
                output = output .. "*"
            else
                insideStars = false
                wannaCloseRedBlock = false
                output = output .. highlightStop
                output = output .. char
            end
        else
            output = output .. char
        end
        i = i + 1
    end

    -- user just forget to use "**" in pairs
    if insideStars then
        output = output .. highlightStop
    end

    return output
end

function colorStatus(status)
    local status = status:upper()

    local colorReset = _G["logger"].codes.reset
    local colorBold = _G["logger"].codes.bold
    local colorPass = colorBold .. _G["logger"].codes.color_green
    local colorFail = colorBold .. _G["logger"].codes.color_red
    local colorInfo = colorBold .. _G["logger"].codes.color_yellow
    local colorResult

    if status == "PASS" then
        colorResult = colorPass
    elseif status == "FAIL" then
        colorResult = colorFail
    else
        colorResult = colorInfo
    end

    return colorResult .. status .. colorReset
end

-- Format the result of a single test function:
function formatTestResult(result, explanation, colorOutput)
    local explanation = explanation or "(unknown)"

    local statusLength = result:len()
    local message = string.alignLeft(explanation, textWidth - 2, 10 + statusLength)
    local status

    if not colorOutput then
        status = "[ " .. result:upper() .. " ]"
    else
        local colorBracket = _G["logger"].codes.color_cyan
        local colorReset = _G["logger"].codes.reset

        status = colorBracket .. "[ " .. colorReset ..
                 colorStatus(result:upper()) ..
                 colorBracket .. " ]" .. colorReset
        message = colorMessage(message)
    end

    return "    " .. status .. message:sub(9 + statusLength) .. "\n"
end

-- Format test metadata:
function formatTestMetadata(label, text)
    label = label or ""
    text = text or ""

    return string.alignLeft(label .. " " .. text, textWidth - 2,
                            string.len(label) + 3, 2) .. "\n"
end

-- Format a test case header:
function formatTestCaseTitle(name, result)
    name = name or ""
    result = result or ""

    return string.horizontalFill("\n  " .. name, result,
                                 textWidth) .. "\n\n"
end

-- Format a section header:
function formatSectionTitle(title)
    title = title or ""

    return horizontalSeparator ..
           string.alignCenter(":: " .. title .. " ::\n", textWidth) ..
           horizontalSeparator
end

-- Determine the result of a single test case or a test suite:
function determineTestResult(passed, failed, infos, errors)
    passed = passed or 0
    failed = failed or 0
    infos = infos or 0
    errors = errors or 0

    if passed + failed + infos + errors == 0 then
        return 'fail'
    end

    if failed + errors > 0 then
        return 'fail'
    end

    return 'pass'
end

function writeTestSuiteStart(fout, testSuite, colorOutput)
    local name = testSuite.name
    local description = testSuite.description
    local authors = testSuite.authors
    local emails = testSuite.emails
    local modified = testSuite.modified
    local tags = table.concat(testSuite.tags, ", ")
    local requires = nil

    if testSuite.requires and type(testSuite.requires) == "table" then
        requires = table.concat(testSuite.requires, ", ")
    end

    fout:write(formatSectionTitle(name) .. "\n")
    fout:write(formatTestMetadata("Description:    ", description))
    fout:write(formatTestMetadata("Authors:        ", authors))
    fout:write(formatTestMetadata("Emails:         ", emails))
    fout:write(formatTestMetadata("Last Modified:  ", modified))
    fout:write(formatTestMetadata("Tags:           ", tags))
    fout:write(formatTestMetadata("Required tools: ", requires))
end

function writeTestSuiteEnd(fout, testSuite, colorOutput)
    local passed = testSuite.passCount
    local failed = testSuite.failCount
    local errors = testSuite.errorCount
    local total  = testSuite.total
    local result = determineTestResult(passed, failed, 0, errors):upper()

    if colorOutput then
        local colorReset = _G["logger"].codes.reset
        local colorBold = _G["logger"].codes.bold

        passed = colorBold .. passed .. colorReset
        failed = colorBold .. failed .. colorReset
        errors = colorBold .. errors .. colorReset
        total  = colorBold .. total  .. colorReset
        result = colorStatus(result)
    end

    fout:write(formatTestCaseTitle("Test Summary"))
    fout:write("    Executed Test Cases: " .. total .. "\n")
    fout:write("    Passed Test Cases:   " .. passed .. "\n")
    fout:write("    Failed Test Cases:   " .. failed .. "\n")
    fout:write("    Encountered Errors:  " .. errors .. "\n")
    fout:write("    Overall Result:      " .. result .. "\n\n")
end

function writeCaseStart(fout, testCase, colorOutput)
    local name = testCase.name

    if colorOutput then
        local colorReset = _G["logger"].codes.reset
        local colorBold = _G["logger"].codes.bold

        name = colorBold .. name .. colorReset
    end

    fout:write("\n  Test Case: " .. name .. "\n\n")
end

function writeSetupStart(fout, colorOutput)
    fout:write("\n  Test setup\n\n")
end

function writeTearDownStart(fout, colorOutput)
    fout:write("\n  Test tearDown\n\n")
end

function writeCaseEnd(fout, testCase, colorOutput)
end

function writeSummary(fout, results, colorOutput, includeGeneratedByInfo)
    local passed = results.passedTests
    local failed = results.failedTests
    local total  = passed + failed
    local result = determineTestResult(passed, failed):upper()

    if colorOutput then
        local colorReset = _G["logger"].codes.reset
        local colorBold = _G["logger"].codes.bold

        passed = colorBold .. passed .. colorReset
        failed = colorBold .. failed .. colorReset
        total  = colorBold .. total  .. colorReset
        result = colorStatus(result)
    end

    fout:write(formatSectionTitle("Summary") .. "\n")
    fout:write("  Executed Tests: " .. total .. "\n")
    fout:write("  Passed Tests:   " .. passed .. "\n")
    fout:write("  Failed Tests:   " .. failed .. "\n")
    fout:write("  Overall Result: " .. result .. "\n\n")

    -- we need to add "Generated by" line to the text output, but not to terminal
    if includeGeneratedByInfo then
        fout:write(horizontalSeparator)
        fout:write(string.horizontalFill("Generated by Emender", "https://github.com/emender/\n", textWidth))
    end
end

function writeTestPass(fout, testName, explanation, colorOutput)
    fout:write(formatTestResult('pass', explanation, colorOutput))
end

function writeTestFail(fout, testName, explanation, colorOutput)
    fout:write(formatTestResult('fail', explanation, colorOutput))
end

function writeTestInfo(fout, testName, explanation, colorOutput)
    fout:write(formatTestResult('info', explanation, colorOutput))
end

function writeTestLink(fout, testName, message, url, colorOutput)
    fout:write(formatTestResult('link', message.. " [" .. url .. "]", colorOutput))
end

function writeTestDebug(fout, testName, explanation, colorOutput)
    fout:write(formatTestResult('debug', explanation, colorOutput))
end

function writeTestError(fout, testName, explanation, colorOutput)
    fout:write(formatTestResult('error', explanation, colorOutput))
end

