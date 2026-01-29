/**
 * This function will take every argument passed into it, turn it into a string and then print it to the output if the game was compiled with the compile config set to ```Debug```.
 */
function trace()
{
    if (!DEBUG_MODE)
        return;
    
    var output_string = "";
    
    for (var i = 0; i < argument_count; i++)
        output_string += string(argument[i]);
    
    show_debug_message(output_string);
}