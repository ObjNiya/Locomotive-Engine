/// @ignore
function state_player_sjump_start()
{
    sprite_index_set(spr_sjump, 0);
    
    vsp = -12;
    hsp = 0;
    movespeed = 0;
    grav = -0.1;
    grounded = false;
    
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.start();
    cloud_particle_timer.start();
    upwards_woosh_particle_timer.start();
    
    instance_create(x, y, obj_explosion_particle_alt);
}

/// @ignore
function state_player_sjump_step()
{
    hurt_enemy();

    if (sprite_index == spr_springlaunch)
        return;
    
    if ((IotaGetInput("machrun_pressed") || IotaGetInput("grabdash_pressed")) && sprite_index == spr_sjump)
    {
        sprite_index_set(spr_sjump_cancel_intro, 0);
        
        vsp = 0;
        grav = 0;
    }
    
    if (player_check_hit_ceiling())
    {
        player_setup_hit_ceiling();
        return;
    }
    
    if (sprite_index != spr_sjump_cancel_intro)
        return;
    
    mach_afterimage_timer.stop();
    upwards_woosh_particle_timer.stop();
    blur_afterimage_timer.stop();
    cloud_particle_timer.stop();
    
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (dir == 0)
        dir = sign(visual_xscale);
    else
        visual_xscale = dir;
    
    if (!animation_end())
        return;
    
    state_machine_set_state(state_player_mach());
    
    vsp = -5;
    movespeed = 12;
    
    sprite_index = spr_sjump_cancel;
}

/// @ignore
function state_player_sjump_end()
{
    grav = 0.5;
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.stop();
    upwards_woosh_particle_timer.stop();
    blur_afterimage_timer.stop();
    cloud_particle_timer.stop();
}

/**
 * This function will return an array of the player's superjump state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_sjump()
{
    return [state_player_sjump_start, state_player_sjump_step, state_player_sjump_end];
}