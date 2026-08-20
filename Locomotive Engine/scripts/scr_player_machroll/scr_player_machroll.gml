/// @ignore
function StatePlayerMachrollCreate()
{
    
    
    SpriteSet((sprite_index == spr_rolling_jump) ? spr_backslide_land : spr_machroll, 0);
    mask_index = spr_crouchmask;
    
    with (InstanceCreate(x, y + 45, obj_burst_cloud_particle))
        image_xscale = other.image_xscale;
    
    time_source_start(blurAfterimageTimer);
    
    if (sound_instance_get_playback_state(sndMachroll) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(sndMachroll);
}

/// @ignore
function StatePlayerMachrollStep()
{
    var x_pos = (sign(hsp) == 1) ? ceil(x + hsp) : floor(x + hsp);
    BlocksDestroy(x_pos, y, true, false, [obj_metalblock]);
    
    StunEnemy(HitboxPlace(hitbox, par_enemy, "hurtbox"), self);
    
    hsp = movespeed * dir;
    
    if (PlayerDoWallsplat())
        return;
    
    if (grounded)
    {
        if (PlayerGetUp())
        {
            SmcSetState("Mach");
            SpriteSet(spr_machroll_getup, 0);
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
        create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
        
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