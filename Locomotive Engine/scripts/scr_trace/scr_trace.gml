/**
 * This function will take every argument passed into it of any type and then show it in The Output Window and The Debug Overlay at runtime.
 */
function trace()
{
    var argument_array = [];
    for (var i = 0; i < argument_count; i++)
        array_push(argument_array, argument[i])
    
    show_debug_message(string_concat_ext(argument_array));
}

/**
 * This function will take run the ```trace``` function **IF** the game is compiled with the ```DEBUG_MODE``` macro set to true.
 */
function dbg_trace()
{
    if (DEBUG_MODE) 
        return;
    
    var argument_array = [];
    for (var i = 0; i < argument_count; i++)
        array_push(argument_array, argument[i])
    
    show_debug_message(string_concat_ext(argument_array));
}