/// @description This function will print the provided arguments to the output if the game was compiled with the ```Debug``` configuration.
function trace()
{
    if (!DEBUG_MODE)
        return;
    
    var output_string = "";
    
    for (var i = 0; i < argument_count; i++)
        output_string += string(argument[i]);
    
    show_debug_message(output_string);
}