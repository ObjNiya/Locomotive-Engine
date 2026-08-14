event_inherited();

GetSpawnOffset = function(player)
{
    var x_offset = player.bbox_left - bbox_left;
    var y_offset = -78;
    if (sign(image_yscale) == -1)
        y_offset = 64;
    
    return [x_offset, y_offset];
}