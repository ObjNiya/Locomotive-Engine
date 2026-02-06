function add_saveroom(instance = id, properties = {})
{
    ds_map_add(global.saveroom, instance, properties);
}

function check_saveroom(instance = id, execute_event_flag = false)
{
    var is_saved = !is_undefined(ds_map_find_value(global.saveroom, instance));
    
    if (!is_saved)
        return false;
    else
    {
        instance_destroy(instance, execute_event_flag);
        return true;
    }
}

function wipe_saveroom(filter = function(value) { return true })
{
    var map_value = ds_map_find_first(global.saveroom);
    
    while (!is_undefined(map_value))
    {
        if (filter(map_value))
            ds_map_delete(global.saveroom, )
    }
}