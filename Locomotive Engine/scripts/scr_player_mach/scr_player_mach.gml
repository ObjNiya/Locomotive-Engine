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
        dir = sign(visual_xscale);
    
    acceleration = 0.1;
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.start();
    
    if (!grounded && player_get_mach_stage() <= 2)
    {
        sprite_index_set(spr_mach2_jump_intro, 0);
        return;
    }
    
    switch (player_get_mach_stage())
    { 
        case 1: sprite_index_set(spr_mach1, 0) break; 
        case 2: sprite_index = spr_mach2 break;
        case 3:
        case 4:     
            sprite_index = spr_mach3; 
            break;
        
    }

    sound_instance_start(snd_mach);
    
    attacking = true;
}

/// @ignore
function state_player_mach_step()
{
    var accelerations = [0.1, 0.1, 0.025, 0.1];
    
    var mach_stage = player_get_mach_stage();
    acceleration = accelerations[mach_stage - 1] * grounded;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    movespeed += acceleration * (sign_input_x == dir || mach_stage <= 2);
    movespeed = median(6, movespeed, 20);
    
    hsp = movespeed * dir;
    
    if (sound_instance_get_playback_state(snd_mach) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
        sound_instance_start(snd_mach);
    
    sound_instance_set_parameter_by_name(snd_mach, "State", mach_stage - 1);
    sound_instance_set_parameter_by_name(snd_mach, "Grounded", grounded);
    
    if (mach_stage >= 3)
        scare_enemy();
    
    with (obj_hud_tv)
    {
        if (state_step == state_tv_idle_step && mach_stage >= 3)
            hud_tv_trigger_expression("mach" + string(mach_stage));
    }
    
    if (player_check_can_jump())
    {
        player_setup_mach_jump();
        return;
    }
    
    if (player_check_can_uppercut())
    {
        state_machine_set_state(state_player_uppercut());
        return;
    }
    
    if (player_check_can_grabdash())
    {
        state_machine_set_state(state_player_grabdash());
        return;
    }
    
    if (player_check_can_taunt())
    {
        state_machine_store_state();
        state_machine_set_state(state_player_taunt());
        
        return;
    }
    
    if (player_check_can_crouch() || player_check_can_dive())
    {
        state_machine_set_state(state_player_machroll());
        return;
    }
    
    if (player_check_can_cape())
    {
        state_machine_set_state(state_player_cape());
        return;
    }
    
    if (player_check_can_sjump_prepare())
    {
        state_machine_set_state(state_player_sjump_prepare());
        return;
    }
    
    if (player_check_can_machturn())
    { 
        state_machine_set_state(state_player_machturn());
        return;
    }
    else if (player_check_can_machinstaturn())
    {
        dir *= -1;
        visual_xscale = dir;
        
        movespeed = min(movespeed, 6);
    }
    
    if (player_check_can_machslide())
    {
        state_machine_set_state(state_player_machslide());
        return;
    }
    else if (player_check_can_machstop())
    {
        state_machine_set_state(state_player_normal());
        return;
    }
        
    if (player_check_can_wallclimb())
    {
        state_machine_set_state(state_player_wallclimb());
        return;
    }
    
    if (player_check_hit_wall())
    {
        if (mach_stage <= 2)
            player_setup_wallsplat();
        else
            player_setup_wallcrash();

        return;
    }    
    
    mach_afterimage_timer.start()
    if (!grounded)
        player_try_jumpstop();
    
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
            strength = 1;
            
            if (!grounded && !equals_to_either(sprite_index, [spr_mach2_jump_intro, spr_mach2_jump, spr_longjump_intro, spr_longjump, spr_walljump_intro, spr_walljump]))
                sprite_index_set(spr_mach2_jump_intro, 0);
            
            if (sprite_index == spr_mach1)
                animation_end(spr_mach2);
            else if (play_regular_sprite)
                sprite_index = spr_mach2;
            
            if (equals_to_either(sprite_index, [spr_mach1, spr_mach2]))
                image_speed = (movespeed / 5.5);
            
            if (grounded)
                create_particle_repeating(x, y + 45, obj_mach2_cloud_particle);
            break;
        
        case 3:
        case 4:
            strength = 2;
            
            var camera_extend = 250 * dir;
            var camera_extend_speed = mach_stage / 2;
            
            //extend_camera_horizontal(camera_extend, camera_extend_speed);
            
            if (mach_stage >= 4 && !equals_to_either(sprite_index, [spr_longjump_intro, spr_longjump]))
            {
                if (sprite_index != spr_mach4)
                {
                    sprite_index = spr_mach4;
                    
                    create_particle(x, y, obj_mach4_puff_particle);
                    create_afterimage(x, y, obj_flash_afterimage);
                }
                
                create_particle_repeating(x, y, obj_woosh_particle);
                
                flame_particle_timer.start();
                blur_afterimage_timer.start();
            }
            else if (play_regular_sprite)
                sprite_index = spr_mach3;
            
            animation_end_ext((sprite_index == spr_sjump_cancel_intro), spr_sjump_cancel);
            
            if (grounded || equals_to_either(sprite_index, [spr_sjump_cancel_intro, spr_sjump_cancel, spr_mach3_jump, spr_mach4]))
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
    
    attacking = false;
    strength = 1;
}

/**
 * This function will return an array of the player's mach state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_mach()
{
    return [state_player_mach_start, state_player_mach_step, state_player_mach_end];
}