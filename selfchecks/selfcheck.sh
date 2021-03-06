#!/usr/bin/env bash

#
# Emender selfcheck - this script tries to run Emender using several command
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



#
# Several output files are generated:
#     all_tests.property    - contains only one number with number of all tests
#     passed_tests.property - contains number of passed tests
#     failed_tests.property - contains number of failed tests
#     results.xml           - test results in JUnit format
#



# Counters of all tests, passed tests and failed tests
test_cnt=0
pass_cnt=0
fail_cnt=0



# Run Emender by using various CLI options and export output
function runTestsForBasicCLI {
    ../emend -V                            > show_version_1.out
    ../emend --version                     > show_version_2.out
    ../emend -L                            > show_license_1.out
    ../emend --license                     > show_license_2.out
    ../emend -h                            > show_help_1.out
    ../emend --help                        > show_help_2.out
    ../emend -l ../test/Test1.lua          > test_list_1.out
    ../emend -l ../test/Test100*.lua       > test_list_2.out
    ../emend -l ../test/TestAssertion*.lua > test_list_3.out
    ../emend -l ../test/T*.lua             > test_list_4.out
    ../emend -l ../test/Test*.lua          > test_list_5.out
    ../emend -l ../test/Test1.?ua          > test_list_6.out
    ../emend -l ../test/Test1.[a-z]ua      > test_list_7.out
    ../emend -G                            > show_gendoc_1.out
    ../emend --gendoc                      > show_gendoc_2.out
    ../emend                    ../test/TestJobName.lua > test_job_name_0.out

    ../emend -N xyzzy           ../test/TestJobName.lua > test_job_name_1.out
    ../emend --name xyzzy       ../test/TestJobName.lua > test_job_name_2.out
    ../emend -N 42              ../test/TestJobName.lua > test_job_name_3.out
    ../emend --name 42          ../test/TestJobName.lua > test_job_name_4.out
    ../emend -N ""              ../test/TestJobName.lua > test_job_name_5.out
    ../emend --name ""          ../test/TestJobName.lua > test_job_name_6.out
    ../emend -N "x y"            ../test/TestJobName.lua > test_job_name_7.out
    ../emend --name "x y"        ../test/TestJobName.lua > test_job_name_8.out

    ../emend                    ../test/TestGitRepo.lua > test_git_repo_0.out
    ../emend -g xyzzy           ../test/TestGitRepo.lua > test_git_repo_1.out
    ../emend --git-repo xyzzy   ../test/TestGitRepo.lua > test_git_repo_2.out
    ../emend -g 42              ../test/TestGitRepo.lua > test_git_repo_3.out
    ../emend --git-repo 42      ../test/TestGitRepo.lua > test_git_repo_4.out
    ../emend -g ""              ../test/TestGitRepo.lua > test_git_repo_5.out
    ../emend --git-repo ""      ../test/TestGitRepo.lua > test_git_repo_6.out
    ../emend -g "x y"           ../test/TestGitRepo.lua > test_git_repo_7.out
    ../emend --git-repo "x y"   ../test/TestGitRepo.lua > test_git_repo_8.out

    ../emend                    ../test/TestGitBranch.lua > test_git_branch_0.out
    ../emend -b xyzzy           ../test/TestGitBranch.lua > test_git_branch_1.out
    ../emend --branch xyzzy     ../test/TestGitBranch.lua > test_git_branch_2.out
    ../emend -b 42              ../test/TestGitBranch.lua > test_git_branch_3.out
    ../emend --branch 42        ../test/TestGitBranch.lua > test_git_branch_4.out
    ../emend -b ""              ../test/TestGitBranch.lua > test_git_branch_5.out
    ../emend --branch ""        ../test/TestGitBranch.lua > test_git_branch_6.out
    ../emend -b "x y"           ../test/TestGitBranch.lua > test_git_branch_7.out
    ../emend --branch "x y"     ../test/TestGitBranch.lua > test_git_branch_8.out

    ../emend                    ../test/TestFrontPageURL.lua > test_front_page_url_0.out
    ../emend -f xyzzy           ../test/TestFrontPageURL.lua > test_front_page_url_1.out
    ../emend --front-page xyzzy ../test/TestFrontPageURL.lua > test_front_page_url_2.out
    ../emend -f 42              ../test/TestFrontPageURL.lua > test_front_page_url_3.out
    ../emend --front-page 42    ../test/TestFrontPageURL.lua > test_front_page_url_4.out
    ../emend -f ""              ../test/TestFrontPageURL.lua > test_front_page_url_5.out
    ../emend --front-page ""    ../test/TestFrontPageURL.lua > test_front_page_url_6.out
    ../emend -f "x y"           ../test/TestFrontPageURL.lua > test_front_page_url_7.out
    ../emend --front-page "x y" ../test/TestFrontPageURL.lua > test_front_page_url_8.out

    ../emend                    ../test/TestJobURL.lua > test_job_url_0.out
    ../emend -j xyzzy           ../test/TestJobURL.lua > test_job_url_1.out
    ../emend --job-url xyzzy    ../test/TestJobURL.lua > test_job_url_2.out
    ../emend -j 42              ../test/TestJobURL.lua > test_job_url_3.out
    ../emend --job-url 42       ../test/TestJobURL.lua > test_job_url_4.out
    ../emend -j ""              ../test/TestJobURL.lua > test_job_url_5.out
    ../emend --job-url ""       ../test/TestJobURL.lua > test_job_url_6.out
    ../emend -j "x y"           ../test/TestJobURL.lua > test_job_url_7.out
    ../emend --job-url "x y"    ../test/TestJobURL.lua > test_job_url_8.out

    ../emend                        ../test/TestChangeLogURL.lua > test_changelog_url_0.out
    ../emend -C xyzzy               ../test/TestChangeLogURL.lua > test_changelog_url_1.out
    ../emend --changelog-url xyzzy  ../test/TestChangeLogURL.lua > test_changelog_url_2.out
    ../emend -C 42                  ../test/TestChangeLogURL.lua > test_changelog_url_3.out
    ../emend --changelog-url 42     ../test/TestChangeLogURL.lua > test_changelog_url_4.out
    ../emend -C ""                  ../test/TestChangeLogURL.lua > test_changelog_url_5.out
    ../emend --changelog-url ""     ../test/TestChangeLogURL.lua > test_changelog_url_6.out
    ../emend -C "x y"               ../test/TestChangeLogURL.lua > test_changelog_url_7.out
    ../emend --changelog-url "x y"  ../test/TestChangeLogURL.lua > test_changelog_url_8.out
}



# Run Emender by using various bad CLI options
function runTestsWithBadCLIOptions {
    ../emend -x                  > bad_cli_options_1.out
    ../emend --xyzzy             > bad_cli_options_2.out
    ../emend -x -h               > bad_cli_options_3.out
    ../emend -x -?               > bad_cli_options_4.out
    ../emend --xyzzy --??        > bad_cli_options_5.out
    ../emend --xyzzy --?? -v -c  > bad_cli_options_6.out
    ../emend  -v -c -V -x -y -z  > bad_cli_options_7.out
}



# Run Emender by using unknown CLI options
# Try to use all one character wide options excluding the supported ones:
#   -c
#   -h
#   -l
#   -o
#   -s
#   -t
#   -v
#   -D
#   -G
#   -L
#   -T
#   -V
#   -X
function runTestsWithUnknownCLIOptions {
    ../emend -a                  > unknown_cli_option_a.out
    #        -b is correct option
    #        -c is correct option
    ../emend -d                  > unknown_cli_option_d.out
    ../emend -e                  > unknown_cli_option_e.out
    #        -f is now correct option
    #../emend -f                  > unknown_cli_option_f.out
    #        -g is correct option
    #        -h is correct option
    ../emend -i                  > unknown_cli_option_i.out
    #        -j is correct option
    ../emend -k                  > unknown_cli_option_k.out
    #        -l is correct option
    ../emend -m                  > unknown_cli_option_m.out
    ../emend -n                  > unknown_cli_option_n.out
    #        -o is correct option
    ../emend -p                  > unknown_cli_option_p.out
    ../emend -q                  > unknown_cli_option_q.out
    ../emend -r                  > unknown_cli_option_r.out
    #        -s is correct option
    #        -t is correct option
    ../emend -u                  > unknown_cli_option_u.out
    #        -v is correct option
    ../emend -w                  > unknown_cli_option_w.out
    ../emend -x                  > unknown_cli_option_x.out
    ../emend -y                  > unknown_cli_option_y.out
    ../emend -z                  > unknown_cli_option_z.out

    ../emend -A                  > unknown_cli_option_A.out
    ../emend -B                  > unknown_cli_option_B.out
    #        -C is correct option
    #        -D is correct option
    ../emend -E                  > unknown_cli_option_E.out
    ../emend -F                  > unknown_cli_option_F.out
    #        -G is correct option
    ../emend -H                  > unknown_cli_option_H.out
    ../emend -I                  > unknown_cli_option_I.out
    ../emend -J                  > unknown_cli_option_J.out
    ../emend -K                  > unknown_cli_option_K.out
    #        -L is correct option
    ../emend -M                  > unknown_cli_option_M.out
    #        -N is correct option
    ../emend -O                  > unknown_cli_option_O.out
    ../emend -P                  > unknown_cli_option_P.out
    ../emend -Q                  > unknown_cli_option_Q.out
    ../emend -R                  > unknown_cli_option_R.out
    #        -S is correct option
    #        -T is correct option
    ../emend -U                  > unknown_cli_option_U.out
    #        -V is correct option
    ../emend -W                  > unknown_cli_option_W.out
    #        -X is correct option
    #../emend -X                  > unknown_cli_option_X.out
    ../emend -Y                  > unknown_cli_option_Y.out
    ../emend -Z                  > unknown_cli_option_Z.out
}



# Run Emender by using various bad output format
function runTestsWithBadOutputFormat {
    ../emend -o output1  ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_1.out
    ../emend -o out.     ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_2.out
    ../emend -o out..    ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_3.out
    ../emend -o out.doc  ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_4.out
    ../emend -o out.X    ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_5.out
    ../emend -o out.htm  ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_6.out
    ../emend -o out.xhtm ../test/TestPassFail.lua ../test/Test1.lua > bad_output_format_7.out
}



# Run Emender with some example tests with known output
function runTestExamples {
     ../emend ../test/TestEmpty.lua                > test_empty.out
     ../emend ../test/TestSetUp.lua                > test_setup.out
     ../emend ../test/TestSetUpOnly.lua            > test_setup_only.out
     ../emend ../test/TestSetUpTearDown.lua        > test_setup_teardown.out
     ../emend ../test/TestSetUpTearDownOnly.lua    > test_setup_teardown_only.out
     ../emend ../test/TestSetUpFailure.lua         > test_setup_failure.out
     ../emend ../test/TestSetUpOnlyFailure.lua     > test_setup_only_failure.out
     ../emend ../test/TestTearDown.lua             > test_teardown.out
     ../emend ../test/TestTearDownOnly.lua         > test_teardown_only.out
     ../emend ../test/TestPassFail.lua             > test_pass_fail.out
     ../emend ../test/Test100Passes1Fail.lua       > test_100_passes_1_fail.out
     ../emend ../test/Test100Passes1Info.lua       > test_100_passes_1_info.out
     ../emend ../test/Test100Passes1Link.lua       > test_100_passes_1_link.out
     ../emend ../test/Test100Passes1Yap.lua        > test_100_passes_1_yap.out
     ../emend -D ../test/Test100Passes1Yap.lua     > test_100_passes_1_yap_debug.out
     ../emend ../test/Test100Failures1Pass.lua     > test_100_failures_1_pass.out
     ../emend ../test/Test100Failures1Info.lua     > test_100_failures_1_info.out
     ../emend ../test/Test100Failures1Link.lua     > test_100_failures_1_link.out
     ../emend ../test/Test100Failures1Yap.lua      > test_100_failures_1_yap.out
     ../emend -D ../test/Test100Failures1Yap.lua   > test_100_failures_1_yap_debug.out
     ../emend ../test/Test100Infos1Pass.lua        > test_100_infos_1_pass.out
     ../emend ../test/Test100Infos1Fail.lua        > test_100_infos_1_fail.out
     ../emend ../test/Test1Pass.lua                > test_1_pass.out
     ../emend ../test/Test1Fail.lua                > test_1_fail.out
     ../emend ../test/Test1Info.lua                > test_1_info.out
     ../emend ../test/Test1FailLink.lua            > test_1_fail_link.out
     ../emend ../test/Test1InfoLink.lua            > test_1_info_link.out
     ../emend ../test/Test100Infos1FailLink.lua    > test_100_infos_1_fail_link.out
     ../emend ../test/Test100Failures1InfoLink.lua > test_100_failures_1_info_link.out
     ../emend ../test/Test100Passes1InfoLink.lua   > test_100_passes_1_info_link.out
     ../emend ../test/Test100Passes1FailLink.lua   > test_100_passes_1_fail_link.out

}



# Run Emender with tests that check various file operations
function runTestsForFileOperations {
     ../emend ../test/TestFileOperationSlurp.lua       > test_file_operation_slurp.out
     ../emend ../test/TestFileOperationSlurpTable.lua  > test_file_operation_slurp_table.out
     ../emend ../test/TestFileOperationSpit.lua        > test_file_operation_spit.out
     ../emend ../test/TestFileOperationSpitTable.lua   > test_file_operation_spit_table.out
}



# Run Emender with tests that check various assertions
function runTestsForAssertions {
     ../emend ../test/TestAssertionPass.lua       > test_assertion_pass.out
     ../emend ../test/TestAssertionFail.lua       > test_assertion_fail.out
     ../emend ../test/TestAssertionWarn.lua       > test_assertion_warn.out
     ../emend ../test/TestAssertionIsTrue.lua     > test_assertion_is_true.out
     ../emend ../test/TestAssertionIsFalse.lua    > test_assertion_is_false.out
     ../emend ../test/TestAssertionIsEmpty.lua    > test_assertion_is_empty.out
     ../emend ../test/TestAssertionIsNotEmpty.lua > test_assertion_is_not_empty.out
     ../emend ../test/TestAssertionIsNil.lua      > test_assertion_is_nil.out
     ../emend ../test/TestAssertionIsNotNil.lua   > test_assertion_is_not_nil.out
     ../emend ../test/TestAssertionIsEqual.lua    > test_assertion_is_equal.out
     ../emend ../test/TestAssertionIsUnequal.lua  > test_assertion_is_unequal.out
     ../emend ../test/TestAssertionIsLike.lua     > test_assertion_is_like.out
     ../emend ../test/TestAssertionIsUnlike.lua   > test_assertion_is_unlike.out
     ../emend ../test/TestAssertionIsType.lua     > test_assertion_is_type.out
     ../emend ../test/TestAssertionIsNotType.lua  > test_assertion_is_not_type.out
}



# Run Emender with tests that check various Emender modules
function runTestsModules {
     ../emend ../test/TestModuleAsserts.lua > test_module_asserts.out
     ../emend ../test/TestModuleExec.lua    > test_module_exec.out
     ../emend ../test/TestModuleFileio.lua  > test_module_fileio.out
     ../emend ../test/TestModuleGendoc.lua  > test_module_gendoc.out
     ../emend ../test/TestModuleGetopt.lua  > test_module_getopt.out
     ../emend ../test/TestModuleLogger.lua  > test_module_logger.out
     ../emend ../test/TestModuleString.lua  > test_module_string.out
     ../emend ../test/TestModuleTable.lua   > test_module_table.out
     ../emend ../test/TestModuleTracer.lua  > test_module_tracer.out
     ../emend ../test/TestPathCompose.lua   > test_module_path_compose.out
     ../emend ../test/TestPathCompose.lua   > test_module_path_compose.out
     ../emend ../test/TestIniFileReader.lua > test_ini_file_reader.out
}



# Run other tests
function runOtherTests {
     ../emend ../test/TestColorInMessages.lua  > test_color_in_messages.out
     ../emend ../test/TestManPages.lua         > test_man_pages.out
     ../emend ../test/TestComments.lua         > test_comments.out
     ../emend ../test/TestWithoutFunctions.lua > test_without_functions.out
     ../emend ../test/TestRequires1.lua        > test_requires1.out
     ../emend ../test/TestRequires2.lua        > test_requires2.out
     ../emend ../test/TestRequires3.lua        > test_requires3.out
     ../emend ../test/TestRequires4.lua        > test_requires4.out
     ../emend ../test/TestRequires5.lua        > test_requires5.out
     ../emend ../test/TestRequires6.lua        > test_requires6.out
     ../emend ../test/TestRequires7.lua        > test_requires7.out
     ../emend ../test/TestRequires8.lua        > test_requires8.out
     ../emend ../test/TestRequires9.lua        > test_requires9.out
     ../emend ../test/TestRequiresA.lua        > test_requiresA.out
     ../emend ../test/TestRequiresB.lua        > test_requiresB.out
     ../emend ../test/TestRequiresC.lua        > test_requiresC.out
     ../emend ../test/TestRequiresD.lua        > test_requiresD.out
     ../emend ../test/TestRequiresE.lua        > test_requiresE.out
     ../emend ../test/TestExec.lua             > test_exec.out
     ../emend ../test/TestParameters.lua       > test_parameters.out
     ../emend --Xparam1=100                       ../test/TestParameters.lua > test_parameters_1.out
     ../emend --Xparam1=42                        ../test/TestParameters.lua > test_parameters_2.out
     ../emend --Xparam2=100                       ../test/TestParameters.lua > test_parameters_3.out
     ../emend --Xparam2=unknown                   ../test/TestParameters.lua > test_parameters_4.out
     ../emend --Xparam1=100 --Xparam2=42          ../test/TestParameters.lua > test_parameters_5.out
     ../emend --Xparam1=100 --Xparam2=unknown     ../test/TestParameters.lua > test_parameters_6.out
     ../emend --Xparam1=42  --Xparam2=42          ../test/TestParameters.lua > test_parameters_7.out
     ../emend --Xparam1=42  --Xparam2=unknown     ../test/TestParameters.lua > test_parameters_8.out
     pushd ini
     ../../emend --Xparam1=42  --Xparam2=x        ../../test/TestParameters.lua | tail -n +2 > ../test_parameters_9.out
     popd
}



# Test Emender's return value
function runTestReturnValuePositive {
     ../emend -V
     echo $? > test_return_value_1.out

     ../emend --version
     echo $? > test_return_value_2.out

     ../emend -L
     echo $? > test_return_value_3.out

     ../emend --license
     echo $? > test_return_value_4.out

     ../emend -h
     echo $? > test_return_value_5.out

     ../emend --help
     echo $? > test_return_value_6.out

     ../emend ../test/Test1Pass.lua
     echo $? > test_return_value_7.out

     ../emend ../test/Test1Fail.lua
     echo $? > test_return_value_8.out
}



# Test Emender's return negative
function runTestReturnValueNegative {
     ../emend -x
     echo $? > test_return_value_n1.out

     ../emend --xyzzy
     echo $? > test_return_value_n2.out

     ../emend -x -h
     echo $? > test_return_value_n3.out

     ../emend -?
     echo $? > test_return_value_n4.out

     ../emend --??
     echo $? > test_return_value_n5.out

     ../emend -v -c -V -x -y -z
     echo $? > test_return_value_n6.out
}



# Test Emender's ability to handle tags properly
function runTestsWithTags {
    ../emend -t tagA ../test/TestTagA.lua > test_testA_tagA.out
    ../emend -t tagB ../test/TestTagA.lua > test_testA_tagB.out
    ../emend -t tagC ../test/TestTagA.lua > test_testA_tagC.out
    ../emend -t tagA ../test/TestTagB.lua > test_testB_tagA.out
    ../emend -t tagB ../test/TestTagB.lua > test_testB_tagB.out
    ../emend -t tagC ../test/TestTagB.lua > test_testB_tagC.out
    ../emend -t tagA ../test/TestTagC.lua > test_testC_tagA.out
    ../emend -t tagB ../test/TestTagC.lua > test_testC_tagB.out
    ../emend -t tagC ../test/TestTagC.lua > test_testC_tagC.out

    ../emend -t tagA ../test/TestTag*.lua > test_testA_all.out
    ../emend -t tagB ../test/TestTag*.lua > test_testB_all.out
    ../emend -t tagC ../test/TestTag*.lua > test_testC_all.out

    ../emend -t tagA -t tagB ../test/TestTag*.lua > test_tagA_tagB.out
    ../emend -t tagA -t tagC ../test/TestTag*.lua > test_tagA_tagC.out
    ../emend -t tagB -t tagC ../test/TestTag*.lua > test_tagB_tagC.out

    ../emend -t tagX         ../test/TestTag*.lua > test_tagX.out
    ../emend -t tagA -t tagX ../test/TestTag*.lua > test_tagA_tagX.out
    ../emend -t tagB -t tagX ../test/TestTag*.lua > test_tagB_tagX.out
    ../emend -t tagC -t tagX ../test/TestTag*.lua > test_tagC_tagX.out

    ../emend -t tagA -t tagB -t tagX ../test/TestTag*.lua > test_tagA_tagB_tagX.out
    ../emend -t tagA -t tagC -t tagX ../test/TestTag*.lua > test_tagA_tagC_tagX.out
    ../emend -t tagB -t tagC -t tagX ../test/TestTag*.lua > test_tagB_tagC_tagX.out
}



# Test Emender's ability to support different output formats
function runTestsWithSpecificOutput {
    ../emend -o test_output_format_txt.txt ../test/Test1.lua
    mv test_output_format_txt.txt test_output_format_txt.out

    ../emend -o test_output_format_xml.xml ../test/Test1.lua
    mv test_output_format_xml.xml test_output_format_xml.out

    ../emend -o test_output_format_junit.junit ../test/Test1.lua
    mv test_output_format_junit.junit test_output_format_junit.out

    ../emend -o test_output_format_junit2.junit ../test/Test[12].lua
    mv test_output_format_junit2.junit test_output_format_junit2.out

    ../emend -o test_output_format_json.json ../test/Test1.lua
    mv test_output_format_json.json test_output_format_json.out

    ../emend -o test_output_format_json2.json ../test/Test[12].lua
    mv test_output_format_json2.json test_output_format_json2.out

    ../emend -o test_output_format_html.html ../test/Test1.lua
    mv test_output_format_html.html test_output_format_html.out

    # we don't want 'random' data in output format
    sed -i 's/name="date" content=".*"/name="date" content=""/' test_output_format_html.out
    sed -i 's/Last built: ... ... [ 0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] 2[0-9][0-9][0-9]/Last built: Tue Jun 14 11:22:33 2016/' test_output_format_html.out

    ../emend -o test_output_format_txt_2.txt -o test_output_format_xml_2.xml ../test/Test1.lua
    mv test_output_format_txt_2.txt test_output_format_txt_2.out
    mv test_output_format_xml_2.xml test_output_format_xml_2.out

    ../emend -o test_output_format_txt_3.txt -o test_output_format_html_3.html ../test/Test1.lua
    mv test_output_format_txt_3.txt test_output_format_txt_3.out
    mv test_output_format_html_3.html test_output_format_html_3.out
    # we don't want 'random' data in output format
    sed -i 's/name="date" content=".*"/name="date" content=""/' test_output_format_html_3.out
    sed -i 's/Last built: ... ... [ 0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] 2[0-9][0-9][0-9]/Last built: Tue Jun 14 11:22:33 2016/' test_output_format_html_3.out

    ../emend -o test_output_format_xml_4.xml -o test_output_format_html_4.html ../test/Test1.lua
    mv test_output_format_xml_4.xml test_output_format_xml_4.out
    mv test_output_format_html_4.html test_output_format_html_4.out
    # we don't want 'random' data in output format
    sed -i 's/name="date" content=".*"/name="date" content=""/' test_output_format_html_4.out
    sed -i 's/Last built: ... ... [ 0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] 2[0-9][0-9][0-9]/Last built: Tue Jun 14 11:22:33 2016/' test_output_format_html_4.out
}



# Test Emender's ability to generate documentation
function runGenDocTests {
    ../emend -G -o doc.txt > gendoc_1.out
    rm doc.txt
    ../emend --gendoc -o doc.txt > gendoc_2.out
    rm doc.txt
    ../emend -G -o doc.html > gendoc_3.out
    rm doc.html
    ../emend --gendoc -o doc.html > gendoc_4.out
    rm doc.html
    ../emend -o test_test_documentation.html ../test/TestDocComments.lua
    mv test_test_documentation.html test_test_documentation.out

    sed -i 's/name="date" content=".*"/name="date" content=""/' test_test_documentation.out
    sed -i 's/Last built: ... ... [ 0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] 2[0-9][0-9][0-9]/Last built: Tue Jun 14 11:22:33 2016/' test_test_documentation.out
}



# Test Emender's ability to use yap() function
function runDebugTests {
    ../emend ../test/TestDebug.lua > test_debug_1.out
    ../emend -D ../test/TestDebug.lua > test_debug_2.out
    ../emend --debug ../test/TestDebug.lua > test_debug_3.out
}



# Run all tests
function runAllTests {
    runTestsForBasicCLI
    runTestsWithBadCLIOptions
    runTestsWithUnknownCLIOptions
    runTestsWithBadOutputFormat
    runTestExamples
    runTestsForFileOperations
    runTestsModules
    runTestsForAssertions
    runOtherTests
    runTestReturnValuePositive
    runTestReturnValueNegative
    runTestsWithTags
    runTestsWithSpecificOutput
    runGenDocTests
    runDebugTests
}



# Prepare log file containing all error messages
function prepareErrorFile {
    echo -n "" > errors.txt
}



function writeJUnitHeader {
    echo "<testsuites>" > results.xml
    echo "    <testsuite name=\"Emender selftests\">" >> results.xml
}

function writeJUnitFooter {
    echo "    </testsuite>" >> results.xml
    echo "</testsuites>" >> results.xml
}

function markTestFailure {
    echo "        <testcase name=\"$1\" classname=\"$1\">" >> results.xml
    echo "            <error message=\"$2\">$2</error>" >> results.xml
    echo "        </testcase>" >> results.xml
}

function markTestPass {
    echo "        <testcase name=\"$1\" classname=\"$1\" />" >> results.xml
}

# Compare Emender output with the expected results
function compareResults {
    # loop over all .in files with expected results
    for expected_file_name in *.in
    do
        # get only basename (without extension suffix and/or directory prefix)
        filename=$(basename "${expected_file_name}")
        filename="${filename%.*}"
        diff -u ${expected_file_name} ${filename}.out > ${filename}.diff
        # check the diff output
        if [[ $? != 0 ]]
        then
            echo ${filename} >> errors.txt
            let fail_cnt=fail_cnt+1
            echo "[ FAIL ]   ${filename}"
            # Output into results.xml
            markTestFailure ${filename} "Diff is stored in the file ${filename}.diff"
        else
            let pass_cnt=pass_cnt+1
            echo "[ PASS ]   ${filename}"
            # Output into results.xml
            markTestPass ${filename}
        fi
        let test_cnt=test_cnt+1
    done
}



# Print self check summary
function printSummary {
    echo
    echo "Passed: ${pass_cnt}"
    echo "Failed: ${fail_cnt}"
    echo "Total:  ${test_cnt}"
    echo "YVALUE=${test_cnt}" >> all_tests.property
    echo "YVALUE=${pass_cnt}" >> passed_tests.property
    echo "YVALUE=${fail_cnt}" >> failed_tests.property
}



# Run selfcheck
function run {
    prepareErrorFile
    runAllTests
    writeJUnitHeader
    compareResults
    writeJUnitFooter
    printSummary
}

run

# Only zero test failures means OK!
exit ${fail_cnt}

