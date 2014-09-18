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



local getopt = {
}



-- This function is taken from http://lua-users.org/wiki/AlternativeGetOpt
-- getopt, POSIX style command line argument parser
-- param arg contains the command line arguments in a standard table.
-- param options is a string with the letters that expect string values.
-- returns a table where associated keys are true, nil, or a string value.
-- The following example styles are supported
--   -a one  ==> opts["a"]=="one"
--   -bone   ==> opts["b"]=="one"
--   -c      ==> opts["c"]==true
--   --c=one ==> opts["c"]=="one"
--   -cdaone ==> opts["c"]==true opts["d"]==true opts["a"]=="one"
-- note POSIX demands the parser ends at the first non option
--      this behavior isn't implemented.
function getopt.getopt(arg, options)
  local tab = {}
  for k, v in ipairs(arg) do
    if string.sub( v, 1, 2) == "--" then
      local x = string.find( v, "=", 1, true )
      if x then tab[ string.sub( v, 3, x-1 ) ] = string.sub( v, x+1 )
      else      tab[ string.sub( v, 3 ) ] = true
      end
    elseif string.sub( v, 1, 1 ) == "-" then
      local y = 2
      local l = string.len(v)
      local jopt
      while ( y <= l ) do
        jopt = string.sub( v, y, y )
        if string.find( options, jopt, 1, true ) then
          if y < l then
            tab[ jopt ] = string.sub( v, y+1 )
            y = l
          else
            tab[ jopt ] = arg[ k + 1 ]
          end
        else
          tab[ jopt ] = true
        end
        y = y + 1
      end
    end
  end
  return tab
end



--
-- Check if -v or --verbose option is used on the CLI.
--
function getopt.isVerboseOptionUsed(options)
    return options["v"] or options["verbose"]
end



--
-- Check if -l or --list option is used on the CLI.
--
function getopt.isTestListOptionUsed(options)
    return options["l"] or options["list"]
end



--
-- Check if -h or --help option is used on the CLI.
--
function getopt.isHelpOptionUsed(options)
    return options["h"] or options["help"]
end



--
-- Check if -V or --version is used on the CLI.
--
function getopt.isVersionOptionUsed(options)
    return options["V"] or options["version"]
end



--
-- Check if -L or --license is used on the CLI.
--
function getopt.isLicenseOptionUsed(options)
    return options["L"] or options["license"]
end



--
-- Check if -c or --color is used on the CLI.
--
function getopt.isColorOutputOptionUsed(options)
    return options["c"] or options["color"]
end



--
-- Check if -s or --summary is used on the CLI.
--
function getopt.isSummaryOptionUsed(options)
    return options["s"] or options["summary"]
end



--
-- Check if -T or --trace is used on the CLI.
--
function getopt.isTraceOptionUsed(options)
    return options["T"] or options["trace"]
end



--
-- Returns table that would contain all unknown command line options.
--
function getopt.getUnknownOptions(options)
    local knownOptions = {"v", "verbose",   "l", "list",      "h", "help",
                          "V", "version",   "L", "license",   "c", "color",
                          "s", "summary",   "T", "trace",     "o", "output"}
    local unknownOptions = table.copy(options)
    for _, knownOption in ipairs(knownOptions) do
         unknownOptions[knownOption] = nil
    end
    return unknownOptions
end



function getopt.recognizeOutputFormats(outputFileNames)
    local outputFiles = {}
    for _, outputFileName in ipairs(outputFileNames) do
        local extensionSeparator = outputFileName:find("%.[^%.]*$")
        if not extensionSeparator or extensionSeparator == #outputFileName then
            print("The provided output file name '" .. outputFileName .. "' has wrong format.")
            print("Emender supports the following name format: 'filename.xml' 'filename.txt' and 'filename.html'.")
            os.exit(1)
        end
        local extension = outputFileName:subs(1+extensionSeparator)
        if extension == "txt" or extension == "html" or extension == "xml" then
            -- pair: file extension + handle
            outputFiles[outputFileName] = {extension, nil}
        else
            print("The provided output file name '" .. outputFileName .. "' has wrong extension '".. extension .."'.")
            print("Supported extensions are: .txt, .html and .xml.")
            os.exit(1)
        end
    end
    return outputFiles
end

function getopt.getTestsToRun(arg)
    local testList = {}

    for i, argument in ipairs(arg) do
        if argument ~= "" and argument:sub(1,1) ~= "-" then
            table.insert(testList, argument)
        end
    end

    return testList
end

function getopt.getOutputFiles(arg)
    local outputFiles = {}

    for i = 1, #arg-1 do
        if arg[i] == "-o" or arg[i] == "--output" then
            table.insert(outputFiles, arg[i+1])
            arg[i] = ""
            arg[i+1] = ""
        end
    end

    return outputFiles
end

return getopt

