if (target_tiles[0] == "all")
{
    target_tiles = [];
    
    var layers = room_get_info(room, false, false, true, true, false, true).layers;
    var layer_count = array_length(layers);
    var i = 0;

    repeat (layer_count)
    {
        var elements = layers[i].elements;
        var element_count = array_length(elements);
        var j = 0;
        
        repeat (element_count)
        {
            var lay = elements[j];
            if (lay.type == layerelementtype_tilemap)
                array_push(target_tiles, lay.id);
            
            j++;
        }
        
        i++;
    }
}

var tile_lay_count = array_length(target_tiles);

var xx = bbox_left;
var yy = bbox_top;

for (; xx < bbox_right && yy < bbox_bottom; xx += 32) 
{
    var i = 0;

    repeat (tile_lay_count)
    {
        var tile_lay = target_tiles[i];
        if (is_string(tile_lay))
            tile_lay = layer_get_id(tile_lay);
        
        var tile = tilemap_get_at_pixel(tile_lay, xx, yy);
        
        tile = tile_set_empty(tile);
        tilemap_set_at_pixel(tile_lay, tile, xx, yy);
        
        i++;
    }
    
    if (xx + 32 >= bbox_right) 
    {
        xx = bbox_left - 32;
        yy += 32;
    }
}