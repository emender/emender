-- Common file I/O operations used elsewhere in the Emender.



--
-- Writes string into the text file.
--
-- Returns true if everything is ok, nil instead.
--
function spit(fileName, content)
    local fout = io.open(fileName, "w")

    -- if file could be opened
    if fout then
        fout:write(content)

        -- check if file could be closed
        if not fout:close() then
            return nil
        end

        return true
    end
    return nil
end



--
-- Writes table of strings into the text file.
--
-- Returns true if everything is ok, nil instead.
--
function spitTable(fileName, content)
    local fout = io.open(fileName, "w")

    -- if file could be opened
    if fout then
        for _, line in ipairs(content) do
            fout:write(line)
            fout:write("\n")
        end

        -- check if file could be closed
        if not fout:close() then
            return nil
        end

        return true
    end
    return nil
end



--
-- Reads whole (presumably text) file into the string.
--
-- Returns string read from the file, or nil in case of any I/O error.
--
function slurp(fileName)
    local fin = io.open(fileName, "r")
    local content = fin:read("*all")

    -- check if file could be closed
    if not fin:close() then
        return nil
    end

    return content
end



--
-- Reads whole (presumably text) file into the table where
-- each item represents one line in the file that was read.
--
-- Returns table of strings read from the file, or nil
-- in case of any I/O error.
--
function slurpTable(fileName)
    local content = {}
    local fin = io.open(fileName, "r")

    -- open failure
    if not fin then
        return nil
    end

    -- read the file content line-by-line
    -- and store it in the table
    for line in fin:lines() do
        table.insert(content, line);
    end

    -- check if file could be closed
    if not fin:close() then
        return nil
    end

    return content
end

