/// @ignore
function StatePlayerWallclimbCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_index = spr_wallclimb;
    
    vert_movespeed = movespeed;
    vert_movespeed = max(0, vert_movespeed);
    
    vert_accel = 0.15;
    
    hsp = 0;
    movespeed = 0;
    grav = 0;
    
    sound_instance_start(snd_mach);
    sound_instance_set_parameter_by_name(snd_mach, "Grounded", true);
    sound_instance_set_parameter_by_name(snd_mach, "State", 1);
}

/// @ignore
function StatePlayerWallclimbStep()
{
    wallclimb_grab_buffer--;
    
    if (panting_spr_time < 200)
        panting_spr_time++;
    
    destroy_blocks(x, y + vsp, [obj_block_metal, obj_block_metal_tiles]);
    
    if (!InputCheck(INPUT_VERB.MACHRUN) && wallclimb_grab_buffer <= 0)
    {
        SmcSetState("Normal");
        
        hsp = -6 * dir;
        
        if (!InputCheck(INPUT_VERB.JUMP))
            vsp /= 20;
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        movespeed = 10;
        dir *= -1;
        image_xscale = dir;
        
        SmcSetState("Mach");
        PlayerDoJump(true, spr_walljump_intro, -11, false);
        
        return;
    }
    
    if (PlayerDoCeilingsplat())
        return;
    
    if (InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_wallclimb_dash)
    {
        sprite_index = spr_wallclimb_dash;
        
        wallclimb_dash_timer.Start();
        
        sound_instance_start(snd_grabdash);
        create_flash_effect(true);
    }
    
    wallclimb_dash_timer.Step();
    
    vert_accel = (sprite_index == spr_wallclimb_dash) ? 0.3 : 0.15;
    
    if (vert_movespeed < 20)
        vert_movespeed += vert_accel;
    
    vsp = -vert_movespeed;
    
    if (!PlayerHitWall())
    {
        movespeed = abs(vsp);
        vsp = 0;
        
        SmcSetState("Mach");
        create_particle(x, y + 43, obj_jump_particle, false);
    }
}

/// @ignore
function StatePlayerWallclimbDestroy()
{
    grav = 0.5;
    
    wallclimb_dash_timer.Stop();
    
    sound_instance_stop(snd_mach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    sound_instance_stop(snd_grabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}