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
    PLAYER_STATE_FAILSAVE;
    
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
    var mach3 = (movespeed >= 12 && EqualsToAny(sprite_index, spr_mach3, spr_mach3_jump, spr_mach3_dashpad, spr_mach3_hit_enemy, spr_mach3_hit_enemy, spr_mach4, spr_machroll_getup, spr_sjump_cancel_intro, spr_sjump_cancel));
    accel = 0.1;
    
    if (mach3)
    {
        if (movespeed < 16)
            accel = 0.025;
        
        momentum = true;
        
        var x_pos = (sign(hsp) == 1) ? ceil(x + hsp + accel) : floor(x + hsp + accel);
        BlocksDestroy(x_pos, y, true, false);
        ScareEnemies();
        
        instakillHitbox.canAttack = true;
        if (PlayerDoInstakill())
            SpriteSet(spr_mach3_hit_enemy, 0);
    }
    else
    {
        instakillHitbox.canAttack = false;
        
        var x_pos = (sign(hsp) == 1) ? ceil(x + hsp + accel) : floor(x + hsp + accel);
        BlocksDestroy(x_pos, y, true, false, [obj_metalblock]);
        
        StunEnemy(HitboxPlace(hitbox, par_enemy, "hurtbox"), self);
    }

    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var min_speed = 6;
    var max_speed = 20;
    
    movespeed += accel * real(dir == sign_input_x || !mach3) * grounded;
    movespeed = clamp(movespeed, min_speed, max_speed);
    hsp = movespeed * dir;
    
    if (pantingSprTime < 2000)
        pantingSprTime++;
    
    PlayerDoJump(false, (mach3) ? spr_mach3_jump : spr_mach2_jump_intro);

    if (PlayerDoGrabdash())
        return;
    if (PlayerDoUppercut())
        return;
    if (PlayerDoCape())
        return;
    
    if (PlayerSjump())
    {
        SmcSetState("SjumpPrep");
        return;
    }
    
    if (PlayerCrouch() || PlayerDive())
    {
        SmcSetState("Machroll");
        return;
    }
    
    if (PlayerDoTaunt())
        return;
    
    if (PlayerDoMachturn())
        return;
    else if (PlayerMachinstaturn())
    {
        dir *= -1;
        image_xscale *= -1;
        movespeed = min_speed;
    }
    
    if (PlayerDoMachslide())
        return;
    else if (PlayerMachstop())
    {
        SmcSetState("Normal");
        return;
    }
        
    if (PlayerWallclimb())
    {
        SmcSetState("Wallclimb");
        return;
    }
    
    if (PlayerHitWall())
    {
        if (!mach3)
            PlayerDoWallsplat();
        else
        {
            SmcSetState("Anim");
            SpriteSet(spr_mach3_hit_wall, 0);
            
            vsp = -6;
            movespeed = -6;
            
            InstanceCreate(x + (dir * 15), y + 10, obj_bump_particle);
            sound_instance_one_shot(sfx_player_mach3_wallcrash, x, y);
            camera.shake_set(20, 0.666);
        }

        return;
    }    
    
    PlayerDoJumpstop();
    
    AnimationEndExt((sprite_index == spr_mach1), spr_mach2);
    AnimationEndExt((sprite_index == spr_mach2_jump_intro), spr_mach2_jump);
    AnimationEndExt((sprite_index == spr_mach3_jump || sprite_index == spr_mach3_hit_enemy), spr_mach3);
    AnimationEndExt((sprite_index == spr_longjump_intro), spr_longjump);
    AnimationEndExt((sprite_index == spr_walljump_intro), spr_walljump);
    AnimationEndExt((sprite_index == spr_machroll_getup), spr_mach2);
    AnimationEndExt((sprite_index == spr_sjump_cancel_intro), spr_sjump_cancel);
    
    image_speed = 1;
    
    var roll_getup_spr = (sprite_index == spr_machroll_getup);
  
    if (sound_instance_get_playback_state(sndMach) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
        sound_instance_start(sndMach);
    
    var machsnd_ground = grounded;
    var machsnd_state = 0;
    
    if (!mach3)
    {
        machsnd_state = 1;
        
        if (roll_getup_spr)
            machsnd_ground = false;
        else if (!EqualsToAny(sprite_index, spr_longjump_intro, spr_longjump, spr_kungfu_backflip))
            image_speed = (movespeed / 5.5);
        
        if (grounded)
        {
            if (sprite_index != spr_mach1 && !roll_getup_spr)
                sprite_index = spr_mach2;
            else
            	machsnd_state = 0;
            
            if (movespeed >= 12)
            {
                FlashEffectSet();
                
                if (!roll_getup_spr)
                    sprite_index = spr_mach3;
            }
            
            create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
        }
        else if (!EqualsToAny(sprite_index, spr_longjump_intro, spr_longjump, spr_kungfu_backflip, spr_mach2_jump_intro, spr_mach2_jump, spr_walljump_intro, spr_walljump))
            SpriteSet(spr_mach2_jump_intro, 0);
        
    }
    else
    {
        var sjump_spr = (EqualsToAny(sprite_index, spr_sjump_cancel_intro, spr_sjump_cancel) && !grounded);
        
        machsnd_state = 2;
        
        if (movespeed >= 16)
        {
            if (sprite_index != spr_mach4)
            {
                sprite_index = spr_mach4;
                
                create_particle(x, y, obj_mach4_puff_particle);
                FlashEffectSet();
                
                time_source_start(blurAfterimageTimer);
            }
            else if (--flameParticleTimer <= 0)
            {
                create_particle(x, y + 45, obj_flame_particle, false);
                flameParticleTimer = 12;
            }
            
            machsnd_state = 3;
            create_particle_repeating(x, y, obj_woosh_particle);
        }
        else if (sprite_index != spr_mach3 && !EqualsToAny(sprite_index, spr_mach3_hit_enemy, spr_mach3_jump, spr_mach3_dashpad) && !roll_getup_spr && !sjump_spr)
            sprite_index = spr_mach3;

        create_particle_repeating(x, y + 45, obj_mach3_cloud_particle);
        
        if (!instance_exists(speedlinesEffectId))
            speedlinesEffectId = create_particle(x, y, obj_speedlines_effect);
        
        if (!instance_exists(chargeEffectId))
            chargeEffectId = create_particle_repeating(x, y , obj_charge_effect);
    }
    
    sound_instance_set_parameter_by_name(sndMach, "Grounded", machsnd_ground);
    sound_instance_set_parameter_by_name(sndMach, "State", machsnd_state);
}

/// @ignore
function StatePlayerMachDestroy()
{
    image_speed = 1;
    
    instakillHitbox.canAttack = false;
    flameParticleTimer = 12;
    
    time_source_stop(blurAfterimageTimer);
    time_source_stop(machAfterimageTimer);
    
    instance_destroy(speedlinesEffectId);
    instance_destroy(chargeEffectId);
    
    sound_instance_stop(sndMach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}