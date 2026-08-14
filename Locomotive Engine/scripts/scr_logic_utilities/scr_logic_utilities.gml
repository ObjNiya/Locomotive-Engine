/**
 * Returns whether or not the first argument is equal to any of the latter ones.
 * @pure
 * @returns {Bool}
 */
function EqualsToAny()
{
    var i = 1;
    
    repeat (argument_count - 1)
    {
        if (argument[0] == argument[i])
            return true;
        
        i++;
    }
    
    return false;
}


/**
 * Pauses code execution for the current script.
 * @parameter {Real} ms For how long to pause the current code in miliseconds.
 * @returns {Real}
 */
function Sleep(ms)
{
    var time = current_time;
    
    do
    {
        
    }
    until ((current_time - time) >= round(ms));
    
    return current_time - time;
}
