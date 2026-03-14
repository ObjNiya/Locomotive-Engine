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
    var argument_array = [];
    for (var i = 0; i < argument_count; i++)
        array_push(argument_array, argument[i])
    
    show_debug_message(string_concat_ext(argument_array));
}

#macro LOG_LEVEL 2

enum LOG_LEVELS
{
    INFO = 0,
    WARN = 1,
    ERROR = 2,
}

function log(source, level, txt)
{
    if (level > LOG_LEVEL)
        return;
    
    var log_name = "INFO";
    if (level == LOG_LEVELS.WARN)
        log_name = "WARN"
    if (level == LOG_LEVELS.ERROR)
        log_name = "ERROR"
    
    if (is_method(source))
        source = script_get_name(source);
    
    var prefix = string_concat("[", source, " - ", log_name, "] ");
    txt = string_concat_ext(txt);
    
    show_debug_message(prefix + txt);
}