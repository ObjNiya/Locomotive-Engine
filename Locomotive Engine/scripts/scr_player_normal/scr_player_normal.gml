/// @ignore
function state_player_normal_start()
{
    movespeed = 8;
    accel = 0.5;
    
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
    var idle = (sign_input_x == 0);
    
    if (sign_input_x != dir || sign(hsp) == -dir)
    {
        dir = sign_input_x;
        hsp = 0;
    }
    else
        hsp = approach(hsp, movespeed * dir, accel);
    
    if (PLAYER_UPPERCUT)
    {
        smc_set_state(state_player_uppercut);
        return;
    }
    
    if (PLAYER_GRABDASH)
    {
        smc_set_state(state_player_grabdash);
        return;
    }
    
    if (PLAYER_TAUNT)
    {
        smc_set_state(state_player_taunt);
        return;
    }
    
    image_xscale = side(dir, image_xscale);
    image_speed = 1;
    
    if (grounded)
    {
        if (PLAYER_JUMP)
        {
            player_setup_jump();
            return;
        }
        
        if (PLAYER_MACHRUN)
        {
            smc_set_state(state_player_mach);
            movespeed = max(6, abs(hsp));
            
            return;
        }
        
        if (PLAYER_CROUCH)
        {
            smc_set_state(state_player_crouch);
            return;
        }
        
        var start_land_animation = equals_to_any(sprite_index, [spr_jump, spr_fall, spr_grabdash_cancel, spr_grabdash_bump, spr_stomp, spr_stomp_fall]);
        var land_animation = equals_to_any(sprite_index, [spr_land, spr_land_walk]);
        
        if (start_land_animation)
        {
            image_index = 0;
            land_animation = true;
            
            instance_create(x, y + 45, obj_land_cloud_particle);
            sound_instance_one_shot(sfx_step, x, y);
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
                sprite_set(idle_animations[irandom(idle_animation_count)], 0);
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
    
    cloud_particle_timer.stop();
    
    var combat_id = COMBAT_GET_MEETING;
    
    if (combat_id != noone && combat_id.stun_function(id))
    {
        sprite_set(spr_stomp, 0);
        
        vsp = (InputCheck(INPUT_VERB.JUMP)) ? -14 : -9;
    }
    
    player_routine_jumpstop();
    
    if (PLAYER_GROUNDPOUND)
    {
        smc_set_state(state_player_groundpound);
        return;
    }
    
    if (equals_to_any(sprite_index, [spr_stomp, spr_stomp_fall]))
    {
        animation_end(spr_stomp_fall);
        return;
    }
    
    var force_fall_animation = !equals_to_any(sprite_index, [spr_jump, spr_grabdash_cancel]);
    
    if (animation_end(spr_fall) || force_fall_animation)
        sprite_index = spr_fall;
}

/// @ignore
function state_player_normal_end()
{
    image_speed = 1;
    
    cloud_particle_timer.stop();
}

/**
 * This function will return an array of the player's normal state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_normal()
{
    return [state_player_normal_start, state_player_normal_step, state_player_normal_end];
}