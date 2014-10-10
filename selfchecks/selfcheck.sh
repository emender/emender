#!/usr/bin/env bash

# Emender selfcheck - it tries to run Emender using several command
# line options and check if the output is the same as expected output.
#
# This file is part of Emender.
#
# Emender is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# Emender is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Emender.  If not, see <http://www.gnu.org/licenses/>.
#

# TODO - comments

test_cnt=0
pass_cnt=0
fail_cnt=0

function runTests {
    ../emend -V        > show_version_1.out
    ../emend --version > show_version_2.out
}

function prepareErrorFile {
    echo -n "" > errors.txt
}

function compareResults {
    for expected_file_name in *.in
    do
        filename=$(basename "${expected_file_name}")
        filename="${filename%.*}"
        diff -u ${expected_file_name} ${filename}.out > ${filename}.diff
        if [[ $? != 0 ]]
        then
            echo ${filename} >> errors.txt
            let fail_cnt=fail_cnt+1
            echo "[ FAIL ]   ${filename}"
        else
            let pass_cnt=pass_cnt+1
            echo "[ PASS ]   ${filename}"
        fi
        let test_cnt=test_cnt+1
    done
}

function printSummary {
    echo
    echo "Passed: ${pass_cnt}"
    echo "Failed: ${fail_cnt}"
    echo "Total:  ${test_cnt}"
}

function run {
    prepareErrorFile
    runTests
    compareResults
    printSummary
}

run

