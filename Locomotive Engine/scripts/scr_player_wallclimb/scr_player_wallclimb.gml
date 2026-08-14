/// @ignore
function StatePlayerWallclimbCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_index = spr_wallclimb;
    
    vertMovespeed = movespeed;
    vertMovespeed = max(0, vertMovespeed);
    
    vertAccel = 0.15;
    
    hsp = 0;
    movespeed = 0;
    grav = 0;
    
    sound_instance_start(sndMach);
    sound_instance_set_parameter_by_name(sndMach, "Grounded", true);
    sound_instance_set_parameter_by_name(sndMach, "State", 1);
}

/// @ignore
function StatePlayerWallclimbStep()
{
    wallclimbGrabTime--;
    
    if (pantingSprTime < 200)
        pantingSprTime++;
    
    destroy_blocks(x, y + vsp, [obj_block_metal, obj_block_metal_tiles]);
    
    if (!InputCheck(INPUT_VERB.MACHRUN) && wallclimbGrabTime <= 0)
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
        
        wallclimbDashTimer = 21;
        
        sound_instance_start(sndGrabdash);
        FlashEffectSet();
    }
    
    wallclimbDashTimer--;
    
    if (wallclimbDashTimer <= 0 && sprite_index == spr_wallclimb_dash)
        sprite_index = spr_wallclimb;
    
    vertAccel = (sprite_index == spr_wallclimb_dash) ? 0.3 : 0.15;
    
    if (vertMovespeed < 20)
        vertMovespeed += vertAccel;
    
    vsp = -vertMovespeed;
    
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
    wallclimbDashTimer = 0;
    
    sound_instance_stop(sndMach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    sound_instance_stop(sndGrabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}