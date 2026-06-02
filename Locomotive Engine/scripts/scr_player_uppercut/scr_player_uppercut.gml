/// @ignore
function StatePlayerUppercutCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_set(spr_uppercut, 0);
    
    movespeed = 4;
    accel = 0.5;
    
    vsp = (grounded) ? -14 : -10;
    
    instakillmove = true;
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.Start();
}

/// @ignore
function StatePlayerUppercutStep()
{
    PlayerDoInstakill();
    destroy_blocks(x, y - 50, [obj_block_metal, obj_block_metal_tiles]);
    
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = approach(hsp, movespeed * dir, accel);
    
    if (animation_end())
        image_speed = 0;
    
    if (vsp > 0)
        mach_afterimage_timer.Stop();
    
    if (!grounded)
        return;
    
    SmcSetState("Normal");
    return;
}

/// @ignore
function StatePlayerUppercutDestroy()
{
    instakillmove = false;
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.Stop();
    
    image_speed = 1;
}