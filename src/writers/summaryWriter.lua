-- summaryWriter.lua - a writer for the very simple summary plain text file format
-- Copyright (C) 2014 - 2017  Pavel Tisnovsky

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
local summaryWriter = {
}



--
-- Do nothing:
--
function summaryWriter.writeHeader(fout, results)
    return
end



--
-- Write the report footer to the file:
--
function summaryWriter.writeFooter(fout, results)
    local passed = results.passedTests
    local failed = results.failedTests
    local total  = passed + failed

    fout:write(total .. "\n")
    fout:write(passed .. "\n")
    fout:write(failed .. "\n")
end



--
-- Do nothing:
--
function summaryWriter.writeSuiteStart(fout, testSuite)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeSuiteEnd(fout, testSuite)
    return
end

--
-- Do nothing:
--
function summaryWriter.writeCaseStart(fout, testCase)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeCaseEnd(fout, testCaseInfo)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestPass(fout, testName, message)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestFail(fout, testName, message)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestFailLink(fout, testName, message, url)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestInfo(fout, testName, message)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestInfoLink(fout, testName, message, url)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestDebug(fout, testName, message)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestError(fout, testName, message)
    return
end



--
-- Do nothing:
--
function summaryWriter.writeTestLink(fout, testName, message, url)
    return
end



--
-- Setup color output or no color output.
--
function summaryWriter.setColorOutput(colorOutput)
end



--
-- Called to initialize the writer.
--
function summaryWriter.initialize(outdir)
end



--
-- Called to finalize the writer.
--
function summaryWriter.finalize(outdir)
end



--
-- Export the module API
--
return summaryWriter

