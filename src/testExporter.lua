-- Module that contains test exporter.
--
-- Copyright (C) 2014, 2015 Pavel Tisnovsky
--
-- This file is part of Emender.
--
-- Emender is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 3 of the License.
--
-- Emender is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Emender.  If not, see <http://www.gnu.org/licenses/>.
--



--
-- Returns the directory where output file(s) should be generated.
--
function getDirectoryOfOutputFile(fileName)
    local process = io.popen("dirname " .. fileName)
    local out = process:read("*all")
    -- be sure that the process is not nil (Lua API is not stable at this point!)
    if process then
        process:close()
    end
    return out
end



--
-- Open all output files for writing and fill in outputFile[] data structure
-- with required information (handle to output file and directory).
--
function openOutputFiles(outputFiles)
    -- iterate over all records stored in outputFiles table
    for fileName, outputFile in pairs(outputFiles) do
        local fout = io.open(fileName, "w")
        if fout then
            outputFile[2] = fout
            -- we need to know the output directory too
            outputFile[3] = getDirectoryOfOutputFile(fileName)
        else
            print("Error: can not open file '" .. fileName .. "' for writing.")
            os.exit(2)
        end
    end
end



--
-- Close all output files.
--
function closeOutputFiles(outputFiles)
    -- iterate over all records stored in outputFiles table
    for _, outputFile in pairs(outputFiles) do
        local fout = outputFile[2]
        -- fout can't be nil, but let's be on safe place
        if fout then
            fout:close()
        else
            print("Internal Emender error - can not close one output file.")
            os.exit(2)
        end
    end
end



--
-- Export results into all selected output files.
--
function exportResults(outputFiles, colorOutput, selectedWriter, results)
    -- open all output files for writing and fill in outputFile[] data structure
    -- with required information (handle to output file and directory).
    openOutputFiles(outputFiles)

    -- initialize writer
    selectedWriter.outputFileStructs = outputFiles
    selectedWriter.initialize()
    --selectedWriter.setColorOutput(colorOutput)
    selectedWriter.writeHeader(results)

    -- iterate over all test suites
    for i,testSuite in ipairs(results.suites) do
        local testName = testSuite.name
        local testCases = testSuite.methods
        selectedWriter.writeSuiteStart(testSuite)

        -- iterate over all test cases in given test suite
        for j,testCase in ipairs(testCases) do
            selectedWriter.writeCaseStart(testCase)

            -- iterate over all messages recorded during test suite run
            for _,message in ipairs(testCase.messages) do
                local status = message[1]
                local messageText = message[2]
                local url = message[3]
                if status == "PASS" then
                    selectedWriter.writeTestPass(testName, message, colorOutput)
                elseif status == "FAIL" then
                    selectedWriter.writeTestFail(testName, message, colorOutput)
                elseif status == "INFO" then
                    selectedWriter.writeTestInfo(testName, message, colorOutput)
                elseif status == "LINK" then
                    selectedWriter.writeTestLink(testName, message, url, colorOutput)
                elseif status == "ERROR" then
                    if messageText then
                        selectedWriter.writeTestError(testName, message, colorOutput)
                    end
                end
            end
            selectedWriter.writeCaseEnd(testCase)
        end
        selectedWriter.writeSuiteEnd(testSuite)
    end
    selectedWriter.writeFooter(results)

    -- close all output file
    closeOutputFiles(outputFiles)
    selectedWriter.finalize()
end

