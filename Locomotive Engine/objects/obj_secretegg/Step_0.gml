if (sprite_index != spr_secretegg_close)
    visible = true;

with (player)
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vertMovespeed = 0;
    
    visualXScale = Approach(visualXScale, 0, 0.05);
    visualYScale = Approach(visualYScale, 0, 0.05);
    
    x = other.x;
    y = other.y;
}

if (AnimationEnd() && sprite_index == spr_secretegg_close)
{
    visible = false;
    
    with (player)
        RoomTrans(obj_roomtrans_fade);
}