// No one shall ever know our secrets,,,,,

enum LOG_TYPES
{
    INFO = 1,
    WARNING = 2,
    ERROR = 3,
}

global.log_type_hidden = ds_map_create();

if (IDE_BUILD)
{
    ds_map_set(global.log_type_hidden, LOG_TYPES.INFO, false);
    ds_map_set(global.log_type_hidden, LOG_TYPES.WARNING, false);
    ds_map_set(global.log_type_hidden, LOG_TYPES.ERROR, false);
}

function log_type_set_hidden(type, hidden)
{
    if (IDE_BUILD)
    {
        global.log_type_hidden[? type] = hidden;
    }
}

function quick_log()
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

function Log()
{
    if (IDE_BUILD)
    {
        var log_type;
        var type = argument[1];
        
        if (global.log_type_hidden[? type])
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