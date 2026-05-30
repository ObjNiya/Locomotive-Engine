if (room != target_room)
    exit;

var spawn_x = undefined;
var spawn_y = undefined;

with (target_spawn)
{
    spawn_x = x;
    spawn_y = y;
}

if (is_undefined(spawn_x) || spawn_x == undefined || is_undefined(spawn_y) || spawn_y == undefined)
{
    Log(obj_room_goto, LOG_TYPES.WARNING, "The target spawn is: ", target_spawn, ", which does not exist in this room. Cancelling out of the function early...");
    exit;
}

var spawn_spr = (sprite_exists(target_spawn.mask_index)) ? target_spawn.mask_index : target_spawn.sprite_index;

with (obj_player)
{
    var plyr_left_x = sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);
    spawn_x += plyr_left_x;
    
    if (other.spawn_xalign == SPAWN_XALIGN.RIGHT || other.spawn_xalign == SPAWN_XALIGN.CENTER)
    { 
        var plyr_bbox_width = sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index);
        var spawn_right_diff = plyr_bbox_width - sprite_get_width(spawn_spr);
        
        spawn_x -= (other.spawn_xalign == SPAWN_XALIGN.CENTER) ? spawn_right_diff / 2 : spawn_right_diff + 1;
    }
    
    spawn_x += other.spawn_xoffset;
    
    xstart = spawn_x;
    x = spawn_x;
    
    var plyr_top_y = sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index);
    spawn_y += plyr_top_y;
    
    if (other.spawn_yalign == SPAWN_YALIGN.BOTTOM || other.spawn_yalign == SPAWN_YALIGN.MIDDLE)
    {
        var plyr_bbox_height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
        var spawn_bottom_diff = plyr_bbox_height - sprite_get_height(spawn_spr);
        
        spawn_y -= (other.spawn_yalign == SPAWN_YALIGN.MIDDLE) ? spawn_bottom_diff / 2 : spawn_bottom_diff + 1;
    }
    
    spawn_y += other.spawn_yoffset;
    
    ystart = spawn_y;
    y = spawn_y;
}