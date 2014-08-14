function report_error(message)
    print(message)
end

function report_error_in_test_structure(message)
    error(message)
end

function is_true(expression, description)
    if expression == nil then
        report_error_in_test_structure("Expression is not specified!")
    end
    if description == nil then
        report_error_in_test_structure("Description is not specified!")
    end
    if not expression then
        report_error(description)
    end
end

function is_not_true(expression, description)
    if expression == nil then
        report_error_in_test_structure("Expression is not specified!")
    end
    if description == nil then
        report_error_in_test_structure("Description is not specified!")
    end
    if expression then
        report_error(description)
    end
end

