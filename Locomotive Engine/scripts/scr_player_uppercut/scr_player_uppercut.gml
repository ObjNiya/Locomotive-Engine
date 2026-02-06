/// @ignore
function state_player_uppercut_start()
{
    sprite_index_set(spr_uppercut, 0);
    
    movespeed = 8;
    acceleration = 0.5;
    
    if (abs(hsp) > 18)
        hsp = 18 * dir;
    
    vsp = jump_height * 1.5;
    
    sound_instance_one_shot(sfx_player_uppercut, x, y);
    instance_create(x, y + 45, obj_jump_particle);
    
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.start();
}

/// @ignore
function state_player_uppercut_step()
{
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (dir != sign(hsp) || abs(hsp) < movespeed)
        hsp = approach(hsp, movespeed * dir, acceleration);
    
    if (animation_end())
        image_speed = 0;
    
    if (vsp > 0)
        mach_afterimage_timer.stop();
    
    if (!grounded)
        return;
    
    state_machine_set_state(state_player_normal());
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
 * This function will return an array of the player uppercut state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_uppercut()
{
    return [state_player_uppercut_start, state_player_uppercut_step, state_player_uppercut_end];
}