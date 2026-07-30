/// @ignore
function StatePlayerMachrollCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_set((sprite_index == spr_rolling_jump) ? spr_backslide_land : spr_machroll, 0);
    mask_index = spr_crouchmask;
    
    with (instance_create(x, y + 45, obj_burst_cloud_particle))
        image_xscale = other.image_xscale;
    
    blur_afterimage_timer.Start();
    
    if (sound_instance_get_playback_state(snd_machroll) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(snd_machroll);
}

/// @ignore
function StatePlayerMachrollStep()
{
    destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
    hitboxDoAttack(hitbox, "stunEnemy");
    
    hsp = movespeed * dir;
    
    if (PlayerDoWallsplat())
        return;
    
    if (grounded)
    {
        if (PlayerGetUp())
        {
            SmcSetState("Mach");
            sprite_set(spr_machroll_getup, 0);
            sound_instance_start(snd_roll_getup);
            
            return;
        }
        
        image_speed = 1;
        
        if ((movespeed < 12 || !animation_end()) && !EqualsToAny(sprite_index, spr_backslide_land, spr_backslide))
        {
            sprite_index = spr_machroll;
            image_speed = movespeed / 5.5;
        }
        else if (sprite_index == spr_machroll)
            sprite_set(spr_backslide_land, 0);
        
        animation_end_ext((sprite_index == spr_backslide_land), spr_backslide);
        create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
        
        return;
    }
    
    vsp = 15;
    
    if (sprite_index != spr_machroll_dive)
    {
        sound_instance_start(snd_dive);
        sprite_index = spr_machroll_dive;
    }
    
    PlayerDoGroundpound(false, true);
}

/// @ignore
function StatePlayerMachrollDestroy()
{
    mask_index = spr_player_mask;
    image_speed = 1;
    
    blur_afterimage_timer.Stop();
    
    sound_instance_stop(snd_machroll, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}