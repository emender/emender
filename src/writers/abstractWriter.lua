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
        writer.writeFooter(fout)
    end
end

function abstractWriter.writeSuiteStart(results, testName)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeSuiteStart(fout, results, testName)
    end
end

function abstractWriter.writeSuiteEnd(results, testName, test)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeSuiteEnd(fout, results, testName, test)
    end
end

function abstractWriter.writeCaseStart(results, testName, functionName)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeCaseStart(fout, results, testName, functionName)
    end
end

function abstractWriter.writeCaseEnd(results, testName)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeCaseEnd(fout, results, testName)
    end
end

function abstractWriter.writeTestPass(results, testName, testFunctionName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestPass(fout, results, testName, testFunctionName, message)
    end
end

function abstractWriter.writeTestFail(results, testName, testFunctionName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestFail(fout, results, testName, testFunctionName, message)
    end
end

function abstractWriter.writeTestInfo(results, testName, testFunctionName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestInfo(fout, results, testName, testFunctionName, message)
    end
end

function abstractWriter.writeTestError(results, testName, testFunctionName, message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestError(fout, results, testName, testFunctionName, message)
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

