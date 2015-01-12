-- Module with implementation of function to show help (usage).
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
Usage: emend [-clsvDT] [-o FILE] [FILE...]
       emend -h|-V|-L

-o, --output FILE   store a detailed report to a file; supported file
                    extensions are: .txt, .html, .xml, and .junit
-c, --color         enable colored output
-l, --list          list available tests and exit
-s, --summary       suppress detailed test results and print only summaries
-v, --verbose       enable verbose mode
-D, --debug         enable debugging information
-T, --trace         enable tracing information
-h, --help          display this help and exit
-V, --version       display version information and exit
-L, --license       display the license and exit
]])
end



-- export module 
return help

