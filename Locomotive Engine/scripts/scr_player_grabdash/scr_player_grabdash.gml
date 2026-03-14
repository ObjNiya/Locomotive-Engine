/// @ignore
function state_player_grabdash_start()
{
    grabdash_airborne = !grounded;
    accel = 0.5;
    
    image_speed = 1;
    if (dir == 0)
        dir = image_xscale;
    else
        image_xscale = dir;
    
    if (movespeed < 10 && grounded)
        movespeed = max(movespeed, 10);
    
    sprite_set(spr_grabdash_intro, 0);
    sound_instance_start(snd_grabdash);
    blur_afterimage_timer.start();
}

/// @ignore
function state_player_grabdash_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));

    if (movespeed < 10)
        movespeed += accel;
    
    hsp = movespeed * dir;
    
    destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
    
    if (player_do_longjump())
        return;
    
    if (PLAYER_WALLCLIMB)
    {
        wallclimb_grab_buffer = 10;
        smc_set_state(state_player_wallclimb);
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        smc_set_state(state_player_rolling_jump);
        return;
    }
    
    if (sign_input_x == -dir || (sprite_index == spr_grabdash_end && animation_end()))
    {
        smc_set_state(state_player_normal);
        if (!grounded && sign_input_x == -dir)
        {
            sprite_set(spr_grabdash_cancel, 0);
            sound_instance_one_shot(sfx_player_grab_cancel, x, y);
        }
        
        return;
    }
    
    if (PLAYER_HIT_WALL)
    {
        smc_set_state(state_player_normal);
        
        sound_instance_one_shot(sfx_player_bump_wall, x, y);
        sound_instance_stop(snd_grabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        
        vsp = -4;
        grounded = false;
        grabdash_bump_buffer = 60;
        
        sprite_index = spr_grabdash_bump;
        return;
    }
    
    animation_end_ext((sprite_index == spr_grabdash_intro), spr_grabdash);
    animation_end_ext((sprite_index == spr_grabdash && grounded), spr_grabdash_end);
    
    if (grabdash_airborne && grounded && sprite_index == spr_grabdash)
        sprite_set(spr_grabdash_end, 0);
    
    if (grounded && movespeed > 5)
        create_particle_repeating(x, y + 45, obj_slide_cloud_particle);
}

/// @ignore
function state_player_grabdash_end()
{
    blur_afterimage_timer.stop();
}

/**
 * This function will return an array of the player's grabdash state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_grabdash()
{
    return [state_player_grabdash_start, state_player_grabdash_step, state_player_grabdash_end];
}