/// @ignore
function StatePlayerRollingJumpCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    movespeed = max(movespeed, 12);
    
    grav = 1;
    vsp = (grounded) ? -6 : max(vsp, 6);
    
    sprite_index = spr_rolling_jump;
    mask_index = spr_crouchmask;
    
    blur_afterimage_timer.Start();
    instakillmove = true;
}

/// @ignore
function StatePlayerRollingJumpStep()
{
    PlayerDoInstakill();
    destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
    
    if (PlayerHitWall())
    {
        mach_afterimage_use_alpha = false;
        mach_afterimage_timer.Start();
        
        image_xscale *= -1;
        dir *= -1;
    }
    
    hsp = movespeed * dir;
    
    if (!grounded)
        return;
    
    SmcSetState((hsp == 0)  ? "Normal" : "Machroll");
}

/// @ignore
function StatePlayerRollingJumpDestroy()
{
    mask_index = spr_player_mask;
    
    grav = 0.5;
    
    instakillmove = false;
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.Stop();
    blur_afterimage_timer.Stop();
}