-- abstractWriter.lua - module that provides cooperation of all registered writers.
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
local abstractWriter = {
    outputFileStructs = nil,
    writers = {}
}



--
-- This function is to be called from the core only.
-- Return writer and output file handle for the given output file structure.
--
function abstractWriter.getWriterAndFout(outputFileStruct)
    local fileType = outputFileStruct[1]
    local fout     = outputFileStruct[2]
    local writer   = abstractWriter.writers[fileType]
    return abstractWriter.writers[fileType], fout
end



--
-- This function is to be called from the core only.
-- Return writer and output directory.
--
function abstractWriter.getWriterAndOutputDirectory(outputFileStruct)
    local fileType = outputFileStruct[1]
    local outdir   = outputFileStruct[3]
    local writer   = abstractWriter.writers[fileType]
    return abstractWriter.writers[fileType], outdir
end



--
-- Setup color output or no color output.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.setColorOutput(colorOutput)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.setColorOutput(colorOutput)
    end
end



--
-- Called when the whole test is started.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeHeader(results)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeHeader(fout, results)
    end
end



--
-- Called when whole test finished.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeFooter(results)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeFooter(fout, results)
    end
end



--
-- Called when test suite is started.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeSuiteStart(testSuite)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeSuiteStart(fout, testSuite)
    end
end



--
-- Called when test suite finished.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeSuiteEnd(testSuite)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeSuiteEnd(fout, testSuite)
    end
end



--
-- Called when test case is started.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeCaseStart(testCaseInfo)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeCaseStart(fout, testCaseInfo)
    end
end



--
-- Called when test case finished.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeCaseEnd(testCaseInfo)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeCaseEnd(fout, testCaseInfo)
    end
end



--
-- Called for each pass() function.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeTestPass(testName, message)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestPass(fout, testName, message)
    end
end



--
-- Called for each fail() function.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeTestFail(testName, message)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestFail(fout, testName, message)
    end
end



--
-- Called for each warn() function.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeTestInfo(testName, message)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestInfo(fout, testName, message)
    end
end



--
-- Called for each debug() function.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeTestDebug(testName, message)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestDebug(fout, testName, message)
    end
end



--
-- Called in case of any error in the test structure.
-- This function calls functions with the same name that should exist for all registered writers.
--
function abstractWriter.writeTestError(testName, message)
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestError(fout, testName, message)
    end
end



--
-- Write overall results to the standard output.
--
function abstractWriter.writeOverallResults(results)
    local passedTests = results.passedTests
    local failedTests = results.failedTests
    local allTests = passedTests + failedTests

    print("Overall Results")
    print()
    print("  Total:  " .. allTests)
    print("  Passed: " .. passedTests)
    print("  Failed: " .. failedTests)
    print()
end



--
-- Called to initialize writers.
--
function abstractWriter.initialize()
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, outdir = abstractWriter.getWriterAndOutputDirectory(outputFileStruct)
        writer.initialize(outdir)
    end
end



--
-- Called to finalize writers.
--
function abstractWriter.finalize()
    -- loop over all registered writers
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, outdir = abstractWriter.getWriterAndOutputDirectory(outputFileStruct)
        writer.finalize(outdir)
    end
end



--
-- Function that registers all writers.
--
function abstractWriter.registerWriters(htmlWriter, xmlWriter, textWriter, junitWriter, summaryWriter)
    abstractWriter.writers["html"] = htmlWriter
    abstractWriter.writers["xml"] = xmlWriter
    abstractWriter.writers["txt"] = textWriter
    abstractWriter.writers["junit"] = junitWriter
    abstractWriter.writers["summary"] = summaryWriter
end



--
-- Export the module API
--
return abstractWriter

