--
-- Module that could be used for tracing program flow.
--



local tracer = {
    level=0
}



--
-- Update trace level (for a bit nicer output).
--
function tracer.updateTraceLevel(event)
    if event == "call" then
        tracer.level = tracer.level + 1
    else
        tracer.level = tracer.level - 1
        if tracer.level < 0 then
            tracer.level = 0
        end
    end

end



--
-- Format info about the Lua function call.
--
function tracer.formatLuaCall(event, debugInfo)
    return event .. " " .. (debugInfo.name or "(unknown Lua)")
           .. " <" .. debugInfo.linedefined .. ":" .. debugInfo.short_src .. ">"
end



--
-- Format info about C function call.
--
function tracer.formatCCall(event, debugInfo)
    return event .. " " .. (debugInfo.name or "(unknown C)") .. " [" .. debugInfo.what .. "]"
end



--
-- Event handler for the tracer.
--
function tracer.eventHandler(event)
    local output = ""

    -- level == 3
    local debugInfo = debug.getinfo(3)

    local output = tracer.level .. " >>> " .. string.rep("    ", tracer.level)

    if debugInfo and debugInfo.currentline >= 0 then
        output = output .. debugInfo.short_src, ":" .. debugInfo.currentline .. " "
    end

    -- level == 3
    local debugInfo = debug.getinfo(2)

    tracer.updateTraceLevel(event)

    -- 'what' attribute could have the following values:
    --    "Lua"  for regular Lua functions
    --    "C"    for C function
    --    "main" for the main part of a Lua chunk.
    if debugInfo.what == "main" then
        if event == "call" then
            output = output .. "begin " .. debugInfo.short_src
        else
            output = output .. "end " .. debugInfo.short_src
        end
    elseif debugInfo.what == "Lua" then
        output = output .. tracer.formatLuaCall(event, debugInfo)
    elseif debugInfo.what == "C" then
        output = output .. tracer.formatCCall(event, debugInfo)
    else
        output = output .. " unknown!"
    end
    print(output)
end



--
-- Register event handler for the "call" and "return" events.
--
function tracer.enable()
    -- we want to call event handler for the following events:
    -- "call"
    -- "return"
    debug.sethook(tracer.eventHandler, "cr")
end


return tracer

