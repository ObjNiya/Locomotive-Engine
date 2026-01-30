/// @ignore
function state_player_normal_start()
{
    if (!grounded)
    {
        sprite_index = spr_fall;
        return;
    }
    
    sprite_index = (InputX(INPUT_CLUSTER.NAVIGATION) == 0) ? spr_idle : spr_walk;
}

/// @ignore
function state_player_normal_step()
{
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    var acceleration = 0.5;
    
    var idle = (sign_input_x == 0);
    
    movespeed = 8;
    
    if (sign_input_x != dir)
    {
        dir = sign_input_x;
        hsp = 0;
    }
    else
        hsp = approach(hsp, movespeed * dir, acceleration);
    
    if (player_check_can_grabdash())
    {
        state_machine_set_state(state_player_grabdash());
        return;
    }
    
    if (player_check_can_taunt())
    {
        state_machine_set_state(state_player_taunt());
        return;
    }
    
    visual_xscale = side(dir, visual_xscale);
    image_speed = 1;
    
    if (grounded)
    {
        if (player_check_can_jump())
        {
            player_setup_jump();
            return;
        }
        
        if (player_check_can_machrun())
        {
            state_machine_set_state(state_player_mach());
            movespeed = max(6, abs(hsp));
            
            return;
        }
        
        if (player_check_can_crouch())
        {
            state_machine_set_state(state_player_crouch());
            return;
        }
        
        var start_land_animation = equals_to_either(sprite_index, [spr_jump, spr_fall, spr_grabdash_cancel, spr_grabdash_bump]);
        var land_animation = equals_to_either(sprite_index, [spr_land, spr_land_walk]);
        
        if (start_land_animation)
        {
            image_index = 0;
            land_animation = true;
            
            instance_create(x, y + 45, obj_land_cloud_particle);
        }
        
        if (idle)
        {
            cloud_particle_timer.stop();
            
            if (sprite_index == spr_machslide_end || land_animation)
            {
                sprite_index = spr_land;
                animation_end(spr_idle);
                
                return;
            }
            
            var idle_animations = [spr_idle_animation1, spr_idle_animation2];
            var idle_animation_count = 1;
            
            static idle_anim_timer = 90;
            
            if (idle_anim_timer-- <= 0)
            {
                sprite_index_set(idle_animations[irandom(idle_animation_count)], 0);
                idle_anim_timer = 90;
                
                return;
            }
            
            for (var i = 0; i < idle_animation_count; i++)
            {
                if (sprite_index == idle_animations[i])
                {
                    animation_end(spr_idle);
                    return;
                }
            }
            
            sprite_index = spr_idle;
            return;
        }
        
        cloud_particle_timer.start();
        
        var image_speed_curve = [1, 1.25, 1.5];
        
        var image_speed_curve_index = floor(abs(hsp) / 3);
        image_speed_curve_index = clamp(image_speed_curve_index, 0, array_length(image_speed_curve) - 1);
        
        image_speed = image_speed_curve[image_speed_curve_index];
        
        if (land_animation)
        {
            sprite_index = spr_land_walk;
            animation_end(spr_walk);
            
            return;
        }
        
        sprite_index = spr_walk;
        
        return;
    }
    
    player_try_jumpstop();
    
    if (player_check_can_groundpound())
    {
        state_machine_set_state(state_player_groundpound());
        return;
    }
    
    if (equals_to_either(sprite_index, [spr_jump, spr_grabdash_cancel]))
        animation_end(spr_fall);
    else if (!equals_to_either(sprite_index, [spr_fall, spr_grabdash_bump]))
        sprite_index = spr_fall;
    
    cloud_particle_timer.stop();
}

/// @ignore
function state_player_normal_end()
{
    image_speed = 1;
    
    cloud_particle_timer.stop();
}

/**
 * This function will return an array of the player's normal state events to be given to the ```state_machine_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_normal()
{
    return [state_player_normal_start, state_player_normal_step, state_player_normal_end];
}