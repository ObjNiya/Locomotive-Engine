/// @ignore
function StatePlayerGrabdashCreate()
{
    acel = 0.5;
    
    image_speed = 1;
    
    if (dir == 0)
        dir = image_xscale;
    else
        image_xscale = dir;
    
    if (abs(hsp) < 10 && grounded)
        hsp = 10 * dir;
    
    if (!EqualsToAny(sprite_index, spr_grabdash_intro, spr_grabdash, spr_grabdash_end) && grounded)
        SpriteSet(spr_grabdash_intro, 0);
    else if (!EqualsToAny(sprite_index, spr_grabdash_air_intro, spr_grabdash_air))
        SpriteSet(spr_grabdash_air_intro, 0);
    
    sound_instance_start(sndGrabdash);
    time_source_start(blurAfterimageTimer);
}

/// @ignore
function StatePlayerGrabdashStep()
{
    if (abs(hsp) < 10)
        hsp += acel * dir;

    BlocksDestroy(PlayerPredictX(), y, true, false, [obj_metalblock]);
    
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
        
        if (abs(hsp) <= 10)
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
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (sign_input_x == -dir || (sprite_index == spr_grabdash_end && AnimationEnd()))
    {
        SmcSetState("Normal");
        
        if (grounded)
        {
            hsp = 2 * sign_input_x;
            return;
        }
        
        hsp = 0;
        
        SpriteSet(spr_grabdash_cancel, 0);
        sound_instance_one_shot(sfx_player_grab_cancel, x, y);
        
        return;
    }
    
    if (PlayerHitWall())
    {
        SmcSetState("Normal");
        
        sound_instance_one_shot(sfx_player_bumpwall, x, y);
        sound_instance_stop(sndGrabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
        PartSpawn(x + (10 * image_xscale), y + 10, PART_TYPES.BUMPSPARK);
  
        vsp = -4;
        grounded = false;
        
        sprite_index = spr_grabdash_bump;
        return;
    }
    
    if (!grounded)
    { 
        AnimationEnd(spr_grabdash_air);
        return;
    }
    
    AnimationEndExt((sprite_index == spr_grabdash_intro), spr_grabdash);
    AnimationEndExt((sprite_index == spr_grabdash), spr_grabdash_end);

    if (grabdashcloudPartTimer > 0)
        return;
    
    PartSpawnDirX(x, bbox_bottom, PART_TYPES.GRABDASHCLOUD, dir);
    grabdashcloudPartTimer = 16;
}

/// @ignore
function StatePlayerGrabdashDestroy()
{
    time_source_stop(blurAfterimageTimer);
}