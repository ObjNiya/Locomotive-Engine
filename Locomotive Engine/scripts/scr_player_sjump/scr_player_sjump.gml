/// @ignore
function StatePlayerSjumpCreate()
{
    
    
    SpriteSet(spr_sjump, 0);
    
    vsp = -12;
    hsp = 0;
    movespeed = 0;
    grav = -0.1;
    grounded = false;
    
    instakillHitbox.canAttack = true;
    machAfterimageUseAlpha = false;
    
    time_source_start(blurAfterimageTimer);
    time_source_start(machAfterimageTimer);
    time_source_start(airCloudParticleTimer);
    time_source_start(upwardsWooshPartTimer);

    InstanceCreate(x, y, obj_explosion_particle_alt);
    
    if (sound_instance_get_playback_state() != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(sndSuperjump);
    
    sound_instance_set_parameter_by_name(sndSuperjump, "State", 1);
}

/// @ignore
function StatePlayerSjumpStep()
{
    BlocksDestroy(x, floor(y + vsp + grav), false, true);
    
    if (PlayerDoInstakill())
        vsp = -12;
    
    if (sprite_index == spr_springlaunch)
    {
        BlocksDestroy(x, floor(y + vsp + grav), false, true, [obj_metalblock]);
        PlayerDoCeilingsplat();
        
        return;
    }
    
    if ((InputPressed(INPUT_VERB.MACHRUN) || InputPressed(INPUT_VERB.GRABDASH)) && sprite_index == spr_sjump)
    {
        SpriteSet(spr_sjump_cancel_prepare, 0);
        
        sound_instance_stop(sndSuperjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
        
        vsp = 0;
        grav = 0;
    }
    
    if (PlayerDoCeilingsplat())
        return;
    
    if (sprite_index != spr_sjump_cancel_prepare)
        return;
    
    time_source_stop(blurAfterimageTimer);
    time_source_stop(machAfterimageTimer);
    time_source_stop(airCloudParticleTimer);
    time_source_stop(upwardsWooshPartTimer);

    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (dir == 0)
        dir = sign(image_xscale);
    else
        image_xscale = dir;
    
    if (!AnimationEnd())
        return;
    
    SmcSetState("Mach");
    
    vsp = -5;
    movespeed = 12;
    
    sprite_index = spr_sjump_cancel_intro;
    image_speed = 1;
    
    FlashEffectSet();
    create_particle(x, y, obj_woosh_particle);
}

/// @ignore
function StatePlayerSjumpDestroy()
{
    grav = 0.5;
    machAfterimageUseAlpha = true;
    instakillHitbox.canAttack = false;
    
    time_source_stop(blurAfterimageTimer);
    time_source_stop(machAfterimageTimer);
    time_source_stop(airCloudParticleTimer);
    time_source_stop(upwardsWooshPartTimer);
    
    sound_instance_stop(sndSuperjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}