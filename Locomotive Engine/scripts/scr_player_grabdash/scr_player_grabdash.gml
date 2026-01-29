/// @ignore
function state_player_grabdash_start()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    grabdash_airborne = !grounded;
    
    if (movespeed < 10 || sign_input_x == -dir || dir == 0)
    {
        if (sign_input_x != 0)
            dir = sign_input_x;
        else if (dir == 0)
            dir = sign(image_xscale);
        
        if (grounded)
            movespeed = max(movespeed, 10);
        
        hsp = movespeed * dir;
    }
    
    image_xscale = dir;
    image_speed = 1;
    
    sprite_index_set(spr_grabdash_intro, 0);
    
    blur_afterimage_timer.start();
    create_particle(x, y + 45, obj_burst_cloud_particle);
}

/// @ignore
function state_player_grabdash_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var acceleration = 0.5;
    
    if (movespeed < 10)
        movespeed += acceleration;
    
    hsp = movespeed * dir;
    
    if (player_check_can_jump())
    {
        player_setup_longjump();
        return;
    }
    
    if (player_check_can_wallclimb())
    {
        wallclimb_grab_buffer = 10;
        state_machine_set_state(state_player_wallclimb());
        
        return;
    }
    
    if (player_check_can_crouch())
    {
        state_machine_set_state(state_player_backslide());
        return;
    }
    
    if (sign_input_x == -dir || (sprite_index == spr_grabdash_end && animation_end()))
    {
        state_machine_set_state(state_player_normal());
        if (!grounded && sign_input_x == -dir)
            sprite_index_set(spr_grabdash_cancel, 0);
        
        return;
    }
    
    if (player_check_hit_wall())
    {
        player_setup_grabdash_bump();
        return;
    }
    
    /*var grab_target = grab_enemy();
    
    if (instance_exists(grab_target))
    {
        grabbed_instance_id = grab_target;
        state_machine_set_state(state_player_normal());
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
    blur_afterimage_timer.stop();
}

/**
 * This function will return an array of the player's grabdash state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_grabdash()
{
    return [state_player_grabdash_start, state_player_grabdash_step, state_player_grabdash_end];
}