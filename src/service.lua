-- Module with the implementation of REST API service interface.
-- Copyright (C) 2016 Pavel Tisnovsky
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
local service = {
    jobStartedCommand = "job-started",
    jobFinishedCommand = "job-finished",
    jobResultsCommand = "job-results"
}



function service.callCurlWithParams(fullURL, params)
    fullURL = fullURL:gsub(" ", "+")
    local command = [[curl -X POST --header "Content-Type: application/json" ]] .. params .. " " .. fullURL
    os.execute(command)
end



function service.callCurl(fullURL)
    service.callCurlWithParams(fullURL, "")
end



function service.callCurlWithResults(fullURL)
    service.callCurlWithParams(fullURL, "-d '@results.json' ")
end



--
-- Function to call REST API service when job has been started.
--
function service.jobStarted(useService, URL, name)
    if not useService then
       return
    end
    local fullURL = URL .. "/" .. service.jobStartedCommand .. "/" .. name
    service.callCurl(fullURL)
end



--
-- Function to call REST API service when job has been finished.
--
function service.jobFinished(useService, URL, name)
    if not useService then
       return
    end
    local fullURL = URL .. "/" .. service.jobFinishedCommand .. "/" .. name
    service.callCurl(fullURL)
end



--
-- Function to call REST API service when job has been finished.
--
function service.jobResults(useService, URL, name)
    if not useService then
       return
    end
    local fullURL = URL .. "/" .. service.jobResultsCommand .. "/" .. name
    service.callCurlWithResults(fullURL)
end



-- export module
return service

