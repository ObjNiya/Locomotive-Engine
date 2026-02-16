event_inherited();

spawn_alignment = [SPAWN_XALIGN.LEFT, SPAWN_YALIGN.TOP];

set_spawn_offset = function(player)
{
    var plyr_left_x = (sprite_get_bbox_right(player.mask_index) - sprite_get_bbox_left(player.mask_index)) / 2;
    plyr_left_x = ceil(plyr_left_x);
    
    var bbox_left_diff = player.bbox_left - bbox_left;
    var x_offset = plyr_left_x + bbox_left_diff;
    
    if (sign(image_yscale) > 0)
        y_offset = -78
    else
        y_offset = 64;
    
    add_spawn_offset(x_offset, y_offset);
}