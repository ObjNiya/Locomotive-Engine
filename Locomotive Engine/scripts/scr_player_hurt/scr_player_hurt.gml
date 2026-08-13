/// @ignore
function StatePlayerHurtCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    if (sprite_index != spr_back_hurt)
        sprite_index = spr_hurt;
    
    movespeed = -8;
    vsp = -14;
    
    sound_instance_one_shot(sfx_player_hurt, x, y);
    FlashEffectSet();
}

/// @ignore
function StatePlayerHurtStep()
{
    hsp = movespeed * dir;
    
    if (place_meeting_collision(x + hsp, y))
        movespeed = 0;
    
    if (!grounded || vsp < 0)
        return;
    
    invincibleBuffer = 80;
    hurtFlickerTimer.SetRepeating(false, true);
    hurtFlickerTimer.Start();
    
    SmcSetState("Normal");
    sprite_set(spr_land, 0);
}