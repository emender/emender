local xmlWriter = {
}

function writeTestResult(fout, result, explanation)
    fout:write('      <test result="' .. result .. '">' .. explanation .. '</test>\n')
end

function determineTestResult(passed, failed, infos, errors)
    if passed + failed + infos + errors == 0 then
        return 'fail'
    end

    if failed + errors > 0 then
        return 'fail'
    end

    return 'pass'
end

function xmlWriter.writeHeader(fout, testReport)
    fout:write('<report xmlns="http://emender.blackened.cz/1.0/">\n')
end

function xmlWriter.writeFooter(fout, testReport)
    fout:write('</report>\n')
end

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

function xmlWriter.writeSuiteEnd(fout, testSuite)
    fout:write('  </suite>\n')
end

function xmlWriter.writeCaseStart(fout, testCase)
    local name = testCase.name
    local result = determineTestResult(testCase.pass, testCase.fail, testCase.info, testCase.errors)

    fout:write('    <case name="' .. name .. '" result="' .. result .. '">\n')
end

function xmlWriter.writeCaseEnd(fout, testCase)
    fout:write('    </case>\n')
end

function xmlWriter.writeTestPass(fout, testName, message)
    local explanation = message[2]
    writeTestResult(fout, 'pass', explanation)
end

function xmlWriter.writeTestFail(fout, testName, message)
    local explanation = message[2]
    writeTestResult(fout, 'fail', explanation)
end

function xmlWriter.writeTestInfo(fout, testName, message)
    local explanation = message[2]
    writeTestResult(fout, 'info', explanation)
end

function xmlWriter.writeTestError(fout, testName, message)
    return
end

return xmlWriter
