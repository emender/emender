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
    print([[Emender version 0.0.1

    Usage: emend [-clsv] [file...]
           emend [-c] -h|-V|-L

    Options:
        -l, --list
         Prints a list of available tests to standard output and exits.

        -s, --summary
         Supress detailed test results and prints only a brief summary.

        -c, --color
         Enables colored output.

        -v, --verbose
         Enables verbose mode.

        -h, --help
         Displays usage information and exits.

        -V, --version
         Displays version information and exits.

        -L, --license
         Displays license text and exits.
    ]])
end

return help

