if (!instance_exists(player_ins))
    exit;

with (player_ins)
{
    visual_xscale = approach(visual_xscale, 0, 0.01);
    visual_yscale = approach(visual_yscale, 0, 0.01);
    
    if (sign(vsp) == -1 || y < other.ystart || !visible)
        exit;
    
    visible = false;
    
    goto_level(other.level_id);
}