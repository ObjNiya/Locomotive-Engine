/// @description This function checks if the given variable is equal to any of the provided values.
/// @arg {Any} variable The variable to check.
/// @arg {Array<Any>} values The values to be compared.
/// @returns Bool Whether or not the variable is equal to any of the provided values.
function equals_to_either(variable, values)
{
    var value_count = array_length(values);
    
    for (var i = 0; i < value_count; i++)
    {
        if (variable == values[i])
            return true;
    }
    
    return false;
}

function instance_create(x, y, obj, var_struct = {})
{
    return instance_create_layer(x, y, "Instances_1", obj, var_struct);
}

function scr_sleep(arg0)
{
    var time = current_time;
    var ms = arg0;
    
    do
    {
    }
    until ((current_time - time) >= round(ms));
    
    return current_time - time;
}
