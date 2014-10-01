local htmlWriter = {
    testSuiteCounter = 0,
    toggleCounter = 0,
    testCaseCounter = 0
}

function getOverallResults(allTests, failedTests)
    return [[
      <table id="overall_results">
        <tr>
          <td>Total:</td>
          <td>]] .. allTests .. [[</td>
        </tr>
        <tr>
          <td>Failed:</td>
          <td>]] .. failedTests .. [[</td>
        </tr>
      </table>
]]
end

function getTabBodyHeader()
    return [[
      <div class="col-xs-9 col-lg-10 tab-body">
        <!-- Tab panes -->
        <div class="tab-content">
]]
end

function writeLeftTab(fout, results, failedTests)
    local testSuites = results.suites
    local failed = failedTests > 0
    for i, testSuite in ipairs(testSuites) do
        if i==1 then
            fout:write("          <li class=\"active\">\n")
        else
            fout:write("          <li>\n")
        end
        fout:write("            <a data-toggle=\"tab\" href=\"#test" .. i .. "\">\n")
        if failed then
            fout:write("            <h4><span class=\"nowrap\"><span class=\"bullet fail\" title=\"test failed\">&bull;</span> " .. testSuite.name .. "</span></span></h4>\n")
        else
            fout:write("            <h4><span class=\"nowrap\"><span class=\"bullet pass\" title=\"test passed\">&bull;</span> " .. testSuite.name .. "</span></span></h4>\n")
        end
        fout:write("            <p>" .. testSuite.description .. "</p>\n")
        fout:write("            </a>\n")
        fout:write("          </li>\n")
    end
    fout:write("        </ul>\n")
    fout:write("      </div>\n")
end

function htmlWriter.writeHeader(fout, results)
    local passedTests = results.passedTests
    local failedTests = results.failedTests
    local allTests = passedTests + failedTests
    fout:write([[
<html>
<head>
  <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="bootstrap/bootstrap.vertical-tabs.css" rel="stylesheet" type="text/css" />
  <link href="yoana.css" rel="stylesheet" type="text/css" />
  <title>Emender Test Suite</title>
</head>
<body>
  <div class="container-fluid main-container">
    <div class="emender-header">
      <div class="page-header">
        <h3>Emender<br />
        Test Suite</h3>
      </div>
]] .. getOverallResults(allTests, failedTests) ..
[[    </div>
    <div class="row top-row">
      <div class="col-xs-3 col-lg-2 top-grid tab-head">
        <!-- required for floating -->
        <!-- Nav tabs -->
        <ul class="nav nav-tabs tabs-left">
]])
    writeLeftTab(fout, results, failedTests)
    fout:write(getTabBodyHeader())
end

function htmlWriter.writeFooter(fout, results)
    fout:write([[
    <div class="clearfix"></div>
          </div>
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
          <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> 
        </div>
      </div>
    </div>
  </div>
</body>
</html>
]])
end

function htmlWriter.writeSuiteStart(fout, testSuite)
    htmlWriter.testSuiteCounter = htmlWriter.testSuiteCounter + 1
    if htmlWriter.testSuiteCounter == 1 then
        fout:write("          <div class=\"tab-pane active\" id=\"test" .. htmlWriter.testSuiteCounter .. "\">\n")
    else
        fout:write("          <div class=\"tab-pane\" id=\"test" .. htmlWriter.testSuiteCounter .. "\">\n")
    end
    fout:write("            <div class=\"row\">\n")

    htmlWriter.testCaseCounter = 0
end

function computeSuitePercantages(testSuite)
    local passed = testSuite.passCount
    local failed = testSuite.failCount
    local errors = testSuite.errorCount
    local total  = testSuite.total

    local passPerc  = math.floor(100.0 * passed / total)
    local failPerc  = math.floor(100.0 * failed / total)
    local errorPerc = math.ceil(100.0 * errors / total)

    if passPerc + failPerc + errorPerc > 100 then
        passPerc = passPerc - 1
    end
    if passPerc + failPerc + errorPerc < 100 then
        passPerc = passPerc + 1
    end

    if passPerc ~= passPerc then passPerc = 0 end
    if failPerc ~= failPerc then failPerc = 0 end
    if errorPerc ~= errorPerc then errorPerc = 0 end

    return passPerc, failPerc, errorPerc
end

function getTags(testSuite)
    if type(testSuite.tags) == "table" then
        local tagsStr = ""
        for _,tag in ipairs(testSuite.tags) do
             tagsStr = tagsStr .. tag .. " "
        end
        return tagsStr
    else
        return testSuite.tags
    end
end

function htmlWriter.writeSuiteEnd(fout, testSuite)
    local passed = testSuite.passCount
    local failed = testSuite.failCount
    local errors = testSuite.errorCount

    local passPerc, failPerc, errorPerc = computeSuitePercantages(testSuite)

    fout:write([[
            </div><!--row-->
            <div class="row">
              <div class="col-md-6 summary">
                <h4>Summary:</h4>
                <table class="test-results">
                  <tr>
                    <td>Passed:</td>
                    <td>]] .. passed .. [[</td>
                    <td>
                      <div class="progress" title="Success: ]] .. passPerc .. [[%; Failure: ]] .. failPerc .. [[%; Error: ]] .. errorPerc .. [[%">
                        <div class="progress-bar progress-bar-success progress-bar-striped" style="width: ]] .. passPerc .. [[%">]] .. passPerc .. [[%</div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Failed:</td>
                    <td>]] .. failed .. [[</td>
                    <td>
                      <div class="progress" title="Success: ]] .. passPerc .. [[%; Failure: ]] .. failPerc .. [[%; Error: ]] .. errorPerc .. [[%">
                        <div class="progress-bar progress-bar-danger progress-bar-striped" style="width: ]] .. failPerc .. [[%">]] .. failPerc .. [[%</div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Errors:</td>
                    <td>]] .. errors .. [[</td>
                    <td>
                      <div class="progress" title="Success: ]] .. passPerc .. [[%; Failure: ]] .. failPerc .. [[%; Error: ]] .. errorPerc .. [[%">
                        <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: ]] .. errorPerc .. [[%">]] .. errorPerc .. [[%</div>
                      </div>
                    </td>
                  </tr>
                </table>
                <table class="test-metadata">
                  <tr>
                    <td>Authors:</td>
                    <td>]] .. testSuite.authors .. [[</td>
                  </tr>
                  <tr>
                    <td>Emails:</td>
                    <td>]] .. testSuite.emails .. [[</td>
                  </tr>
                  <tr>
                    <td>Last modified:</td>
                    <td>]] .. testSuite.modified .. [[</td>
                  </tr>
                  <tr>
                    <td>Tags:</td>
                    <td>]] .. getTags(testSuite).. [[</td>
                  </tr>
                </table>
              </div>
            </div><!--row-->
          </div><!--tab-pane-->
]])
end

function getIconAndStatus(testCase)
    local pass   = testCase.pass
    local fail   = testCase.fail
    local info   = testCase.info
    local errors = testCase.errors
    local total  = pass + fail + info + errors

    local icon = "pass"
    local testStatus = "method passed"

    if fail > 0 or errors > 0 then
        testStatus = "method failed"
        icon = "fail"
    end

    if total == 0 then
        icon = "norun"
        testStatus = "method norun"
    end

    return icon, testStatus
end

function computeCasePercentages(testCase)
    local pass   = testCase.pass
    local fail   = testCase.fail
    local info   = testCase.info
    local errors = testCase.errors
    local total  = pass + fail + info + errors

    local passPerc = math.floor(100.0 * pass / total)
    local infoPerc = math.floor(100.0 * info / total)
    local failPerc = math.floor(100.0 * (fail+errors) / total)

    if passPerc + infoPerc + failPerc > 100 then
        passPerc = passPerc - 1
    end
    if passPerc + infoPerc + failPerc < 100 then
        passPerc = passPerc + 1
    end

    if passPerc ~= passPerc then passPerc = 0 end
    if infoPerc ~= infoPerc then infoPerc = 0 end
    if failPerc ~= failPerc then failPerc = 0 end

    return passPerc, infoPerc, failPerc
end

function htmlWriter.writeCaseStart(fout, testCase)
    local passPerc, infoPerc, failPerc = computeCasePercentages(testCase)
    local icon, testStatus = getIconAndStatus(testCase)

    htmlWriter.toggleCounter = htmlWriter.toggleCounter + 1
    fout:write([[
              <div class="col-xs-12 col-sm-6 col-lg-4 tab-body-cell">
                <h5><span class="bullet ]] .. icon .. [[" title="]] .. testStatus .. [[">&bull;</span> ]] .. testCase.name .. [[</h5>
                <div class="progress" title="Success: ]] ..passPerc .. [[%; Info: ]]..infoPerc..[[%; Failure: ]]..failPerc ..[[%">
                  <div class="progress-bar progress-bar-success progress-bar-striped" style="width: ]] .. passPerc .. [[%">
                   ]] .. passPerc .. [[%
                  </div>
                  <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: ]] .. infoPerc .. [[%">
                   ]] .. infoPerc .. [[%
                  </div>
                  <div class="progress-bar progress-bar-danger progress-bar-striped" style="width: ]] .. failPerc .. [[%">
                   ]] .. failPerc .. [[%
                  </div>
                </div>
                <input id="toggle-]] .. htmlWriter.toggleCounter .. [[" type="checkbox" />
                <label class="toggle" for="toggle-]] .. htmlWriter.toggleCounter .. [["><span class="glyph" title="toggle display of all tested items"></span></label>
                <table>
]])
end

function htmlWriter.writeCaseEnd(fout, testCaseInfo)
    fout:write([[
                </table>
              </div>
]])
    htmlWriter.testCaseCounter = htmlWriter.testCaseCounter + 1
    local j = htmlWriter.testCaseCounter
    local j = htmlWriter.testCaseCounter
    if j % 3 == 0 then
        fout:write("              <div class=\"clearfix visible-md-block\"></div>\n")
    end
end

function writeTestMessage(fout, message)
    local msgStatus = message[1]
    local explanation = message[2]
    local class = msgStatus:lower()
    fout:write([[
                  <tr>
                    <td class="result ]] .. class .. [[">]] .. msgStatus .. [[</td>
                    <td>]] .. explanation .. [[</td>
                  </tr>
]])
end

function htmlWriter.writeTestPass(fout, testName, message)
    writeTestMessage(fout, message)
end

function htmlWriter.writeTestFail(fout, testName, message)
    writeTestMessage(fout, message)
end

function htmlWriter.writeTestInfo(fout, testName, message)
    writeTestMessage(fout, message)
end

function htmlWriter.writeTestError(fout, testName, message)
    writeTestMessage(fout, message)
end


return htmlWriter

