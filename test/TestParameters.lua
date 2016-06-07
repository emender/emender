-- TestParameters.lua - check that parameters could be passed to test
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

TestParameters = {
    -- required field
    metadata = {
        description = "Check that parameters could be passed to test",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-11-24",
        tags = {"BasicTest", "SmokeTest"},
    },
}

function TestParameters.testParam1()
    is_not_nil(TestParameters.param1, "Check that param1 is not nil") 
    if TestParameters.param1 then
        is_equal(TestParameters.param1, "42", "Check that param1=='42'") 
    end
end

function TestParameters.testParam2()
    is_not_nil(TestParameters.param2, "Check that param2 is not nil") 
    if TestParameters.param2 then
        is_equal(TestParameters.param2, "unknown", "Check that param1=='unknown'") 
    end
end

function TestParameters.testParameterNamedDictionary()
    is_not_nil(TestParameters.dictionary, "Check that parameter dictionary is not nil") 
    if TestParameters.dictionary then
        is_equal(TestParameters.dictionary, "http://url.to.dictionary/zg", "Check that dictionary=='http://url.to.dictionary/zg'") 
    end
end

