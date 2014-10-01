local abstractWriter = {
    outputFileStructs = nil,
    writers = {}
}

function abstractWriter.getWriterAndFout(outputFileStruct)
    local fileType = outputFileStruct[1]
    local fout     = outputFileStruct[2]
    local writer   = abstractWriter.writers[fileType]
    return abstractWriter.writers[fileType], fout
end

function abstractWriter.writeHeader(results)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeHeader(fout, results)
    end
end

function abstractWriter.writeFooter(results)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeFooter(fout, results)
    end
end

function abstractWriter.writeSuiteStart(testSuite)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeSuiteStart(fout, testSuite)
    end
end

function abstractWriter.writeSuiteEnd(testSuite)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeSuiteEnd(fout, testSuite)
    end
end

function abstractWriter.writeCaseStart(testCaseInfo)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeCaseStart(fout, testCaseInfo)
    end
end

function abstractWriter.writeCaseEnd(testCaseInfo)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeCaseEnd(fout, testCaseInfo)
    end
end

function abstractWriter.writeTestPass(testName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestPass(fout, testName, message)
    end
end

function abstractWriter.writeTestFail(testName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestFail(fout, testName, message)
    end
end

function abstractWriter.writeTestInfo(testName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestInfo(fout, testName, message)
    end
end

function abstractWriter.writeTestError(testName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestError(fout, testName, message)
    end
end

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


return abstractWriter

