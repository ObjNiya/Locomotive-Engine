/// @ignore
function state_player_normal_start()
{
    dir = sign(hsp);
    movespeed = abs(hsp);
    
    accel = 0.5;
    deccel = 0.1;
    momentum = false;
    
    if (!grounded)
    {
        sprite_index = spr_fall;
        return;
    }
    
    sprite_index = (InputX(INPUT_CLUSTER.NAVIGATION) == 0) ? spr_idle : spr_walk;
}

/// @ignore
function state_player_normal_step()
{
    /////////////////////////////
    // General Logic
    /////////////////////////////
    
    static dance_hold_require = 10; // How many frames of holding taunt should it take to spawn the beatbox?
    static idle_anims = [spr_idle_animation1, spr_idle_animation2]; // Which idle animations may the player randomly play?
    static idle_anims_count = 2; // How many random idle animations are available?
    
    if (player_do_uppercut())
        return;
    if (player_do_grabdash())
    {
        if (!grounded)
            movespeed = 5;
        return;
    }
    if (PLAYER_TAUNT)
    {
        smc_set_state(state_player_taunt);
        return;
    }
    
    if (player_do_ladder())
        return;
    
    var input_x = InputX(INPUT_CLUSTER.NAVIGATION);
    var sign_input_x = sign(input_x);
    var approach_spd = (movespeed > 8) ? deccel : accel;
    
    movespeed = approach(movespeed, (ANALOG_CONTROLS) ? 8 * abs(input_x) : 1 * abs(sign_input_x), approach_spd);
    if (sign_input_x != dir)
    {
        dir = sign_input_x;
        
        if (dir != 0 || FIX_INSTATURN)
            movespeed = 0;
    }
    
    hsp = movespeed * dir;
    if (place_meeting_collision(x + dir, y, Exclude.SLOPES))
        movespeed = 0;
    
    image_xscale = side(dir, image_xscale);
    image_speed = 1;
    
    
    /////////////////////////////
    // Airborne Logic
    /////////////////////////////

    
    if (!grounded)
    {
        if (sign(vsp) == -1)
        {
            if (destroy_blocks(x, y + vsp, [obj_block_metal, obj_block_metal_tiles]))
                vsp = max(0, vsp);
        }
        
        dance_hold_time = 0;
        cloud_particle_timer.Stop();
        blur_afterimage_timer.Stop();
        
        player_do_jumpstop();
        
        if (player_do_groundpound())
            return;
        
        if (equals_to_any(sprite_index, [spr_stomp, spr_stomp_fall]))
        {
            animation_end(spr_stomp_fall);
            return;
        }
        
        var no_fall_spr = (sprite_index == spr_grabdash_bump)
        var fall_spr_on_end = equals_to_any(sprite_index, [spr_jump, spr_grabdash_cancel]);
        
        if ((!fall_spr_on_end || (fall_spr_on_end && animation_end())) && !no_fall_spr)
            sprite_index = spr_fall;
        return;
    }
    
    
    /////////////////////////////
    // General Ground Logic
    /////////////////////////////
    
    
    if (PLAYER_MACHRUN)
    {
        smc_set_state(state_player_mach);
        return;
    }
    
    if (player_do_jump())
        return;
    
    if (PLAYER_CROUCH)
    {
        smc_set_state(state_player_crouch);
        return;
    }
    
    if (InputCheck(INPUT_VERB.TAUNT))
        dance_hold_time++;
    else
        dance_hold_time = 0;
    
    if (dance_hold_time >= dance_hold_require)
    {
        cloud_particle_timer.Stop();
        
        sprite_index = spr_breakdance;
        image_speed = dance_spr_speed;
        dance_spr_speed = approach(dance_spr_speed, 1.25, 0.005);
    }
    else
    {
        if (sprite_index == spr_breakdance)
            sprite_index = spr_idle;
        
        dance_spr_speed = 0.9;
    }

    if (dance_spr_speed >= 1.15)
    {
        if (blur_afterimage_timer.state != TIMER_STATES.STARTED)
            blur_afterimage_timer.Start();
        
        if (note_particle_timer.state != TIMER_STATES.STARTED)
            note_particle_timer.Start();
        
        if (!instance_exists(obj_beatbox) || (instance_exists(obj_beatbox) && obj_beatbox.player != id))
        {
            instance_create(x, y, obj_puff_particle);
            
            with (instance_create(x, y, obj_beatbox))
            {
                vsp = -11;
                player = other.id;
            }
        }
    }
    else
    {
        note_particle_timer.Stop();
        blur_afterimage_timer.Stop();
    }
    
    var dance_spr = (sprite_index == spr_breakdance);
    var land_spr = equals_to_any(sprite_index, [spr_land, spr_land_walk]);

    if (equals_to_any(sprite_index, [spr_jump, spr_fall, spr_grabdash_cancel, spr_grabdash_bump, spr_stomp, spr_stomp_fall]) && !land_spr)
    {
        land_spr = true;
        
        image_index = 0;
        sprite_index = (sign_input_x == 0) ? spr_land : spr_land_walk;
        
        instance_create(x, y + 45, obj_land_cloud_particle);
        sound_instance_one_shot(sfx_step, x, y);
    }
    
    var machslide_spr = (sprite_index == spr_machslide_end);
    
    ////////////////////////////
    // Walking Logic
    /////////////////////////////
    
    
    if (sign_input_x != 0)
    {
        var image_speed_curve = [1, 1.25, 1.5];
        
        var image_speed_curve_index = floor(abs(hsp) / 3);
        image_speed_curve_index = clamp(image_speed_curve_index, 0, array_length(image_speed_curve) - 1);
        
        image_speed = image_speed_curve[image_speed_curve_index];
        
        if (dance_spr)
            return;
        
        if (cloud_particle_timer.state != TIMER_STATES.STARTED)
            cloud_particle_timer.Start();
        
        if (machslide_spr || land_spr)
        {
            animation_end(spr_walk);
            return;
        }
        
        idle_spr_time = 150;
        sprite_index = spr_walk;
        
        return;
    }
    
    
    /////////////////////////////
    // Idle Logic
    /////////////////////////////

    
    if (dance_spr)
        return;
    
    var groundpound_spr = equals_to_any(sprite_index, [spr_groundpound_idle_intro, spr_groundpound_idle]);
    var panting_spr = (sprite_index == spr_panting_idle);
    
    cloud_particle_timer.Stop();
    
    if (machslide_spr || land_spr) 
    {
        animation_end(spr_idle);
        return;
    }    

    if (--idle_spr_time < 0)
    {
        if (sprite_index != spr_idle && animation_end())
            idle_spr_time = 150;
        
        var i = 0;
        
        repeat (idle_anims_count)
        {
            if (idle_anims[i] == sprite_index)
                return;
            
            i++;
        }
        
        if (irandom(100) <= 25)
            sound_instance_one_shot(sfx_voice_idle, x, y);
        
        var target_anim = irandom(idle_anims_count - 1);
        sprite_set(idle_anims[target_anim], 0);
        
        return;
    }
    
    panting_spr_time = max(panting_spr_time - 1, 0);
    
    if (place_meeting(x, y, obj_point_of_interest))
    {
        if (sprite_index != spr_lookdoor)
        {
            sprite_set(spr_lookdoor, 0);
            image_speed = 1;
        }
        
        if (animation_end())
            image_speed = 0;
        
        return;
    }
    
    if (groundpound_spr)
    {
        panting_spr_time = 0;
        
        animation_end(spr_groundpound_idle);
        return;
    }
    
    if (panting_spr_time >= 1800)
    {
        idle_spr_time = 150;
        sprite_index = spr_panting_idle;
        
        return;
    }
    
    sprite_index = spr_idle;

}

/// @ignore
function state_player_normal_end()
{
    image_speed = 1;
    
    cloud_particle_timer.Stop();
    blur_afterimage_timer.Stop();
    note_particle_timer.Stop();
    
    panting_spr_time = 0;
    idle_spr_time = 150;
    dance_hold_time = 0;
}

/**
 * This function will return an array of the player's normal state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_normal()
{
    return [state_player_normal_start, state_player_normal_step, state_player_normal_end];
}