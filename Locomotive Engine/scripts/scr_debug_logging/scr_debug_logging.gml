// No one shall ever know our secrets,,,,,

enum LOG_TYPES
{
    INFO = 1,
    WARNING = 2,
    ERROR = 3,
}

global.__LogTypeHidden__ = ds_map_create();

if (IDE_BUILD)
{
    ds_map_set(global.__LogTypeHidden__, LOG_TYPES.INFO, false);
    ds_map_set(global.__LogTypeHidden__, LOG_TYPES.WARNING, false);
    ds_map_set(global.__LogTypeHidden__, LOG_TYPES.ERROR, false);
}


/**
 * Toggles whether or not to log the given log type.
 * @parameter {Real} type Which log type from the ```LOG_TYPES``` enum.
 * @parameter {Bool} hidden Whethe or not to hide the given log type.
 */
function LogTypeSetHidden(type, hidden)
{
    if (IDE_BUILD)
    {
        global.__LogTypeHidden__[? type] = hidden;
    }
}


/**
 * Concatenates every argument into one string, turns non-string arguments into strings and prints the result to the output.
 */
function QuickLog()
{
    if (IDE_BUILD)
    {
        var i = 0;
        var txt = "";
        
        repeat (argument_count)
        {
            txt += string(argument[i]);
            i++;
        }
        
        show_debug_message(txt);
    }
}


/**
 * Prints a detailed log into the output with the given source and log type. 
 * Argument 2 and onward will be concatenated into one string, turns non-string arguments into strings and prints the result to the output alongside the 
 * source of the log and its type.
 * @parameter {Function|Asset.GMObject} source From what function or object the log is coming from.
 * @parameter {Real} type What type of log should be printed.
 */
function Log()
{
    if (IDE_BUILD)
    {
        var log_type;
        var type = argument[1];
        
        if (global.__LogTypeHidden__[? type])
            return;
        
        switch (type)
        {
            case LOG_TYPES.INFO: log_type = "INFO" break;
            case LOG_TYPES.WARNING: log_type = "WARNING" break;
            case LOG_TYPES.ERROR: log_type = "ERROR" break;     
        }
        
        var source = argument[0];
        
        if (object_exists(source))
            source = object_get_name(source);
        else if (script_exists(source))
            source = script_get_name(source);
        
        if (!is_string(source))
            source = "UNKNOWN";
        
        var prefix = source + " - [" + log_type + "] ";
        var txt = "";
        var i = 2;
        
        repeat (argument_count - 2)
        {
            txt += string(argument[i]);
            i++;
        }
        
        show_debug_message(prefix + txt);
    }
}