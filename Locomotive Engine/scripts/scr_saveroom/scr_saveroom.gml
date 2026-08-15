#macro DESTROY_SAVEROOM if (SaveroomCheck()) instance_destroy(id, false)

global.saveroom = ds_map_create();

/**
 * Adds the given instance or every instance of the given object to the Saveroom map.
 * @parameter {Id.Instance|Asset.GMObject} instance_or_object (OPTIONAL) Which instance or object to add to the Saveroom map. If it's an object, every current instance will be added. Default is the current instance.
 * @parameter {Struct} properties (OPTIONAL) A struct of your own properties to give to the instance or object being added to the Saveroom map. Default are none.
 */
function SaveroomAdd(instance_or_object = id, properties = {})
{
    if (asset_get_type(instance_or_object) == asset_object)
    {
        var obj = instance_or_object;
        var ins_count = instance_number(obj);
        var i = 0;
        
        repeat (ins_count)
        {
            var instance = instance_find(obj, i);
            SaveroomAdd(instance, properties);
            
            i++;
        }
        
        return;
    }
    
    ds_map_add(global.saveroom, instance_or_object, properties);
}


/**
 * Checks if the given instance or any instance of the given object exists on the Saveroom map.
 * @parameter {Id.Instance|Asset.GMObject} instance_or_object (OPTIONAL) Which instance or object to check for. If it's an object, it will check if any of the current instances of that object are on the Saveroom map. Default is the current instance.
 */
function SaveroomCheck(instance_or_object = id)
{
    if (asset_get_type(instance_or_object) == asset_object)
    {
        var obj = instance_or_object;
        var ins_count = instance_number(obj);
        var i = 0;
        var any_found = false;
        
        repeat (ins_count)
        {
            var instance = instance_find(obj, i);
            if (SaveroomCheck(instance))
                any_found = true;
            
            i++;
        }
        
        return true;
    }
    
    return !is_undefined(global.saveroom[? instance_or_object]);
}


/**
 * Deletes the given instance or every instance of the given object from the Saveroom map.
 * @parameter {Id.Instance|Asset.GMObject} instance_or_object (OPTIONAL) Which instance or object to delete from the Saveroom map. If it's an object, every instance of that object already stored on the Saveroom map will be deleted from the Saveroom map. Default is the current instance.
 * @parameter {Function|Real} filter (OPTIONAL) A custom filter you can define, or -1 to apply no filter. Should return a Boolean that dictates if the instance or object will be deleted from the Saveroom map.
 */
function SaveroomDelete(instance_or_object = id, filter = -1)
{
    if (asset_get_type(instance_or_object) == asset_object)
    {
        var obj = instance_or_object;
        var ins_count = instance_number(obj);
        var i = 0;
        var deleted_any = false;
        
        repeat (ins_count)
        {
            var instance = instance_find(obj, i);
            if (SaveroomDelete(instance, filter))
                deleted_any = true;
            
            i++;
        }
        
        return deleted_any;
    }
    
    var instance = instance_or_object;
    
    if (filter != -1 && filter(global.saveroom[? instance]))
        return false;
    
    ds_map_delete(global.saveroom, instance);
    return true;
}


/**
 * Deletes every instance from the Saveroom map if the given filter returns true.
 * @parameter {Function|Real} filter (OPTIONAL) A custom filter you can define, or -1 to apply no filter. Should return a Boolean that dictates if an instance will be deleted from the Saveroom map.
 */
function SaveroomDestroy(filter = -1)
{
    if (filter == -1)
    {
        ds_map_destroy(global.saveroom);
        global.saveroom = ds_map_create();
    }
    
    var saveroom_size = ds_map_size(global.saveroom);
    var saveroom_key = ds_map_find_first(global.saveroom);
    
    repeat (saveroom_size)
    {
        SaveroomDelete(saveroom_key, filter);
        saveroom_key = ds_map_find_next(global.saveroom, saveroom_key);
    }
}