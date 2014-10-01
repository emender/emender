local htmlWriter = {
}

function htmlWriter.writeHeader(fout, results)
    fout:write([[
<html>
    <head>
        <title>Emender Test Suite</title>
    </head>
    <body>
        <div>
          <h1>Emender Test Suite</h1>
        </div>

<ul id='all-tests'>
]])
end

function htmlWriter.writeFooter(fout, results, passedTests, failedTests)
    fout:write("</ul>\n\n")
    fout:write("<ul id='overall_results'>\n")
    fout:write("    <li>Total:<span>" ..(passedTests + failedTests).."</span></li>\n")
    fout:write("    <li>Passed:<span>" ..passedTests.."</span></li>\n")
    fout:write("    <li>Failed:<span>" ..failedTests.."</span></li>\n")
    fout:write("</ul>\n")
    fout:write([[

        <div>Generated by Emender</div>
    </body>
</html>]])
end

function htmlWriter.writeCaseStart(fout, results, testName)
    fout:write("    <li class='test'>\n")
    fout:write("        <div>\n")
    fout:write("            <h2>" .. testName .. "</h2>\n")
    fout:write("        </div>\n")
    fout:write("        <ul>\n")
end

function htmlWriter.writeSuiteEnd(fout, results, testName, test)
    local passed = test.passCnt
    local failed = test.failCnt
    local total  = test.total

    fout:write("        </ul>\n")
    fout:write("        <div>\n")
    fout:write("            <h3>Summary:</h3>\n")
    fout:write("            <ul>\n")
    fout:write("                <li>Total:<span>" .. total .. "</span></li>\n")
    fout:write("                <li>Failed:<span>" .. failed .. "</span></li>\n")
    fout:write("            </ul>\n")
    fout:write("        </div>\n")
    fout:write("    </li>\n")
end

function htmlWriter.writeCaseStart(fout, results, testName, functionName)
    fout:write("        <li class='method'>\n")
    fout:write("            <h3>" .. functionName .. "</h3>\n")
    fout:write("            <ul>\n")
end

function htmlWriter.writeCaseEnd(fout, results, testName)
    fout:write("            </ul>\n")
    fout:write("        </li>\n")
end

function htmlWriter.writeTestPass(fout, results, testName, testFunctionName, message)
    local msg = message or "(unknown)"
    fout:write("                <li><span class='passed'>PASS</span><span>" .. msg .. "</span></li>\n")
end

function htmlWriter.writeTestFail(fout, results, testName, testFunctionName, message)
    local msg = message or "(unknown)"
    fout:write("                <li><span class='failed'>FAIL</span><span>" .. msg .. "</span></li>\n")
end

function htmlWriter.writeTestInfo(fout, results, testName, testFunctionName, message)
    local msg = message or "(unknown)"
    fout:write("                <li><span class='info'>INFO</span><span>" .. msg .. "</span></li>\n")
end

function htmlWriter.writeTestError(fout, results, testName, testFunctionName, message)
    return
end


return htmlWriter

