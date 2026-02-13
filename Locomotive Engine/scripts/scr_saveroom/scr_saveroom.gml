/**
 * This function will add the given instance to the save room map so it is remembered and won't reappear when leaving an entering the room.
 * @parameter {Id.Instance} instance (OPTIONAL) The instance to add to the save room map (defaults to the current instances' id).
 * @parameter {Struct} properties (OPTIONAL) Which properties to assign to the instance on the save room map.
 */
function add_saveroom(instance = id, properties = {})
{
    ds_map_add(global.saveroom, instance, properties);
}

/**
 * This function will check if the given instance is on the save room map, if it is, it will be destroyed.
 * @parameter {type} instance (OPTIONAL) The instance to check for (defaults to the current instances' id).
 * @parameter {Bool} execute_event_flag (OPTIONAL) If he instance is found on the save room map and destroyed, whether or not it should execute it's destroy event.
 */
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

/**
 * This function will completely wipe the save room map, respawning any remembered instances.
 * @parameter {Function} filter Which conditions should be met for the save room map entry to be deleted.
 */
function wipe_saveroom(filter = function(value) { return true })
{
    var map_value = ds_map_find_first(global.saveroom);
    var map_size = ds_map_size(global.saveroom);
    
    for (var i = 0; i < map_size; i++)
    {
        if (filter(map_value))
        {
            trace("Deleting: ", map_value);
            ds_map_delete(global.saveroom, map_value);
        }
        
        map_value = ds_map_find_next(global.saveroom, map_value);
    }
}