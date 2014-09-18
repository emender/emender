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

function abstractWriter.writeHeader()
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeHeader(fout)
    end
end

function abstractWriter.writeFooter()
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeFooter(fout)
    end
end

function abstractWriter.writeOverallResults(okTests, failedTests)
    print("Overall Results")
    print()
    print("  Total:  " .. (okTests + failedTests))
    print("  Passed: " .. okTests)
    print("  Failed: " .. failedTests)
    print()

    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeOverallResults(fout, okTests, failedTests)
    end
end

function abstractWriter.writeTestName(testName)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestName(fout, testName)
    end
end

function abstractWriter.writeTestSummary(okCnt, errorCnt)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestSummary(fout, okCnt, errorCnt)
    end
end

function abstractWriter.writeTestFunctionName(functionName)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestFunctionName(fout, functionName)
    end
end

function abstractWriter.writeTestEnd()
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestEnd(fout)
    end
end

function abstractWriter.writeTestOk(message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestOk(fout, message)
    end
end

function abstractWriter.writeTestError(message)
    for _, outputFileStruct in pairs(abstractWriter.outputFileStructs) do
        local writer, fout = abstractWriter.getWriterAndFout(outputFileStruct)
        writer.writeTestError(fout, message)
    end
end


return abstractWriter

