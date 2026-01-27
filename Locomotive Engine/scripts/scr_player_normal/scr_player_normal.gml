/// @ignore
function state_player_normal_start()
{
    if (!grounded)
        sprite_index = spr_fall;
    else if (InputX(INPUT_CLUSTER.NAVIGATION) != 0)
        sprite_index = spr_walk;
}

/// @ignore
function state_player_normal_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var idle = (sign_input_x == 0);
    
    movespeed = 8;
    
    if (sign_image_xscale != sign_input_x)
    {
        hsp = 0;
        if (sign_input_x != 0)
            image_xscale = sign_input_x;
    }
    else
        hsp = approach(hsp, movespeed * InputX(INPUT_CLUSTER.NAVIGATION), 0.5);
    
    if (hsp == 0 || !grounded)
        step_particle_timer.stop();
    else
    {
        if (!step_particle_timer.started)
            step_particle_timer.start();
    }
    
    player_perform_jump(spr_jump)
    
    if (player_perform_taunt())
        return;
    
    if (player_perform_grabdash())
        return;
    
    if (player_perform_machrun())
    {
        movespeed = max(6, abs(hsp));
        return;
    }
    
    image_speed = 1;
    
    if (!grounded)
    {
        if (player_perform_groundpound())
            return;
        
        player_try_jumpstop();
        
        if (equals_to_either(sprite_index, [spr_jump, spr_grabdash_cancel]))
            animation_end(spr_fall);
        else if (sprite_index != spr_grabdash_bump)
            sprite_index = spr_fall;
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 || place_meeting(x, y - 32, obj_solid))
    {
        state_machine_set_state(state_player_crouch());
        return;
    }
    
    if (equals_to_either(sprite_index, [spr_jump, spr_fall, spr_grabdash_cancel]))
    {
        instance_create(x, y + 45, obj_land_cloud_particle);
        sprite_index_set(spr_land, 0);
    }
    
    if (equals_to_either(sprite_index, [spr_land, spr_land_walk]))
    {
        sprite_index = (idle) ? spr_land : spr_land_walk;
        animation_end((idle) ? spr_idle : spr_walk);
        
        return;
    }
    
    if (sprite_index == spr_machslide_end && idle)
    {
        animation_end(spr_idle);
        return;
    }
    
    if (idle)
    {
        sprite_index = spr_idle;
    }
    else
    {
        sprite_index = spr_walk;
        
        var fast_walk_speed = 3;
        var fastest_walk_speed = 6;
        
        var abs_hsp = abs(hsp);
        
        if (movespeed > fastest_walk_speed)
            image_speed = 1.5;
        else if (movespeed > fast_walk_speed)
            image_speed = 1.25;
    }
}

function state_player_normal_end()
{
    image_speed = 1;
    step_particle_timer.stop();
}

/// @description This function will return an array containing the normal states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_normal()
{
    return [state_player_normal_start, state_player_normal_step, state_player_normal_end];
}