// TODO: The Cutoffs

/**
 * Destroys tiles on the given layers in the given area.
 * @parameter {Array<String>|Array<Id.Layer>} target_layers The names or IDs of the layers to destroy tiles on.
 * @parameter {Real} x1 The x coordinate of the top left corner of the area to destroy tiles in.
 * @parameter {Real} y1 The y coordinate of the top left corner of the area to destroy tiles in.
 * @parameter {Real} x2 The x coordinate of the bottom right corner of the area to destroy tiles in.
 * @parameter {Real} y2 The y coordinate of the bottom right corner of the area to destroy tiles in.
 * @parameter {Real} tile_size (OPTIONAL) The size of one tile on the given tile layers. Default is 32.
 */
function TilesDestroyArea(target_layers, x1, y1, x2, y2, tile_size = 32)
{
    if (string_lower(target_layers[0]) == "all")
        target_layers = layer_get_all();
    
    if (x2 < x1)
        x2 += x1;
    if (y2 < y1)
        y2 += y1;
    
    var x_start = x1;
    var y_start = y1;
    
    var layer_count = array_length(target_layers);
    var i = 0;
    
    repeat (layer_count)
    {
        var tilemap = layer_tilemap_get_id(target_layers[i]);
        if (tilemap == -1)
        {
            i++;
            continue;
        }
        
        for (; x1 < x2 && y1 < y2; x1 += tile_size)
        {
            var tile = tilemap_get_at_pixel(tilemap, x1, y1);
            if (tile == -1)
                continue;
            
            tile = tile_set_empty(tile);
            tilemap_set_at_pixel(tilemap, tile, x1, y1);
            
            if (x1 + tile_size >= x2) 
            {
                x1 = x_start - tile_size;
                y1 += tile_size;
            }
        }
        
        x1 = x_start;
        y1 = y_start;
        
        i++;
    }
}