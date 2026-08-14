if (!active || sprite_index != spr_secretegg_spawn)
    exit;

with (obj_player)
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vertMovespeed = 0;
    
    x = other.x;
    y = other.y;
    
    visible = false;
}

if (!AnimationEnd())
    exit;

with (obj_player)
{
    SmcSetState("Groundpound");
    SpriteSet(spr_groundpound_intro, 0);
    
    visualXScale = 1;
    visualYScale = 1;
    
    vsp = -5;
    visible = true;
}

sprite_index = spr_null;