/// @ignore
function StatePlayerCapeFallCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    if (sprite_index != spr_cape_end && sprite_index != spr_cape_fall)
        SpriteSet(spr_cape_end, 0);
    
    accel = 0.75;
    time_source_start(machAfterimageTimer);
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
    
    AnimationEndExt((sprite_index == spr_cape_end), spr_cape_fall);
    
    dir = Side(sign(InputX(INPUT_CLUSTER.NAVIGATION)), image_xscale);
    
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
            SpriteSet(spr_fall, 0);
        }
    }
}

/// @ignore
function StatePlayerCapeFallDestroy()
{
    time_source_stop(blurAfterimageTimer);
}