/**
 * This function will return what mach stage the player is at depending on their movement speed.
 * @returns {Real}
 * @pure
 */
function player_get_mach_stage()
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
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.Start();

    if (sound_instance_get_playback_state(snd_mach) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(snd_mach);
    
    if (EqualsToAny(sprite_index, spr_mach1, spr_mach2, spr_mach2_jump_intro, spr_mach2_jump, spr_mach3, spr_mach3_jump, spr_mach3_hit_enemy, spr_mach4,
          spr_walljump_intro, spr_walljump, spr_longjump_intro, spr_longjump, spr_sjump_cancel_intro, spr_sjump_cancel))
        return;
    
    if (!grounded)
        sprite_set(spr_mach2_jump_intro, 0);
    else
        sprite_set(spr_mach1, 0);
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
        
        destroy_blocks(x + hsp, y, []);
        ScareEnemies();
        
        instakillmove = true;
        if (PlayerDoInstakill())
            sprite_set(spr_mach3_hit_enemy, 0);
    }
    else
    {
        instakillmove = false;
        
        destroy_blocks(x + hsp, y, [obj_block_metal, obj_block_metal_tiles]);
        hitboxDoAttack(hitbox, "stunEnemy");
    }

    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    movespeed += accel * real(dir == sign_input_x || !mach3) * grounded;
    movespeed = clamp(movespeed, 6, 20);
    hsp = movespeed * dir;
    
    if (panting_spr_time < 2000)
        panting_spr_time++;
    
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
        movespeed = 6;
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
            sprite_set(spr_mach3_hit_wall, 0);
            
            vsp = -6;
            movespeed = -6;
            
            InstanceCreate(x + (dir * 15), y + 10, obj_bump_particle);
            sound_instance_one_shot(sfx_player_mach3_wallcrash, x, y);
            camera.shake_set(20, 0.666);
        }

        return;
    }    
    
    PlayerDoJumpstop();
    
    animation_end_ext((sprite_index == spr_mach1), spr_mach2);
    animation_end_ext((sprite_index == spr_mach2_jump_intro), spr_mach2_jump);
    animation_end_ext((sprite_index == spr_mach3_jump || sprite_index == spr_mach3_hit_enemy), spr_mach3);
    animation_end_ext((sprite_index == spr_longjump_intro), spr_longjump);
    animation_end_ext((sprite_index == spr_walljump_intro), spr_walljump);
    animation_end_ext((sprite_index == spr_machroll_getup), spr_mach2);
    animation_end_ext((sprite_index == spr_sjump_cancel_intro), spr_sjump_cancel);
    
    image_speed = 1;
    
    var roll_getup_spr = (sprite_index == spr_machroll_getup);
  
    if (sound_instance_get_playback_state(snd_mach) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
        sound_instance_start(snd_mach);
    
    var machsnd_ground = grounded;
    var machsnd_state = 0;
    
    if (!mach3)
    {
        machsnd_state = 1;
        
        if (roll_getup_spr)
            machsnd_ground = false;
        else if (!EqualsToAny(sprite_index, spr_longjump_intro, spr_longjump))
            image_speed = (movespeed / 5.5);
        
        if (grounded)
        {
            if (sprite_index != spr_mach1 && !roll_getup_spr)
                sprite_index = spr_mach2;
            else
            	machsnd_state = 0;
            
            if (movespeed >= 12)
            {
                create_flash_effect(true);
                
                if (!roll_getup_spr)
                    sprite_index = spr_mach3;
            }
            
            create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
        }
        else if (!EqualsToAny(sprite_index, spr_longjump_intro, spr_longjump, spr_mach2_jump_intro, spr_mach2_jump, spr_walljump_intro, spr_walljump))
            sprite_set(spr_mach2_jump_intro, 0);
        
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
                create_flash_effect(true);
                
                flame_particle_timer.Start();
                blur_afterimage_timer.Start();
            }
            
            machsnd_state = 3;
            create_particle_repeating(x, y, obj_woosh_particle);
        }
        else if (sprite_index != spr_mach3 && !EqualsToAny(sprite_index, spr_mach3_hit_enemy, spr_mach3_jump, spr_mach3_dashpad) && !roll_getup_spr && !sjump_spr)
            sprite_index = spr_mach3;

        create_particle_repeating(x, y + 45, obj_mach3_cloud_particle);
        
        if (!instance_exists(speedlines_effect_id))
            speedlines_effect_id = create_particle(x, y, obj_speedlines_effect);
        
        if (!instance_exists(charge_effect_id))
            charge_effect_id = create_particle_repeating(x, y , obj_charge_effect);
    }
    
    sound_instance_set_parameter_by_name(snd_mach, "Grounded", machsnd_ground);
    sound_instance_set_parameter_by_name(snd_mach, "State", machsnd_state);
}

/// @ignore
function StatePlayerMachDestroy()
{
    image_speed = 1;
    
    instakillmove = false;
    blur_afterimage_timer.Stop();
    mach_afterimage_timer.Stop();
    flame_particle_timer.Stop();
    
    instance_destroy(speedlines_effect_id);
    instance_destroy(charge_effect_id);
    
    sound_instance_stop(snd_mach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}