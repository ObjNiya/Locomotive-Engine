// TODO: The Cutoffs

/**
 * Destroys tiles on the given layers in the given area.
 * @parameter {Array<String>|Array<Id.Layer>|Id.Layer|String} target_layer The name(s) or ID(s) of the layer(s) to destroy tiles on.
 * @parameter {Real} x1 The x coordinate of the top left corner of the area to destroy tiles in.
 * @parameter {Real} y1 The y coordinate of the top left corner of the area to destroy tiles in.
 * @parameter {Real} x2 The x coordinate of the bottom right corner of the area to destroy tiles in.
 * @parameter {Real} y2 The y coordinate of the bottom right corner of the area to destroy tiles in.
 * @parameter {Real} tile_size (OPTIONAL) The size of one tile on the given tile layers. Default is 32.
 */
function TilesDestroyArea(target_layer, x1, y1, x2, y2, tile_size = 32)
{
    if (!is_array(target_layer) && string_lower(target_layer) == "all") 
        target_layer = layer_get_all();
        
    if (is_array(target_layer))
    {
        var layer_count = array_length(target_layer);
        var i = 0;
  
        repeat (layer_count)
        {
            TilesDestroyArea(target_layer[i], x1, y1, x2, y2, tile_size);
            i++;
        }
        
        return;
    }
    
    if (x2 < x1)
        x2 += x1;
    if (y2 < y1)
        y2 += y1;

    var cutoff_indicies = [0, 0, 0, 0];

    var x_start = x1;
    var y_start = y1;
    
    var tilemap = layer_tilemap_get_id(target_layer);
    if (tilemap == -1)
        return;
    
    for (; x1 < x2 && y1 < y2; x1 += tile_size)
    {
        var tile = tilemap_get_at_pixel(tilemap, x1, y1);
        if (tile == -1)
            continue;
    
        with (collision_rectangle(x1, y1, x1 + tile_size, y1 + tile_size, obj_cutoff, false, true))
            instance_destroy();
        
        tile = tile_set_empty(tile);
        tilemap_set_at_pixel(tilemap, tile, x1, y1);
        
        if (x1 + tile_size >= x2) 
        {
            x1 = x_start - tile_size;
            y1 += tile_size;
        }
    }
    
    var cutoff_list = ds_list_create();
    
    collision_rectangle_list(x_start - tile_size, y_start, x_start, y2, obj_cutoff, false, true, cutoff_list, false);
    collision_rectangle_list(x2, y_start, x2 + tile_size, y2, obj_cutoff, false, true, cutoff_list, false);
    collision_rectangle_list(x_start, y_start - tile_size, x2, y_start, obj_cutoff, false, true, cutoff_list, false);
    collision_rectangle_list(x_start, y2, x2, y2 + tile_size, obj_cutoff, false, true, cutoff_list, false);
    
    var cutoff_count = ds_list_size(cutoff_list);
    var i = 0;
    
    repeat (cutoff_count)
    {
        cutoff_list[| i].visible = true;
        i++;
    }
    
    ds_list_destroy(cutoff_list);
}