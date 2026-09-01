/// @ignore
function StatePlayerMachrollCreate()
{
    accel = 0;
    
    SpriteSet((sprite_index == spr_rolling_jump) ? spr_backslide_land : spr_machroll, 0);
    mask_index = spr_crouchmask;
    
    PartSpawnDirX(x, bbox_bottom, PART_TYPES.STARTCLOUD, dir);
    time_source_start(blurAfterimageTimer);
    
    if (sound_instance_get_playback_state(sndMachroll) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(sndMachroll);
}

/// @ignore
function StatePlayerMachrollStep()
{
    static dashcloud_part_timer = 14;
    
    BlocksDestroy(PlayerPredictX() , y, true, false, [obj_metalblock]);
    StunEnemy(HitboxPlace(hitbox, par_enemy, "hurtbox"), self);
    
    movespeed += CalcSlopeAccel(0, 0.4, 0, 0.3);
    if (floor(movespeed) <= 0)
    {
        dir *= -1;
        image_xscale *= -1;
        movespeed = 2;
    }
    
    hsp = movespeed * dir;
    
    if (PlayerDoWallsplat())
        return;
    
    if (grounded)
    {
        if (PlayerGetUp())
        {
            SmcSetState("Mach");
            SpriteSet(spr_machroll_getup, 0);
            PartSpawnDirX(x, bbox_bottom, PART_TYPES.STARTCLOUD, dir);
            sound_instance_start(sndRollGetup);
            
            return;
        }
        
        image_speed = 1;
        
        if ((movespeed < 12 || !AnimationEnd()) && !EqualsToAny(sprite_index, spr_backslide_land, spr_backslide))
        {
            sprite_index = spr_machroll;
            image_speed = movespeed / 5.5;
        }
        else if (sprite_index == spr_machroll)
            SpriteSet(spr_backslide_land, 0);
        
        AnimationEndExt((sprite_index == spr_backslide_land), spr_backslide);
    
        if (dashcloudPartTimer <= 0 && grounded)
        {
            PartSpawnDirX(x, bbox_bottom, PART_TYPES.DASHCLOUD, dir);
            dashcloudPartTimer = 13;
        }

        return;
    }
    
    vsp = 15;
    
    if (sprite_index != spr_machroll_dive)
    {
        sound_instance_start(sndDive);
        sprite_index = spr_machroll_dive;
    }
    
    PlayerDoGroundpound(false, true);
}

/// @ignore
function StatePlayerMachrollDestroy()
{
    mask_index = spr_player_mask;
    image_speed = 1;
    
    time_source_stop(blurAfterimageTimer);
    sound_instance_stop(sndMachroll, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}