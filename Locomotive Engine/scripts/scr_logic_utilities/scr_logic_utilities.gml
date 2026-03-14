/**
 * This function will return whether or not the given value is equal to any of the other provided values.
 * @parameter {Any} value The value to check if it equals to anything.
 * @parameter {Array<Any>} values The values to go trough.
 * @pure
 * @returns {Bool}
 */
function equals_to_any(value, values)
{
    return (array_get_index(values, value) != -1);
}


/**
 * This function will pause the current code for the specified amount of miliseconds.
 * @parameter {Real} ms For how long to pause the current code in miliseconds.
 * @returns {Real}
 */
function sleep(ms)
{
    var time = current_time;
    
    do
    {
        
    }
    until ((current_time - time) >= round(ms));
    
    return current_time - time;
}
