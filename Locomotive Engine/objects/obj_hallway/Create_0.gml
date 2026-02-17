transitioned = false;

spawn_xalign = SPAWN_XALIGN.CENTER;
spawn_yalign = SPAWN_YALIGN.BOTTOM;

get_spawn_offset = function(player)
{
    var x_offset = 100 * sign(image_xscale);
    var y_offset = player.bbox_bottom - bbox_bottom;
    
    return [x_offset, y_offset];
}