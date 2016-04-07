-- Module with implementation of function to show help (usage).
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
-- Module name
--
local help = {
}



--
-- Function to show help
--
function help.showHelp()
    print([[
Usage: emend [-clsvDT] [-o FILE] [-t TAG...] [FILE...]
       emend -h|-V|-L

-o, --output FILE   store a detailed report to a file; supported file
                    extensions are: .txt, .html, .xml, and .junit
-t, --tags TAGS     run only tests with selected tags; replace TAGS with
                    a comma-separated list of tags
-c, --color         enable colored output
-l, --list          list available tests and exit
-s, --summary       suppress detailed test results and print only summaries
-v, --verbose       enable verbose mode
-D, --debug         enable debugging information
-T, --trace         enable tracing information
-h, --help          display this help and exit
-V, --version       display version information and exit
-L, --license       display the license and exit
-G, --gendoc        generator documentation for Emender API
-N, --name          provide job name (used for calling the service)
-S, --service URL   call given service and send to it test results
    --Xparam=value  any parameter that is passed to the test
]])
end



-- export module 
return help

