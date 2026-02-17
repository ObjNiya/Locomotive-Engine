event_inherited();

spawn_xalign = SPAWN_XALIGN.LEFT;
spawn_yalign = SPAWN_YALIGN.TOP;

get_spawn_offset = function(player)
{
    var x_offset = player.bbox_left - bbox_left;
    var y_offset = 64;
    if (sign(image_yscale) == -1)
        y_offset = -78;
    
    return [x_offset, y_offset];
}