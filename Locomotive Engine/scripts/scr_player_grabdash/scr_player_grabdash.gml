/// @ignore
function state_player_grabdash_start()
{
    grabdash_airborne = !grounded;
    
    acceleration = 0.5;
    
    if (dir == 0)
        dir = image_xscale;
    
    if (movespeed < 10 && grounded)
        movespeed = max(movespeed, 10);
    
    hsp = movespeed * dir;
    image_xscale = dir;
    
    damage = 0;
    attacking = true;
    strength = 2;
    
    image_speed = 1;
    
    sprite_index_set(spr_grabdash_intro, 0);
    
    sound_instance_start(snd_grabdash);
    blur_afterimage_timer.start();
    create_particle(x, y + 45, obj_burst_cloud_particle);
}

/// @ignore
function state_player_grabdash_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));

    if (movespeed < 10)
        movespeed += acceleration;
    
    hsp = movespeed * dir;
    
    if (PLAYER_JUMP)
    {
        player_setup_longjump();
        return;
    }
    
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
            sprite_index_set(spr_grabdash_cancel, 0);
            sound_instance_one_shot(sfx_player_grab_cancel, x, y);
        }
        
        return;
    }
    
    if (PLAYER_HIT_WALL)
    {
        player_setup_grabdash_bump();
        return;
    }
    
    /*var grab_target = grab_enemy();
    
    if (instance_exists(grab_target))
    {
        grabbed_instance_id = grab_target;
        smc_set_state(state_player_normal);
        return;
    }*/
    
    animation_end_ext((sprite_index == spr_grabdash_intro), spr_grabdash);
    animation_end_ext((sprite_index == spr_grabdash && grounded), spr_grabdash_end);
    
    if (grabdash_airborne && grounded && sprite_index == spr_grabdash)
        sprite_index_set(spr_grabdash_end, 0);
    
    if (grounded && movespeed > 5)
        create_particle_repeating(x, y + 45, obj_slide_cloud_particle);
}

/// @ignore
function state_player_grabdash_end()
{
    damage = 1;
    attacking = false;
    strength = 1;
    
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