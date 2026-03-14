function destroy_blocks(x, y, excludes = [])
{
    var destroyable_list = ds_list_create();
    instance_place_list(x, y, par_block, destroyable_list, false);
    
    if (ds_list_empty(destroyable_list))
    {
        ds_list_destroy(destroyable_list);
        return false;
    }
    
    var destroyable_count = ds_list_size(destroyable_list);
    for (var i = 0; i < destroyable_count; i++)
    {
        var destroyable = ds_list_find_value(destroyable_list, i);
        
        if (array_get_index(excludes, destroyable.object_index) == -1)
            instance_destroy(destroyable);
    }
    
    ds_list_destroy(destroyable_list);
    return true;
}