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
    
    attacking = true;
    strength = 2;
    
    instance_create(x, y, obj_explosion_particle_alt);
    
    if (sound_instance_get_playback_state() != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(snd_superjump);
    
    sound_instance_set_parameter_by_name(snd_superjump, "State", 1);
}

/// @ignore
function state_player_sjump_step()
{
    if (sprite_index == spr_springlaunch)
        return;
    
    if ((InputPressed(INPUT_VERB.MACHRUN) || InputPressed(INPUT_VERB.GRABDASH)) && sprite_index == spr_sjump)
    {
        sprite_index_set(spr_sjump_cancel_prepare, 0);
        
        sound_instance_stop(snd_superjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
        
        vsp = 0;
        grav = 0;
        
        attacking = false;
        strength = 1;
    }
    
    if (PLAYER_HIT_CEILING)
    {
        player_setup_hit_ceiling();
        return;
    }
    
    if (sprite_index != spr_sjump_cancel_prepare)
        return;
    
    mach_afterimage_timer.stop();
    upwards_woosh_particle_timer.stop();
    blur_afterimage_timer.stop();
    cloud_particle_timer.stop();
    
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (dir == 0)
        dir = sign(image_xscale);
    else
        image_xscale = dir;
    
    if (!animation_end())
        return;
    
    smc_set_state(state_player_mach);
    
    vsp = -5;
    movespeed = 12;
    
    sprite_index = spr_sjump_cancel_intro;
    image_speed = 1;
    
    create_flash_effect(true);
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
    
    attacking = false;
    strength = 1;
    
    sound_instance_stop(snd_superjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}

/**
 * This function will return an array of the player's superjump state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_sjump()
{
    return [state_player_sjump_start, state_player_sjump_step, state_player_sjump_end];
}