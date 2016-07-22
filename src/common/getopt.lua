-- getopt.lua - module for handling command line options and flags.
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



--
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
-- Check if -D or --debug is used on the CLI.
--
function getopt.isDebugFlagUsed(options)
    return options["D"] or options["debug"]
end



--
-- Check if -G or --gendoc is used on the CLI.
--
function getopt.isGenDocFlagUsed(options)
    return options["G"] or options["gendoc"]
end


--
-- Check if -S or --service is used on the CLI.
--
function getopt.isServiceFlagUsed(options)
    return options["S"] or options["service"]
end


--
-- Check if --clean-current-workdir is used on the CLI.
--
function getopt.isCleanCurrentWorkDirFlagUsed(options)
    return options["clean-current-workdir"]
end

--
-- Check if --clean-emender-workdir is used on the CLI.
--
function getopt.isCleanAllWorkDirsFlagUsed(options)
    return options["clean-emender-workdir"]
end


--
-- Check if --clean-book-workdirs is used on the CLI.
--
function getopt.isCleanBookWorkDirsFlagUsed(options)
    return options["clean-book-workdirs"]
end


--
-- Returns table that would contain all unknown command line options.
--
function getopt.getUnknownOptions(options)
    local knownOptions = {"v", "verbose",   "l", "list",      "h", "help",
                          "V", "version",   "L", "license",   "c", "color",
                          "s", "summary",   "T", "trace",     "o", "output",
                          "D", "debug",     "t", "tags",      "G", "gendoc",
                          "S", "service",   "N", "name",      "f", "front-page",
                          "j", "job-url",   "g", "git-repo",  "b", "branch",
                          "clean-emender-workdir", "clean-book-workdirs",
                          "clean-current-workdir",
                          "C", "changelog-url"}

    -- we are going to modify table two times, so let's made a copy of it
    local unknownOptions = table.copy(options)

    -- remove all know options from the table of all options specified on command line
    for _, knownOption in ipairs(knownOptions) do
         unknownOptions[knownOption] = nil
    end

    -- all options that starts with "--X" are to be passed to the test
    for optionName, optionValue in pairs(options) do
         -- check the first letter if it's equals to "X"
         local firstLetter = optionName:subs(1,1)
         if firstLetter == "X" then
             -- we found option that could be passed to the test
             unknownOptions[optionName] = nil
         end
    end

    -- all options that are left in the table unknownOptions are really unknown options :)
    return unknownOptions
end



--
-- Get all options that could be passed to the test.
--
function getopt.getTestOptions(options)
    -- we are going to modify table two times, so let's made a copy of it
    local testOptions = {}

    -- all options that stars with "--X" are to be pass to the test
    for optionName, optionValue in pairs(options) do
         -- check the first letter if it's equals to "X"
         local firstLetter = optionName:subs(1,1)
         -- option name should be without the "X" at the beginning
         local realOptionName = optionName:subs(2)
         if firstLetter == "X" and realOptionName ~= nil then
             -- we found option that could be passed to the test
             testOptions[realOptionName] = optionValue
         end
    end

    -- return all test options found in list of all options specified on CLI
    return testOptions
end



--
-- Try to recognize all output formats specified by user
--
function getopt.recognizeOutputFormats(outputFileNames)
    local outputFiles = {}
    for _, outputFileName in ipairs(outputFileNames) do
        local extensionSeparator = outputFileName:find("%.[^%.]*$")
        if not extensionSeparator or extensionSeparator == #outputFileName then
            print("The provided output file name '" .. outputFileName .. "' has wrong format.")
            print("Emender supports the following name format: 'filename.xml' 'filename.txt',  'filename.html', 'filename.junit', 'filename.json', 'filename.summmary', and 'filename.message'.")
            os.exit(1)
        end
        local extension = outputFileName:subs(1+extensionSeparator)
        if extension == "txt" or extension == "html" or extension == "xml" or extension == "junit" or extension == "summary" or extension == "json" or extension == "message" then
            -- pair: file extension + handle
            outputFiles[outputFileName] = {extension, nil}
        else
            print("The provided output file name '" .. outputFileName .. "' has wrong extension '".. extension .."'.")
            print("Supported extensions are: .txt, .html, .xml, .junit, .json, .summary, and .message.")
            os.exit(1)
        end
    end
    return outputFiles
end



--
-- Try to recognize all tests that should be run.
--
function getopt.getTestsToRun(arg)
    local testList = {}

    for i, argument in ipairs(arg) do
        if argument ~= "" and argument:sub(1,1) ~= "-" then
            table.insert(testList, argument)
        end
    end

    return testList
end



--
-- Try to recognize all output file specified by user.
--
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



--
-- Try to read CLI option parameter for given short name or long name
--
function getOptionParameter(arg, shortName, longName)
    for i = 1, #arg-1 do
        if arg[i] == shortName or arg[i] == longName then
            return arg[i+1]
        end
    end

    return nil
end



--
-- Try to recognize ChangeLog URL
--
function getopt.getChangeLogURL(arg)
    return getOptionParameter(arg, "-C", "--changelog-url")
end



--
-- Try to recognize service URL
--
function getopt.getServiceURL(arg)
    return getOptionParameter(arg, "-S", "--service")
end



--
-- Try to recognize job name
--
function getopt.getName(arg)
    return getOptionParameter(arg, "-N", "--name")
end



--
-- Try to recognize job URL
--
function getopt.getJobURL(arg)
    return getOptionParameter(arg, "-j", "--job-url")
end



--
-- Try to recognize Git repository
--
function getopt.getGitRepository(arg)
    return getOptionParameter(arg, "-g", "--git-repo")
end



--
-- Try to recognize Git branch
--
function getopt.getGitBranch(arg)
    return getOptionParameter(arg, "-b", "--branch")
end



--
-- Try to recognize Emender front page
--
function getopt.getFrontPageURL(arg)
    return getOptionParameter(arg, "-f", "--front-page")
end



--
-- Try to recognize all tags.
--
function getopt.recognizeTags(arg)
    local tags = {}

    -- loop over all command line arguments
    for i = 1, #arg-1 do
        -- if the argument is -t or --tags, suppose then
        -- the following argument is a list of tags
        if arg[i] == "-t" or arg[i] == "--tags" then
            local tagNames = arg[i+1]
            -- tags are to be separated by commas
            -- let's split all tags
            local splittedNames = tagNames:split(",")
            -- insert all tags (one by one) into the table
            for _,name in ipairs(splittedNames) do
                table.insert(tags, name)
            end
            -- the already processed arguments can't be
            -- processed later
            arg[i] = ""
            arg[i+1] = ""
        end
    end

    return tags
end

function getopt.checkForUnknownOptions(options)
    local unknownOptions = getopt.getUnknownOptions(options)
    local unknownOptionsCnt = table.hashTableSize(unknownOptions)
    if unknownOptionsCnt > 0 then
        local msg = ""
        if unknownOptionsCnt == 1 then
            msg = "option is"
        else
            msg = "options are"
        end
        print("Error - unknown " .. msg .. " used on the command line:")

        -- list all unknown command line options
        -- for stability we need output to be sorted
        local sortedUnknownOptions = table.sortedKeys(unknownOptions)
        for _,v in ipairs(sortedUnknownOptions) do
            print("    " .. v)
        end

        os.exit(1)
    end
end

return getopt
