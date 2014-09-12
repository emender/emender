-- tracer.lua - a module that could be used for tracing program flow.a 
-- Copyright (C) 2014 Pavel Tisnovsky
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



local tracer = {
    level=0
}



--
-- Update trace level (for a bit nicer output).
--
function tracer.updateTraceLevel(debugInfo, event)
    if event == "call" then
        tracer.level = tracer.level + 1
    else
        tracer.level = tracer.level - 1
        if tracer.level < 0 then
            tracer.level = 0
        end
    end

    -- we need to take care of pcall() + error() calls
    if debugInfo.name == "error" and debugInfo.what == "C" then
        tracer.level = tracer.level - 5
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

    tracer.updateTraceLevel(debugInfo, event)

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

