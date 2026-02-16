transitioned = false;
spawn_alignment = [SPAWN_XALIGN.CENTER, SPAWN_YALIGN.BOTTOM];

set_spawn_offset = function(player)
{
    var plyr_bottom_y = player.sprite_yoffset + sprite_get_bbox_bottom(player.mask_index) - player.sprite_height;
    var bbox_bottom_diff = bbox_bottom - player.bbox_bottom;
    var y_offset = -plyr_bottom_y - bbox_bottom_diff - 1;
    
    add_spawn_offset(100 * sign(image_xscale), y_offset);
}