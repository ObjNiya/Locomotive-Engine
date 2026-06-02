/// @ignore
function StatePlayerSjumpCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_set(spr_sjump, 0);
    
    vsp = -12;
    hsp = 0;
    movespeed = 0;
    grav = -0.1;
    grounded = false;
    
    instakillmove = true;
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.Start();
    air_cloud_particle_timer.Start();
    upwards_woosh_particle_timer.Start();
    
    instance_create(x, y, obj_explosion_particle_alt);
    
    if (sound_instance_get_playback_state() != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(snd_superjump);
    
    sound_instance_set_parameter_by_name(snd_superjump, "State", 1);
}

/// @ignore
function StatePlayerSjumpStep()
{
    destroy_blocks(x, y + vsp, [obj_block_metal, obj_block_metal_tiles]);
    if (PlayerDoInstakill())
        vsp = -12;
    
    if (sprite_index == spr_springlaunch)
    {
        destroy_blocks(x, y + vsp);
        PlayerDoCeilingsplat();
        
        return;
    }
    
    if ((InputPressed(INPUT_VERB.MACHRUN) || InputPressed(INPUT_VERB.GRABDASH)) && sprite_index == spr_sjump)
    {
        sprite_set(spr_sjump_cancel_prepare, 0);
        
        sound_instance_stop(snd_superjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
        
        vsp = 0;
        grav = 0;
    }
    
    if (PlayerDoCeilingsplat())
        return;
    
    if (sprite_index != spr_sjump_cancel_prepare)
        return;
    
    mach_afterimage_timer.Stop();
    upwards_woosh_particle_timer.Stop();
    blur_afterimage_timer.Stop();
    air_cloud_particle_timer.Stop();
    
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (dir == 0)
        dir = sign(image_xscale);
    else
        image_xscale = dir;
    
    if (!animation_end())
        return;
    
    SmcSetState("Mach");
    
    vsp = -5;
    movespeed = 12;
    
    sprite_index = spr_sjump_cancel_intro;
    image_speed = 1;
    
    create_flash_effect(true);
    create_particle(x, y, obj_woosh_particle);
}

/// @ignore
function StatePlayerSjumpDestroy()
{
    grav = 0.5;
    mach_afterimage_use_alpha = true;
    instakillmove = false;
    
    mach_afterimage_timer.Stop();
    upwards_woosh_particle_timer.Stop();
    blur_afterimage_timer.Stop();
    air_cloud_particle_timer.Stop();
    
    sound_instance_stop(snd_superjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}