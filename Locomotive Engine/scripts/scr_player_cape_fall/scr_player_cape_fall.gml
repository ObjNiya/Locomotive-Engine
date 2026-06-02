/// @ignore
function StatePlayerCapeFallCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    if (sprite_index != spr_cape_end && sprite_index != spr_cape_fall)
        sprite_set(spr_cape_end, 0);
    
    accel = 0.75;
    mach_afterimage_timer.Start();
}

/// @ignore
function StatePlayerCapeFallStep()
{
    PlayerDoJumpstop();
    
    if (PlayerDoGrabdash())
        return;
    
    if (PlayerDoTaunt())
        return;
    
    if (PlayerWallclimb())
    {
        SmcSetState("Wallclimb");
        return;
    }
    
    animation_end_ext((sprite_index == spr_cape_end), spr_cape_fall);
    
    dir = side(sign(InputX(INPUT_CLUSTER.NAVIGATION)), image_xscale);
    
    if (abs(hsp) < 12 || dir == -sign(hsp))
        hsp += accel * dir;
    
    movespeed = abs(hsp);
    image_xscale = dir;
    
    if (grounded)
    {
        movespeed = max(12, movespeed);
        
        if (PlayerMachrun())
            SmcSetState("Mach");
        else
        {
            SmcSetState("Normal");
            sprite_set(spr_fall, 0);
        }
    }
}

/// @ignore
function StatePlayerCapeFallDestroy()
{
    mach_afterimage_timer.Stop();
}