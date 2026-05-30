/**
 * This function will return whether or not the first argument equates to any of the later arguments.
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
