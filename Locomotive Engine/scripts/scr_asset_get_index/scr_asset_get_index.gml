global.asset_map = ds_map_create();

/**
 * This function gets the handle for a game asset from its name and cache all the names to get the handle faster.
 * If the asset is not found, the function will return undefined, otherwise it will return the handle for the asset being checked.
 * @parameter {String} name The name of the game asset to get the handle of (a string).
 * @parameter {Constant.AssetType} asset_type The type of the asset to get the handle of.
 */
function asset_get_index_fast(name, asset_type)
{
    if (!is_string(name))
        return name;
    
    if (is_undefined(global.asset_map[? asset_type])) // Aw shucks....
    {
        ds_map_set(global.asset_map, asset_type, {});
        
        var asset_ids = asset_get_ids(asset_type);
        var asset_count = array_length(asset_ids);
        var asset_index = asset_get_index(name);
        
        var i = 0;
        
        repeat (asset_count)
        {
            if (asset_ids[i] == asset_index)
                global.asset_map[? asset_type][$ name] = asset_index;
            
            i++;
        }
    }
    
    return global.asset_map[? asset_type][$ name];
}