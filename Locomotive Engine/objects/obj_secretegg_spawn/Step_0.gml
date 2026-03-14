if (!active || sprite_index != spr_secretegg_spawn)
    exit;

with (obj_player)
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vert_movespeed = 0;
    
    x = other.x;
    y = other.y;
    
    visible = false;
}

if (!animation_end())
    exit;

with (obj_player)
{
    smc_set_state(state_player_groundpound);
    sprite_set(spr_groundpound_intro, 0);
    
    visual_xscale = 1;
    visual_yscale = 1;
    
    vsp = -5;
    visible = true;
}

sprite_index = spr_null;