if (sprite_index != spr_secretegg_close)
    visible = true;

with (player)
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vert_movespeed = 0;
    
    visual_xscale = approach(visual_xscale, 0, 0.05);
    visual_yscale = approach(visual_yscale, 0, 0.05);
    
    x = other.x;
    y = other.y;
}

if (animation_end() && sprite_index == spr_secretegg_close)
{
    visible = false;
    
    with (player)
        trans_room(obj_roomtrans_fade);
}