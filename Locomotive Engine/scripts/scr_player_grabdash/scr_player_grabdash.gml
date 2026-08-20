/// @ignore
function StatePlayerGrabdashCreate()
{
    
    
    momentum = true;
    grabdashAirborne = !grounded;
    accel = 0.5;
    
    image_speed = 1;
    
    if (dir == 0)
        dir = image_xscale;
    else
        image_xscale = dir;
    
    if (movespeed < 10 && grounded)
        movespeed = max(movespeed, 10);
    
    SpriteSet(spr_grabdash_intro, 0);
    sound_instance_start(sndGrabdash);
    time_source_start(blurAfterimageTimer);
}

/// @ignore
function StatePlayerGrabdashStep()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));

    if (movespeed < 10)
        movespeed += accel;
    
    hsp = movespeed * dir;
    
    var x_pos = (sign(hsp) == 1) ? ceil(x + hsp) : floor(x + hsp);
    BlocksDestroy(x_pos, y, true, false, [obj_metalblock]);
    PlayerDoJumpstop();
    
    var enemy = HitboxPlace(hitbox, par_enemy, "hurtbox");
    if (enemy != noone)
    {
        with (enemy)
            SmcSetState("Grabbed");
        
        carryingId = enemy;
        
        if (InputCheck(INPUT_VERB.UP))
        {
            PlayerDoGroundpound(true);
            vsp = -14;
            return;
        }
        
        if (movespeed <= 10)
        {
            SmcSetState("Normal");
            sprite_index = (grounded) ? spr_hauling_intro : spr_hauling_jump;
        }
        else
            SmcSetState("Swingding");
        
        if (!grounded)
            vsp = -6;
        return;
    }
    
    
    if (PlayerDoLongjump())
        return;
    
    if (PlayerWallclimb())
    {
        wallclimbGrabTime = 10;
        SmcSetState("Wallclimb");
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        SmcSetState("RollingJump");
        return;
    }
    
    if (sign_input_x == -dir || (sprite_index == spr_grabdash_end && AnimationEnd()))
    {
        if (PlayerMachrun() && sign_input_x == dir)
        {
            SmcSetState("Mach");
            sprite_index = spr_mach2;
            
            return;
        }
    
        SmcSetState("Normal");
        
        if (!grounded && sign_input_x == -dir)
        {
            SpriteSet(spr_grabdash_cancel, 0);
            sound_instance_one_shot(sfx_player_grab_cancel, x, y);
        }
        else if (sign_input_x == -dir)
            movespeed = 2;
        
        return;
    }
    
    if (PlayerHitWall())
    {
        SmcSetState("Normal");
        
        sound_instance_one_shot(sfx_player_bump_wall, x, y);
        sound_instance_stop(sndGrabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        create_particle(x + (10 * image_xscale), y + 10, obj_bump_particle, false);
        
        vsp = -4;
        grounded = false;
        
        sprite_index = spr_grabdash_bump;
        return;
    }
    
    AnimationEndExt((sprite_index == spr_grabdash_intro), spr_grabdash);
    
    if (!grounded)
        return;
    
    AnimationEndExt((sprite_index == spr_grabdash), spr_grabdash_end);
    
    if (grabdashAirborne && sprite_index == spr_grabdash)
        SpriteSet(spr_grabdash_end, 0);
    
    create_particle_repeating(x, y + 45, obj_slide_cloud_particle);
}

/// @ignore
function StatePlayerGrabdashDestroy()
{
    time_source_stop(blurAfterimageTimer);
}