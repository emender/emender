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

local help = {
}

function help.showHelp()
    print([[
Usage: emend [-clsv] [FILE...]
       emend [-c] -h|-V|-L

-l, --list          list available tests and exit
-s, --summary       suppress detailed test results and print only summaries
-c, --color         enable colored output
-v, --verbose       enable verbose mode
-h, --help          display this help and exit
-V, --version       display version information and exit
-L, --license       display the license and exit
]])
end

return help

