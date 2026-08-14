/// @ignore
function StatePlayerRollingJumpCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    movespeed = max(movespeed, 12);
    
    grav = 1;
    vsp = (grounded) ? -6 : max(vsp, 6);
    
    sprite_index = spr_rolling_jump;
    mask_index = spr_crouchmask;
    
    time_source_start(blurAfterimageTimer);
    instakillmove = true;
}

/// @ignore
function StatePlayerRollingJumpStep()
{
    PlayerDoInstakill();
    destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
    
    if (PlayerHitWall())
    {
        machAfterimageUseAlpha = false;
        time_source_start(machAfterimageTimer);

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
    machAfterimageUseAlpha = true;
    
    time_source_stop(machAfterimageTimer);
    time_source_stop(blurAfterimageTimer);
}