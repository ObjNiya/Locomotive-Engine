/// @ignore
function StatePlayerHurtCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_index = spr_hurt;
    
    movespeed = -6;
    vsp = -9;
    
    sound_instance_one_shot(sfx_player_hurt, x, y);
    create_flash_effect(true);
}

/// @ignore
function StatePlayerHurtStep()
{
    hsp = movespeed * dir;
    
    if (grounded)
    {
        SmcSetState("Normal");
        return;
    }
}