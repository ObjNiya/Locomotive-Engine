/// @ignore
function StatePlayerWallclimbCreate()
{
    
    
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
    
    BlocksDestroy(x, floor(y + (vsp - vertAccel)), false, true, [obj_metalblock]);

    static cloud_timer = 10;
    
    if (--cloud_timer <= 0)
    {
        cloud_timer = 10;
        
        PartSpawn(x + (image_xscale * 10), y + 43, PART_TYPES.CLOUD);
    }
    
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
        PartSpawn(x, bbox_bottom, PART_TYPES.JUMPCLOUD);
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