local textWidth = 75
local horizontalSeparator = string.rep("-", 75) .. "\n"

function colorMessage(message)
    local highlightStart = _G["logger"].codes.color_red .. _G["logger"].codes.bold
    local highlightStop = _G["logger"].codes.reset
    local output = ""
    local insideStars = false
    local i = 1

    while i <= #message do
        local char = message:sub(i,i)
        local twoChars = message:sub(i, i+1)
        -- two stars means we need to use the red color
        -- but those two stars are used at the beggining *and* at the end too
        if twoChars == "**" then
            i = i + 1
            if insideStars then
                insideStars = false
                output = output .. highlightStop
            else
                insideStars = true
                output = output .. highlightStart
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

    fout:write(formatSectionTitle(name) .. "\n")
    fout:write(formatTestMetadata("Description:  ", description))
    fout:write(formatTestMetadata("Authors:      ", authors))
    fout:write(formatTestMetadata("Emails:       ", emails))
    fout:write(formatTestMetadata("Last Modified:", modified))
    fout:write(formatTestMetadata("Tags:         ", tags))
end

function writeTestSuiteEnd(fout, testSuite, colorOutput)
    local passed = testSuite.passCount
    local failed = testSuite.failCount
    local errors = testSuite.errorCount
    local total  = testSuite.total
    local result = determineTestResult(passed, failed, 0, errors)

    fout:write(formatTestCaseTitle("Test Summary"))
    fout:write("    Executed Test Cases: " .. total .. "\n")
    fout:write("    Passed Test Cases:   " .. passed .. "\n")
    fout:write("    Failed Test Cases:   " .. failed .. "\n")
    fout:write("    Encountered Errors:  " .. errors .. "\n")
    fout:write("    Overall Result:      " .. string.upper(result) .. "\n\n")
end

function writeCaseStart(fout, testCase, colorOutput)
    local name = testCase.name

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

function writeSummary(fout, results, colorOutput)
    local passed = results.passedTests
    local failed = results.failedTests
    local total  = passed + failed
    local result = determineTestResult(passed, failed)

    fout:write(formatSectionTitle("Summary") .. "\n")
    fout:write("  Executed Tests: " .. total .. "\n")
    fout:write("  Passed Tests:   " .. passed .. "\n")
    fout:write("  Failed Tests:   " .. failed .. "\n")
    fout:write("  Overall Result: " .. string.upper(result) .. "\n\n")
    fout:write(horizontalSeparator)
    fout:write(string.horizontalFill("Generated by Emender", "https://github.com/emender/\n", textWidth))
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

function writeTestError(fout, testName, explanation, colorOutput)
    fout:write(formatTestResult('error', explanation, colorOutput))
end

