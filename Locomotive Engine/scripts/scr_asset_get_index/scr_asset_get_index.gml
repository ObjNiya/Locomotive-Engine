global.__assetMap__ = ds_map_create();

/**
 * Returns handle for a game asset from its name.
 * If the asset is not found, the function will return a value of -1, otherwise it will return the handle for the asset being checked.
 * @parameter {String} name The name of the game asset to get the handle of (a string).
 * @parameter {Consant.AssetType} asset_type The type of the game asset to get the handle of.
 */
function AssetGetIndexFast(name, asset_type)
{
    if (!is_string(name))
        return name;
 
    if (is_undefined(global.__assetMap__[? asset_type]))
    {
        ds_map_set(global.__assetMap__, asset_type, {});
        
        var asset_ids = asset_get_ids(asset_type);
        var asset_count = array_length(asset_ids);
        var asset_index = asset_get_index(name);
        
        var i = 0;
        
        repeat (asset_count)
        {
            if (asset_ids[i] == asset_index)
                global.__assetMap__[? asset_type][$ name] = asset_index;
            
            i++;
        }
    }
    
    if (!is_undefined(global.__assetMap__[? asset_type][$ name]))
        return global.__assetMap__[? asset_type][$ name];
    else
        return -1;
}