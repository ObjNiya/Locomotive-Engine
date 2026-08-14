if (room != global.targetRoom)
    exit;

var spawn_x = undefined;
var spawn_y = undefined;

with (global.targetSpawn)
{
    spawn_x = x;
    spawn_y = y;
}

if (is_undefined(spawn_x) || spawn_x == undefined || is_undefined(spawn_y) || spawn_y == undefined)
{
    Log(obj_room_goto, LOG_TYPES.WARNING, "The target spawn is: ", global.targetSpawn, ", which does not exist in this room. Cancelling out of the function early...");
    exit;
}

var spawn_spr = (sprite_exists(global.targetSpawn.mask_index)) ? global.targetSpawn.mask_index : global.targetSpawn.sprite_index;

with (obj_player)
{
    var plyr_left_x = sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);
    spawn_x += plyr_left_x;
    
    if (other.spawnXAlign == fa_right || other.spawnXAlign == fa_center)
    { 
        var plyr_bbox_width = sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index);
        var spawn_right_diff = plyr_bbox_width - sprite_get_width(spawn_spr);
        
        spawn_x -= (other.spawnXAlign == fa_center) ? spawn_right_diff / 2 : spawn_right_diff + 1;
    }
    
    spawn_x += other.spawnXOffset;
    
    xstart = spawn_x;
    x = spawn_x;
    
    var plyr_top_y = sprite_get_yoffset(mask_index) - sprite_get_bbox_top(mask_index);
    spawn_y += plyr_top_y;
    
    if (other.spawnYAlign == fa_bottom || other.spawnYAlign == fa_middle)
    {
        var plyr_bbox_height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
        var spawn_bottom_diff = plyr_bbox_height - sprite_get_height(spawn_spr);
        
        spawn_y -= (other.spawnYAlign == fa_middle) ? spawn_bottom_diff / 2 : spawn_bottom_diff + 1;
    }
    
    spawn_y += other.spawnYOffset;
    
    ystart = spawn_y;
    y = spawn_y;
}