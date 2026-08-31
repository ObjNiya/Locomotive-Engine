/// @ignore
function StatePlayerSjumpCreate()
{
    if (sprite_index != spr_springlaunch && sprite_index != spr_sjump_cancel_prepare) 
        SpriteSet(spr_sjump, 0);
    
    if (sprite_index != spr_sjump_cancel_prepare)
    {
        vsp = -12;
        grav = -0.1;
    }
    
    hsp = 0;
    movespeed = 0;
    grounded = false;
    
    instakillHitbox.canAttack = true;
    machAfterimageUseAlpha = false;
    
    time_source_start(blurAfterimageTimer);
    time_source_start(machAfterimageTimer);
    time_source_start(airCloudParticleTimer);

    if (sprite_index != spr_sjump_cancel_prepare)
        PartSpawn(x, y, PART_TYPES.EXPLO);

    if (sound_instance_get_playback_state() != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(sndSuperjump);
    
    sound_instance_set_parameter_by_name(sndSuperjump, "State", 1);
}

/// @ignore
function StatePlayerSjumpCancel()
{
    vsp = 0;
    grav = 0;
    
    SpriteSet(spr_sjump_cancel_prepare, 0);
     
    sound_instance_stop(sndSuperjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
    
    time_source_stop(blurAfterimageTimer);
    time_source_stop(machAfterimageTimer);
    time_source_stop(airCloudParticleTimer);
}

/// @ignore
function StatePlayerSjumpStep()
{
    static ring_part_timer = 15;
    
    if (sprite_index == spr_sjump_cancel_prepare)
    {
        dir = Side(InputX(INPUT_CLUSTER.NAVIGATION), image_xscale);
        image_xscale = dir;
        
        with (carryingId)
        {
            x = other.x + 38 * other.image_xscale;
            y = other.y - 16;
        }
        
        if (!AnimationEnd(spr_sjump_cancel_intro))
            return;
        
        var prev_carrying_id = carryingId;
        carryingId = noone;
        
        PlayerDoInstakill(prev_carrying_id);
        SmcSetState("Mach");
        
        vsp = -5;
        movespeed = 12;
        
        sprite_index = spr_sjump_cancel_intro;
        image_speed = 1;
        
        FlashEffectSet();
        PartSpawnDirX(x, y, PART_TYPES.RING, image_xscale);
        
        return;
    }
    
    BlocksDestroy(x, floor(y + vsp + grav), false, true, [obj_metalblock]);
    
    if (PlayerDoInstakill())
        vsp = -12;
    if (PlayerDoCeilingsplat())
        return;
    
    if (ring_part_timer-- <= 0) 
    {
        PartSpawnDirY(x + 12, y, PART_TYPES.RING, -1);
        ring_part_timer = 15;
    }
    
    if (sprite_index == spr_springlaunch)
    {
        BlocksDestroy(x, floor(y + vsp + grav), false, true);
        return;
    }
    
    if (InputPressed(INPUT_VERB.MACHRUN) || InputPressed(INPUT_VERB.GRABDASH))
        StatePlayerSjumpCancel();
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
    
    sound_instance_stop(sndSuperjump, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}