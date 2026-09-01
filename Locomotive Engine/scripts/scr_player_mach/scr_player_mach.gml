/**
 * Returns what mach stage the player is at depending on their movement speed.
 * @returns {Real}
 * @pure
 */
function PlayerGetMachStage()
{
    if (movespeed < 10)
        return 1;
    else if (movespeed < 12)
        return 2;
    else if (movespeed < 16)
        return 3;
    else 
        return 4;
}

/// @ignore
function StatePlayerMachCreate()
{
    movespeed = max(movespeed, 6);
    accel = 0.1;
    
    dir = sign(image_xscale);
    
    machAfterimageUseAlpha = true;
    time_source_start(machAfterimageTimer);
    
    if (sound_instance_get_playback_state(sndMach) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(sndMach);
    
    if (EqualsToAny(sprite_index, spr_mach1, spr_mach2, spr_mach2_jump_intro, spr_mach2_jump, spr_mach3, spr_mach3_jump, spr_mach3_hit_enemy, spr_mach4,
          spr_walljump_intro, spr_walljump, spr_longjump_intro, spr_longjump, spr_kungfu_backflip, spr_sjump_cancel_intro, spr_sjump_cancel))
        return;
    
    if (!grounded)
        SpriteSet(spr_mach2_jump_intro, 0);
    else
        SpriteSet(spr_mach1, 0);
}

/// @ignore
function StatePlayerMachStep()
{
    static flame_part_timer = 12;
    
    if (pantingSprTime < 2000)
        pantingSprTime++;

    if (PlayerDoGrabdash())
        return;
    if (PlayerDoUppercut())
        return;

    if (PlayerCrouch() || PlayerDive())
    {
        SmcSetState("Machroll");
        return;
    }
    
    if (PlayerDoTaunt())
        return;
    
    if (PlayerDoMachturn())
        return;
    
    if (PlayerDoMachslide())
        return;
        
    if (PlayerWallclimb())
    {
        SmcSetState("Wallclimb");
        return;
    }
    
    AnimationEndExt((sprite_index == spr_mach1), spr_mach2);
    AnimationEndExt((sprite_index == spr_mach2_jump_intro), spr_mach2_jump);
    AnimationEndExt((sprite_index == spr_mach3_jump || sprite_index == spr_mach3_hit_enemy), spr_mach3);
    AnimationEndExt((sprite_index == spr_longjump_intro), spr_longjump);
    AnimationEndExt((sprite_index == spr_walljump_intro), spr_walljump);
    AnimationEndExt((sprite_index == spr_sjump_cancel_intro), spr_sjump_cancel);
    
    if (grounded)
    {
        switch (sprite_index)
        {
            case spr_sjump_cancel_intro:
            case spr_sjump_cancel:
                sprite_index = spr_mach3;
                break;
            
            case spr_mach2_jump_intro:
            case spr_mach2_jump:
            case spr_walljump_intro:
            case spr_walljump:
            case spr_longjump_intro:
            case spr_longjump:            
                sprite_index = spr_mach2;
                break;      
        }
    }
    
    var mach3 = (movespeed >= 12 && EqualsToAny(sprite_index, spr_mach3, spr_mach3_jump, spr_mach3_dashpad, spr_mach3_hit_enemy, spr_mach3_hit_enemy, spr_mach4, spr_machroll_getup, spr_sjump_cancel_intro, spr_sjump_cancel));
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var slope_acel = CalcSlopeAccel(0.05, 0.2, 0.03, 0.1);
    
    var machsnd_state = 0;
    var machsnd_ground = grounded;
    
    instakillHitbox.canAttack = false;
    accel = 0.1;
    image_speed = 1;
    
    if (!mach3)
    {
        machsnd_state = real(sprite_index != spr_mach1);
        if (sprite_index == spr_machroll_getup)
            machsnd_ground = false;
        
        InstanceDestroySafe(speedlinesEffectId);
        InstanceDestroySafe(chargeEffectId);
        
        AnimationEndExt((sprite_index == spr_machroll_getup), spr_mach2);
        if (!EqualsToAny(sprite_index, spr_longjump_intro, spr_longjump, spr_machroll_getup, spr_kungfu_backflip))
            image_speed = (movespeed / 5.5);
        
        if (grounded)
        {
            movespeed += accel + slope_acel;
            
            if (dashcloudPartTimer <= 0)
            {
                PartSpawnDirX(x, bbox_bottom, PART_TYPES.DASHCLOUD, dir);
                dashcloudPartTimer = 13;
            }
            
            PlayerDoJump(false, spr_mach2_jump_intro);
            
            if (PlayerMachstop())
            {
                SmcSetState("Normal");
                return;
            }
            
            if (PlayerMachinstaturn())
            {
                dir *= -1;
                image_xscale *= -1;
                movespeed = 6;
            }
            
            if (PlayerHitWall())
            {
                PlayerDoWallsplat();
                return;
            }
            
            if (movespeed >= 12)
            {
                FlashEffectSet();
                if (sprite_index != spr_machroll_getup)
                    sprite_index = spr_mach3;
                
                mach3 = true;
            }
        }
        else if (!EqualsToAny(sprite_index, spr_longjump_intro, spr_longjump, spr_kungfu_backflip, spr_mach2_jump_intro, spr_mach2_jump, spr_walljump_intro, spr_walljump))
            SpriteSet(spr_mach2_jump_intro, 0);
        
        StunEnemy(HitboxPlace(hitbox, par_enemy, "hurtbox"), self);
    }
    else
    {
        machsnd_state = 2;
        
        if (movespeed >= 20)
        {
            accel = 0;
            slope_acel = 0;
        }
        else if (movespeed < 16)
            accel = 0.025;
        
        ScareEnemies();
        
        instakillHitbox.canAttack = true;
        if (PlayerDoInstakill())
            SpriteSet(spr_mach3_hit_enemy, 0);
        
        if (!instance_exists(speedlinesEffectId))
            speedlinesEffectId = EffectCreate(x, y, obj_following_effect, spr_speedlines_effect);
        
        if (!instance_exists(chargeEffectId))
            chargeEffectId = EffectCreate(x, y, obj_following_effect, spr_charge_effect);
        
        AnimationEndExt((sprite_index == spr_machroll_getup), spr_mach3);
        
        if (grounded)
        {
            if (dir == sign_input_x)
                movespeed += accel + slope_acel;
            
            if (mach3cloudPartTimer <= 0)
            {
                PartSpawnDirX(x, bbox_bottom, PART_TYPES.MACH3CLOUD, dir);
                mach3cloudPartTimer = 20;
            }
            
            PlayerDoJump(false, spr_mach3_jump);
            
            if (PlayerSjump())
            {
                SmcSetState("SjumpPrep");
                return;
            }
            
            if (PlayerHitWall())
            {
                SmcSetState("Anim");
                SpriteSet(spr_mach3_hit_wall, 0);
                
                vsp = -6;
                movespeed = -6;
                
                PartSpawn(x + (dir * 15), y + 10, PART_TYPES.BUMPSPARK);
                sound_instance_one_shot(sfx_player_mach3_wallcrash, x, y);
                camera.ShakeSet(20, 0.666, 0);
                
                return;
            }
        }
        else if (PlayerDoCape())
            return;
        
        if (movespeed >= 16)
        {
            if (sprite_index != spr_mach4)
            {
                sprite_index = spr_mach4;
                
                PartSpawn(x, y, PART_TYPES.MACH4CLOUDS);
                FlashEffectSet();
                
                time_source_start(blurAfterimageTimer);
            }
            
            machsnd_state = 3;
            
            if (--flame_part_timer <= 0)
            {
                PartSpawn(x, bbox_bottom, PART_TYPES.FLAME);
                flame_part_timer = 12;
            }
            
            if (horizRingPartTimer <= 0)
            {
                PartSpawnDirX(x, y, PART_TYPES.RING, dir);
                horizRingPartTimer = 14;
            }
        }
        else if (!EqualsToAny(sprite_index, spr_mach3, spr_mach3_hit_enemy, spr_mach3_jump, spr_mach3_dashpad, spr_machroll_getup, spr_sjump_cancel_intro, spr_sjump_cancel))
            sprite_index = spr_mach3;
    }
    
    movespeed = max(movespeed, 6);
    hsp = movespeed * dir;
    accel += slope_acel; 
    
    if (mach3)
        BlocksDestroy(PlayerPredictX(), y, true, false);
    else
        BlocksDestroy(PlayerPredictX(), y, true, false, [obj_metalblock]);
    
    PlayerDoJumpstop();
      
    if (sound_instance_get_playback_state(sndMach) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
        sound_instance_start(sndMach);
    
    sound_instance_set_parameter_by_name(sndMach, "Grounded", machsnd_ground);
    sound_instance_set_parameter_by_name(sndMach, "State", machsnd_state);
}

/// @ignore
function StatePlayerMachDestroy()
{
    image_speed = 1;
    
    instakillHitbox.canAttack = false;
    
    time_source_stop(blurAfterimageTimer);
    time_source_stop(machAfterimageTimer);
    
    InstanceDestroySafe(speedlinesEffectId);
    InstanceDestroySafe(chargeEffectId);
    
    sound_instance_stop(sndMach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}