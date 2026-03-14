/// @ignore
function state_player_uppercut_start()
{
    sprite_set(spr_uppercut, 0);
    
    movespeed = 4;
    accel = 0.5;
    
    vsp = (grounded) ? -14 : -10;
    
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.start();
}

/// @ignore
function state_player_uppercut_step()
{
    hurt_enemy();
    destroy_blocks(x, y - 50, [obj_block_metal, obj_block_metal_tiles]);
    
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = approach(hsp, movespeed * dir, accel);
    
    if (animation_end())
        image_speed = 0;
    
    if (vsp > 0)
        mach_afterimage_timer.stop();
    
    if (!grounded)
        return;
    
    smc_set_state(state_player_normal);
    return;
}

/// @ignore
function state_player_uppercut_end()
{
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.stop();
    
    image_speed = 1;
}

/**
 * This function will return an array of the player uppercut state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_uppercut()
{
    return [state_player_uppercut_start, state_player_uppercut_step, state_player_uppercut_end];
}