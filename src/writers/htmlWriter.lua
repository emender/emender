-- htmlWriter.lua - a writer for the HTML file format
-- Copyright (C) 2014 Pavel Tisnovsky

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
local htmlWriter = {
    testSuiteCounter = 0,
    toggleCounter = 0,
    testCaseCounter = 0
}



--
-- Return string representing HTML table containing overall test results.
--
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



--
-- Return string representing the HTML header of "tab" content.
--
function getTabBodyHeader()
    return [[
          <div class="tab-content">
]]
end



--
-- Generate JavaScript data structure used to generate graph
-- on the client side (ie. in WWW browser).
--
function createGraph(fout, passedTests, failedTests)
    fout:write([[
<div id="status_graph" style="width:230px;height:230px;"></div>
<script type="text/javascript">

    // Fill series.
    var d1 = [ [0, ]] .. passedTests .. [[ ] ];
    var d2 = [ [0, ]] .. failedTests .. [[ ] ];

    //Draw the graph.
    var f = Flotr.draw($('status_graph'), [
        {data:d1, label: 'Passed'},
        {data:d2, label: 'Failed'}], {
            HtmlText: false, 
            grid: {
                verticalLines: false, 
                horizontalLines: false
            },
            xaxis: {showLabels: false},
            yaxis: {showLabels: false}, 
            pie: {show: true},
            legend:{
                position: 'ne',
                backgroundColor: '#D2E8FF'
            }
    });
</script>
]])
end



--
-- Write part of HTML that represents tablist on the left side.
--
function writeLeftTab(fout, results, passedTests, failedTests)
    local testSuites = results.suites
    for i, testSuite in ipairs(testSuites) do
        -- mark overall test failure in case at least one error or fail is detected
        local failed = testSuite.failCount > 0 or testSuite.errorCount > 0
        if i==1 then
            fout:write("            <li class=\"active\">\n")
        else
            fout:write("            <li>\n")
        end
        fout:write("              <a data-toggle=\"tab\" href=\"#test" .. i .. "\">\n")
        if failed then
            fout:write("                <h4><span class=\"nowrap\"><span class=\"bullet fail\" title=\"Test failed\">&bull;</span> " .. testSuite.name .. "</span></span></h4>\n")
        else
            fout:write("                <h4><span class=\"nowrap\"><span class=\"bullet pass\" title=\"Test passed\">&bull;</span> " .. testSuite.name .. "</span></span></h4>\n")
        end
        fout:write("                <p>" .. testSuite.description .. "</p>\n")
        fout:write("              </a>\n")
        fout:write("            </li>\n")
    end
    fout:write("          </ul>\n")

    -- generate graphs in HTML output, but only if the global variable
    -- named generateGraphsInHtmlOutput is set to true
    if generateGraphsInHtmlOutput then
        createGraph(fout, passedTests, failedTests)
    end
    -- fout:write("      <!--</div>-->\n")
end



--
-- When the global variable named generateGraphsInHtmlOutput is set to true
-- the flotr library (and all required libraries) should be loaded onto the HTML page.
--
function includeFlottrLibrary()
    if generateGraphsInHtmlOutput then
        return [[
  <script type="text/javascript" src="flotr/lib/prototype-1.6.0.2.js"></script>
  
  <!--[if IE]>
      <script type="text/javascript" src="../flotr/lib/excanvas.js"></script>
      <script type="text/javascript" src="../flotr/lib/base64.js"></script>
  <![endif]-->
  <script type="text/javascript" src="flotr/lib/canvas2image.js"></script>
  <script type="text/javascript" src="flotr/lib/canvastext.js"></script>
  <script type="text/javascript" src="flotr/flotr-0.2.0-alpha.js"></script>
]]
    else
        return ""
    end
end



--
-- Returns text or href with text used as Emender title.
--
function getTitle()
    if frontPageURL then
        return "<a href='" .. frontPageURL .. "'>Emender Test Suite</a>"
    else
        return "Emender Test Suite"
    end
end



--
-- Write HTML header and the first part of HTML body, including tablist on the left side.
--
function htmlWriter.writeHeader(fout, results)
    local passedTests = results.passedTests
    local failedTests = results.failedTests
    local allTests = passedTests + failedTests
    local title = getTitle()
    fout:write([[
<html>
<head>
  <meta name="generator" content="Emender" />
  <meta name="date" content="]] .. os.date("%c") .. [[" />
  <meta name="description" content="A HTML report generated by Emender, a test automation framework for product documentation." />
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="yoana.css" rel="stylesheet" type="text/css" />
  <title>Emender Test Suite</title>
]] .. includeFlottrLibrary() .. 
[[
</head>
<body>
  <div class="container-fluid top-level">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <div class="emender-header">
          <div class="page-header">
            <h3>]] .. title .. [[</h3>
          </div>
]] .. getOverallResults(allTests, failedTests) ..
[[        </div><!--emender-header-->
        <div class="tabbable" id="tabs-1">
          <ul class="nav nav-pills">
]])
    writeLeftTab(fout, results, passedTests, failedTests)
    fout:write(getTabBodyHeader())
end



--
-- Write HTML footer.
--
function htmlWriter.writeFooter(fout, results)
    fout:write([[
          </div><!--tab-content-->
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
          <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> 
          <script type="text/javascript" src="bootstrap/js/scripts.js"></script>
        </div><!--tababble-->
      </div><!--column-->
    </div><!--row-->
  </div><!--container-fluid top-level-->
</body>
</html>
]])
end



--
-- Write the test suite "header" to the HTML file.
--
function htmlWriter.writeSuiteStart(fout, testSuite)
    local passed = testSuite.passCount
    local failed = testSuite.failCount
    local errors = testSuite.errorCount

    local passPerc, failPerc, errorPerc = computeSuitePercantages(testSuite)

    htmlWriter.testSuiteCounter = htmlWriter.testSuiteCounter + 1
    if htmlWriter.testSuiteCounter == 1 then
        fout:write([[
            <div class="tab-pane active" id="test]] .. htmlWriter.testSuiteCounter .. [[">
]])
    else
        fout:write([[
            <div class="tab-pane" id="test]] .. htmlWriter.testSuiteCounter .. [[">
]])
    end
    fout:write([[
              <div class="row">
                <div class="col-md-12 summary">
                  <h4>Summary for ]] .. testSuite.name .. [[</h4>
                  <div class="col-md-8 summary-bars">
                    <table>
                      <tr>
                        <td>Passed:</td>
                        <td>]] .. passed .. [[</td>
                        <td>
                          <div class="progress" title="Success: ]] .. passPerc .. [[%; Failure: ]] .. failPerc .. [[%; Error: ]] .. errorPerc .. [[%">
                            <div class="progress-bar progress-bar-success" style="width: ]] .. passPerc .. [[%">]] .. passPerc .. [[%</div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>Failed:</td>
                        <td>]] .. failed .. [[</td>
                        <td>
                          <div class="progress" title="Success: ]] .. passPerc .. [[%; Failure: ]] .. failPerc .. [[%; Error: ]] .. errorPerc .. [[%">
                            <div class="progress-bar progress-bar-danger" style="width: ]] .. failPerc .. [[%">]] .. failPerc .. [[%</div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>Errors:</td>
                        <td>]] .. errors .. [[</td>
                        <td>
                          <div class="progress" title="Success: ]] .. passPerc .. [[%; Failure: ]] .. failPerc .. [[%; Error: ]] .. errorPerc .. [[%">
                            <div class="progress-bar progress-bar-warning" style="width: ]] .. errorPerc .. [[%">]] .. errorPerc .. [[%</div>
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div><!--summary-bars-->
                  <div class="col-md-4 metadata">
                    <table>
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
                  </div><!--metadata-->
                </div><!--summary-->
              </div><!--row-->
              <h4>Test Results for ]] .. testSuite.name .. [[</h4>
              <div class="row">
]])

    htmlWriter.testCaseCounter = 0
end



--
-- Compute the statistics about passed, failed and errors.
-- Return values (triple): passed tests in %
--                         failed tests in %
--                         errors in %
--
function computeSuitePercantages(testSuite)
    local passed = testSuite.passCount
    local failed = testSuite.failCount
    local errors = testSuite.errorCount
    local total  = testSuite.total

    local passPerc  = math.floor(100.0 * passed / total)
    local failPerc  = math.floor(100.0 * failed / total)
    local errorPerc = math.ceil(100.0 * errors / total)

    -- after calling math.floor() twice and math.ceil() once,
    -- the sum might not be 100%, so let's update one value by +-1
    if passPerc + failPerc + errorPerc > 100 then
        passPerc = passPerc - 1
    end
    if passPerc + failPerc + errorPerc < 100 then
        passPerc = passPerc + 1
    end

    -- special case that might happen after two previous step
    if passPerc == 100 and failed > 0 then
        passPerc = passPerc - 1
        failPerc = failPerc + 1
    end

    -- NaN checking
    if passPerc ~= passPerc   then passPerc = 0 end
    if failPerc ~= failPerc   then failPerc = 0 end
    if errorPerc ~= errorPerc then errorPerc = 0 end

    -- we are done, return the computed triple
    return passPerc, failPerc, errorPerc
end



--
-- Get and return tags associated with the test.
--
function getTags(testSuite)
    if type(testSuite.tags) == "table" then
        return table.concat(testSuite.tags, ", ")
    else
        return testSuite.tags
    end
end



--
-- Write the test suite "footer" to the HTML file.
--
function htmlWriter.writeSuiteEnd(fout, testSuite)
    fout:write([[
              </div><!--row-->
            </div><!--tab-pane-->
]])
end



--
-- Return tuple: icon name and status message for given test case.
-- Only when total > 0 and fail == 0 and error == 0 'pass' icon is returned.
-- When total == 0 then 'norun' icon is returned.
-- Otherwise 'fail' icon is returned.
--
function getIconAndStatus(testCase)
    local pass   = testCase.pass
    local fail   = testCase.fail
    local info   = testCase.info
    local errors = testCase.errors
    local total  = pass + fail + info + errors

    local icon = "pass"
    local testStatus = "Test case passed"

    if fail > 0 or errors > 0 then
        testStatus = "Test case failed"
        icon = "fail"
    end

    if total == 0 then
        icon = "norun"
        testStatus = "Test results are empty"
    end

    return icon, testStatus
end



--
--
--
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
        local diff = passPerc + infoPerc + failPerc - 100
        passPerc = passPerc - diff
    end
    if passPerc + infoPerc + failPerc < 100 then
        local diff = 100 - passPerc - infoPerc - failPerc
        passPerc = passPerc + diff
    end

    if passPerc == 100 and fail > 0 then
        passPerc = passPerc - 1
        failPerc = failPerc + 1
    end

    if passPerc ~= passPerc then passPerc = 0 end
    if infoPerc ~= infoPerc then infoPerc = 0 end
    if failPerc ~= failPerc then failPerc = 0 end

    return passPerc, infoPerc, failPerc
end



--
-- Write the test case "header" to the HTML file.
--
function htmlWriter.writeCaseStart(fout, testCase)
    local passPerc, infoPerc, failPerc = computeCasePercentages(testCase)
    local icon, testStatus = getIconAndStatus(testCase)

    htmlWriter.toggleCounter = htmlWriter.toggleCounter + 1
    fout:write([[
                <div class="col-xs-12 col-sm-6 col-lg-4 tab-body-cell">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h5><span class="bullet ]] .. icon .. [[" title="]] .. testStatus .. [[">&bull;</span> ]] .. testCase.name .. [[</h5>
                      <div class="progress" title="Success: ]] ..passPerc .. [[%; Info: ]]..infoPerc..[[%; Failure: ]]..failPerc ..[[%">
                        <div class="progress-bar progress-bar-success" style="width: ]] .. passPerc .. [[%">
                          ]] .. passPerc .. [[%
                        </div>
                        <div class="progress-bar progress-bar-warning" style="width: ]] .. infoPerc .. [[%">
                          ]] .. infoPerc .. [[%
                        </div>
                        <div class="progress-bar progress-bar-danger" style="width: ]] .. failPerc .. [[%">
                          ]] .. failPerc .. [[%
                        </div>
                      </div>
                      <div class="collapse-widget">
                        <a class="panel-title collapsed" data-toggle="collapse" href="#toggle-]] .. htmlWriter.toggleCounter .. [[">
                          <span class="glyph" title="toggle display of all tested items"></span>
                        </a>
                      </div><!--collapse-widget-->
                    </div><!--panel-heading-->
                    <div id="toggle-]] .. htmlWriter.toggleCounter .. [[" class="panel-collapse collapse">
                      <div class="panel-body">
                        <table>
]])
end



--
-- Display part of a string enclosed in ** ** as <strong>
--
function highlightMessage(message)
    local highlightStart = "<strong>"
    local highlightStop = "</strong>"
    local output = ""
    local insideStars = false
    local wannaCloseRedBlock = false
    local i = 1

    while i <= #message do
        local char = message:sub(i,i)
        local twoChars = message:sub(i, i+1)

        -- two stars means we need to highlight the text
        -- but those two stars are used at the beginning *and* at the end too
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
        -- take care of more than two stars at the end of highlighted text:
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



--
-- Write the test case "footer" to the HTML file.
--
function htmlWriter.writeCaseEnd(fout, testCaseInfo)
    fout:write([[
                        </table>
                      </div><!--panel-body-->
                    </div><!--panel-collapse-->
                  </div><!--panel-->
                </div><!--tab-body-cell-->
]])
    htmlWriter.testCaseCounter = htmlWriter.testCaseCounter + 1
    local j = htmlWriter.testCaseCounter
    local j = htmlWriter.testCaseCounter
    if j % 3 == 0 then
        fout:write("                <div class=\"clearfix visible-md-block\"></div>\n")
    end
end



--
-- Write the test result to the HTML file.
--
function writeTestMessage(fout, message)
    local msgStatus = message[1]
    local explanation = message[2]
    -- get rid of all unwanted special HTML characters
    -- -> use corresponding HTML entities instead
    local escapedHTML = highlightMessage(explanation:escapeHTML())
    local class = msgStatus:lower()
    fout:write([[
                        <tr>
                          <td class="result ]] .. class .. [[">]] .. msgStatus .. [[</td>
                          <td>]] .. escapedHTML .. [[</td>
                        </tr>
]])
end



--
-- Write the test result to the HTML file.
--
function htmlWriter.writeTestPass(fout, testName, message)
    writeTestMessage(fout, message)
end



--
-- Write the test result to the HTML file.
--
function htmlWriter.writeTestFail(fout, testName, message)
    writeTestMessage(fout, message)
end



--
-- Write the test result to the HTML file.
--
function htmlWriter.writeTestInfo(fout, testName, message)
    writeTestMessage(fout, message)
end



--
-- Write the test result to the HTML file.
--
function htmlWriter.writeTestDebug(fout, testName, message)
    writeTestMessage(fout, message)
end



--
-- Write the test result to the HTML file.
--
function htmlWriter.writeTestError(fout, testName, message)
    writeTestMessage(fout, message)
end



--
-- Setup color output or no color output.
--
function htmlWriter.setColorOutput(colorOutput)
end



--
-- Called to initialize the writer.
--
function htmlWriter.initialize(outdir)
end



--
-- Called to finalize the writer.
--
function htmlWriter.finalize(outdir)
    local srcdir = getScriptDirectory()
    -- copy all files required by HTML page to the right output directory
    if outdir and srcdir then
        -- perform copy only if everything is setup correctly
        local command = "cp -r " .. srcdir .. "files/* " .. outdir
        local process = io.popen(command)
        -- wait for the process to finish
        if process then
            process:read('*all')
            process:close()
        end
    end
end



--
-- Export the module API
--
return htmlWriter

