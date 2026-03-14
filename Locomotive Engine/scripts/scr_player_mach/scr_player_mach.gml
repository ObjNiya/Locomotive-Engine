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
function state_player_mach_start()
{
    movespeed = max(movespeed, 6);
    if (dir == 0)
        dir = sign(image_xscale);
    
    accel = 0.1;
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.start();
    
    if (!grounded && player_get_mach_stage() <= 2)
    {
        sprite_set(spr_mach2_jump_intro, 0);
        return;
    }
    
    switch (player_get_mach_stage())
    { 
        case 1: sprite_set(spr_mach1, 0) break; 
        case 2: sprite_index = spr_mach2 break;
        case 3:
        case 4:     
            sprite_index = spr_mach3; 
            break;
        
    }

    if (sound_instance_get_playback_state(snd_mach) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING)
        sound_instance_start(snd_mach);
}

/// @ignore
function state_player_mach_step()
{
    var accels = [0.1, 0.1, 0.025, 0.1];
    
    var mach_stage = player_get_mach_stage();
    accel = accels[mach_stage - 1] * grounded;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    movespeed += accel * (sign_input_x == dir || mach_stage <= 2);
    movespeed = median(6, movespeed, 20);
    
    hsp = movespeed * dir;
    
    destroy_blocks(x + hsp, y, (mach_stage < 3) ? [obj_block_metal, obj_block_metal_tiles] : []);
    
    if (sound_instance_get_playback_state(snd_mach) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
        sound_instance_start(snd_mach);
    
    sound_instance_set_parameter_by_name(snd_mach, "State", mach_stage - 1);
    sound_instance_set_parameter_by_name(snd_mach, "Grounded", grounded);
    
    if (mach_stage >= 3)
        scare_enemy();
    
    with (obj_hud_tv)
    {
        if (state_id == state_tv_idle && mach_stage >= 3)
            hud_tv_trigger_expression("mach" + string(mach_stage));
    }
    
    if (player_do_jump(false, (mach_stage <= 2) ? spr_mach2_jump_intro : spr_mach3_jump))
        return;

    if (player_do_grabdash())
        return;
    if (player_do_uppercut())
        return;
    
    if (PLAYER_TAUNT)
    {
        smc_store_state();
        smc_set_state(state_player_taunt);
        
        return;
    }
    
    if (PLAYER_CROUCH || PLAYER_DIVE)
    {
        smc_set_state(state_player_machroll);
        return;
    }
    
    if (player_do_cape())
        return;
    
    if (PLAYER_SJUMP_PREPARE)
    {
        smc_set_state(state_player_sjump_prepare);
        return;
    }
    
    if (player_do_machturn())
        return;
    else if (PLAYER_MACHINSTATURN)
    {
        dir *= -1;
        image_xscale = dir;
        
        movespeed = min(movespeed, 6);
    }
    
    if (player_do_machslide())
        return;
    else if (PLAYER_MACHSTOP)
    {
        smc_set_state(state_player_normal);
        return;
    }
        
    if (PLAYER_WALLCLIMB)
    {
        smc_set_state(state_player_wallclimb);
        return;
    }
    
    if (PLAYER_HIT_WALL)
    {
        if (mach_stage <= 2)
            player_do_wallsplat();
        else
        {
            smc_set_state(state_player_animation);
            sprite_set(spr_mach3_hit_wall, 0);
            
            vsp = -6;
            movespeed = -6;
        }

        return;
    }    
    
    mach_afterimage_timer.start()
    player_do_jumpstop();
    
    animation_end_ext((sprite_index == spr_mach2_jump_intro), spr_mach2_jump);
    animation_end_ext((sprite_index == spr_mach3_jump), spr_mach3);
    animation_end_ext((sprite_index == spr_longjump_intro), spr_longjump);
    animation_end_ext((sprite_index == spr_walljump_intro), spr_walljump);
    animation_end_ext((sprite_index == spr_machroll_getup), spr_mach2);
    
    image_speed = 1;
    
    var play_regular_sprite = (grounded && sprite_index != spr_machroll_getup);
    
    switch (mach_stage)
    {
        case 1:
        case 2:
            stun_enemy();
            
            if (!grounded && !equals_to_any(sprite_index, [spr_mach2_jump_intro, spr_mach2_jump, spr_longjump_intro, spr_longjump, spr_walljump_intro, spr_walljump]))
                sprite_set(spr_mach2_jump_intro, 0);
            
            if (sprite_index == spr_mach1)
                animation_end(spr_mach2);
            else if (play_regular_sprite)
                sprite_index = spr_mach2;
            
            if (equals_to_any(sprite_index, [spr_mach1, spr_mach2]))
                image_speed = (movespeed / 5.5);
            
            if (grounded)
                create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
            break;
        
        case 3:
        case 4:
            hurt_enemy();
            
            var camera_extend = 250 * dir;
            var camera_extend_speed = mach_stage / 2;
            
            //extend_camera_horizontal(camera_extend, camera_extend_speed);
            
            animation_end_ext((sprite_index == spr_mach3_hit_enemy), spr_mach3);
            
            if (mach_stage >= 4 && !equals_to_any(sprite_index, [spr_longjump_intro, spr_longjump]))
            {
                if (sprite_index != spr_mach4)
                {
                    sprite_index = spr_mach4;
                    
                    create_particle(x, y, obj_mach4_puff_particle);
                    create_flash_effect(true);
                }
                
                create_particle_repeating(x, y, obj_woosh_particle);
                
                flame_particle_timer.start();
                blur_afterimage_timer.start();
            }
            else if (play_regular_sprite && sprite_index != spr_mach3_hit_enemy)
                sprite_index = spr_mach3;
            
            animation_end_ext((sprite_index == spr_sjump_cancel_intro), spr_sjump_cancel);
            
            if (grounded || equals_to_any(sprite_index, [spr_sjump_cancel_intro, spr_sjump_cancel, spr_mach3_jump, spr_mach4]))
            {
                create_particle_repeating(x, y + 45, obj_mach3_cloud_particle);
                
                if (!instance_exists(speedlines_effect_id))
                    speedlines_effect_id = create_particle(x, y, obj_speedlines_effect);
                
                if (!instance_exists(charge_effect_id))
                    charge_effect_id = create_particle_repeating(x, y , obj_charge_effect);
            }
            break;
        
    }
}

/// @ignore
function state_player_mach_end()
{
    image_speed = 1;
    
    blur_afterimage_timer.stop();
    mach_afterimage_timer.stop();
    flame_particle_timer.stop();
    
    instance_destroy(speedlines_effect_id);
    instance_destroy(charge_effect_id);
    
    sound_instance_stop(snd_mach, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    //extend_camera_horizontal(0, 2);
}

/**
 * This function will return an array of the player's mach state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_mach()
{
    return [state_player_mach_start, state_player_mach_step, state_player_mach_end];
}