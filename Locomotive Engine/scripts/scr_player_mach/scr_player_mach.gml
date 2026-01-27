/// @description This function will return at what mach stage the player is at (e.x movespeed 12 = 3, movespeed 16 = 4).
/// @returns {Real}
/// @pure
function player_get_mach_stage()
{
    var floor_movespeed = floor(movespeed);
    
    if (sprite_index == spr_mach1)
        return 1;
    else if (floor_movespeed < 12 || (equals_to_either(sprite_index, [spr_longjump_intro, spr_longjump])))
        return 2;
    else if (floor_movespeed < 16)
        return 3;
    else
        return 4;
}

/// @ignore
function state_player_mach_start()
{
    if (!grounded && player_get_mach_stage() <= 2)
        sprite_index_set(spr_mach2_jump_intro, 0);
    else
        sprite_index_set((player_get_mach_stage() <= 2) ? spr_mach1 : spr_mach3, 0); 

    movespeed = max(movespeed, 6);
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.start();
}

/// @ignore
function state_player_mach_step()
{
    var mach_accelerations = [0.1, 0.1, 0.025, 0.1];
    
    var mach_stage = player_get_mach_stage();
    var acceleration = mach_accelerations[mach_stage - 1] * grounded;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    movespeed += acceleration * (sign_input_x == sign_image_xscale || mach_stage <= 2);
    hsp = movespeed * sign_image_xscale;
    
    if (player_perform_taunt())
        return;
        
    if (player_perform_wallclimb())
        return;
    
    if (mach_stage >= 3 && place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_animation());
        
        sprite_index = spr_mach3_hit_wall;
            
        vsp = -6;
        movespeed = -6;
        grounded = false;
        
        return;
    }    
    
    if (player_perform_wallsplat())
        return;

    if (!InputCheck(INPUT_VERB.MACHRUN) && grounded)
    {
        var state = (movespeed >= 8) ? state_player_machslide() : state_player_normal();
        
        state_machine_set_state(state);
        return;
    }
    
    if (sign_input_x == -sign_image_xscale && movespeed >= 8 && grounded)
    {
        state_machine_set_state(state_player_machturn());
        return;
    }
    else if (sign_input_x == -sign_image_xscale && grounded)
        image_xscale *= -1;
    
    player_perform_jump((mach_stage <= 2) ? spr_mach2_jump_intro : spr_mach3_jump);
    
    if (player_perform_grabdash())
        return;
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        state_machine_set_state(state_player_machroll());
        return;
    }
    
    if (mach_stage <= 2 && !equals_to_either(sprite_index, [spr_machroll_getup, spr_mach4, spr_longjump_intro, spr_longjump]))
        image_speed = (movespeed / 5.5);
    else
        image_speed = 1;
    
    if (sprite_index == spr_machroll_getup && animation_end())
        sprite_index = (mach_stage > 2) ? spr_mach3 : spr_mach2;
    
    if (mach_stage == 4)
    {
        if (sprite_index != spr_mach4)
        {
            image_speed = 1;
            sprite_index = spr_mach4;
            
            with (instance_create(x, y, obj_mach4_puff_particle))
                image_xscale = other.image_xscale;
        }
        
        if (!mach4_flame_particle_timer.started)
            mach4_flame_particle_timer.start();
        mach4_flame_particle_timer.step();
        
        if (!blur_afterimage_timer.started)
            blur_afterimage_timer.start();
        
        if (!instance_exists(mach4_woosh_particle_id))
        {
            with (instance_create(x, y, obj_mach4_woosh_particle))
            {
                other.mach4_woosh_particle_id = id;
                image_xscale = other.image_xscale;
            }
        }
    }
    else
        mach4_flame_particle_timer.stop();
    
    var mach3_effects = [obj_speedlines_effect, obj_charge_effect];
    var effect_count = 2;
    
    for (var i = 0; i < effect_count; i++)
    {
        var effect = mach3_effects[i];
        
        if (instance_exists(effect) || mach_stage <= 2)
            continue;
        
        with (instance_create(x, y, effect))
        {
            player_instance = other.id;
            image_xscale = other.image_xscale;
        }
    }
    
    if (!grounded)
    {
        player_try_jumpstop();
        
        if (equals_to_either(sprite_index, [spr_mach1, spr_mach2]))
            sprite_index_set(spr_mach2_jump_intro, 0);
        
        animation_end_ext((sprite_index == spr_mach2_jump_intro), spr_mach2_jump);
        animation_end_ext((sprite_index == spr_mach3_jump), spr_mach3);
        animation_end_ext((sprite_index == spr_longjump_intro), spr_longjump);
        animation_end_ext((sprite_index == spr_walljump_intro), spr_walljump);
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1 && mach_stage > 2)
    {
        state_machine_set_state(state_player_sjump_prepare());
        return;
    }

    if (equals_to_either(sprite_index, [spr_mach2_jump_intro, spr_mach2_jump, spr_longjump_intro, spr_longjump, spr_walljump_intro, spr_walljump]) 
        || (sprite_index == spr_mach1 && animation_end()))
        sprite_index = spr_mach2;
    
    if (equals_to_either(sprite_index, [spr_mach3_jump, spr_sjump_cancel]) || (sprite_index == spr_mach2 && mach_stage == 3))
        sprite_index = spr_mach3;
    
    if (!instance_exists(mach_cloud_particle_id)) 
    {
        var particle = (mach_stage >= 3) ? obj_mach3_cloud_particle : obj_mach2_cloud_particle;
        
        with (instance_create(x, y + 45, particle)) 
        {
            other.mach_cloud_particle_id = id;
            image_xscale = other.image_xscale;
        }
    }
}

/// @ignore
function state_player_mach_end()
{
    image_speed = 1;
    
    mach_afterimage_timer.stop();
    blur_afterimage_timer.stop();
}

/// @description This function will return an array containing the mach states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_mach()
{
    return [state_player_mach_start, state_player_mach_step, state_player_mach_end];
}