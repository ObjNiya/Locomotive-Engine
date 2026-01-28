/*function initialize_asset_get_index_better()
{
    global.asset_map = ds_map_create();
    
    var asset_functions = [
        [object_exists, object_get_name],
        [sprite_exists, sprite_get_name],
        [room_exists, room_get_name],
        [path_exists, path_get_name],
        [script_exists, script_get_name],
        [font_exists, font_get_name],
        [timeline_exists, timeline_get_name]
    ];
    
    for (var i = 0; i < array_length(asset_functions); i++)
    {
        var asset_exists = asset_functions[i][0];
        var asset_get_name = asset_functions[i][1];
        
        for (var j = 0; asset_exists(j); j++)
            ds_map_add(global.asset_map, asset_get_name(j), j);
    }
    
    trace("Finished populating global.asset_map, print: ", string(global.asset_map));
}