/// @ignore
function state_player_cape_start()
{
    sprite_index = spr_cape;
    image_speed = 0;
    
    grav = 0;
    
    vertical_dir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    vertical_movespeed = 15;
    
    acceleration = 0.025;
    vertical_acceleration = 0.8;
    
    if (vertical_dir == 0)
    {
        vsp = 3;
        image_index = 7;
    }
    else
    {
        vsp = 12 * vertical_dir;
        image_index = image_number * real(vertical_dir == 1);
    }
    
    blur_afterimage_timer.start();
    sound_instance_one_shot(sfx_damian_cape_start, x, y);
    create_flash_effect(true);
}

/// @ignore
function state_player_cape_step()
{
    vertical_dir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (sprite_index == spr_cape_bounce)
    {
        vsp = 0;
        
        if (animation_end(spr_cape))
        {
            image_xscale *= -1;
            dir = image_xscale;
            
            vsp = vertical_movespeed * vertical_dir;
            
            image_speed = 0;
        }
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        smc_set_state(state_player_cape_fall);
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH))
    {
        dir = side(sign(InputX(INPUT_CLUSTER.NAVIGATION)), image_xscale);

        movespeed += 0.5 * (dir == image_xscale);
        movespeed = median(12, movespeed, 20);
        
        image_xscale = dir;
        
        sprite_index_set(spr_cape_spin, 0);
        image_speed = 1;
        
        sound_instance_start(snd_grabdash);
        
        mach_afterimage_use_alpha = false;
        mach_afterimage_timer.start();
        
        attacking = true;
        strength = 2;
        
        return;
    }
    
    if (PLAYER_TAUNT)
    {
        smc_set_state(state_player_taunt);
        return;
    }
    
    if (grounded)
    {
        smc_set_state(state_player_machroll);
        return;
    }
    
    if (PLAYER_HIT_WALL)
    {
        if (sprite_index == spr_cape_spin)
        {
            image_xscale *= -1;
            dir *= -1;
        }
        else
        {
            sprite_index_set(spr_cape_bounce, 0);
            image_speed = 1;
            
            vertical_movespeed = max(12, abs(vsp));
            
            mach_afterimage_use_alpha = true;
            mach_afterimage_timer.stop();
        }
        
        return;
    }
    
    if (sprite_index == spr_cape_spin && animation_end(spr_cape))
    {
        mach_afterimage_use_alpha = true;
        mach_afterimage_timer.stop();
        
        image_speed = 0;
        
        attacking = false;
    }
    
    switch (vertical_dir)
    {
        case 1: vertical_acceleration = 1.5 break;
        case 0: vertical_acceleration = 0.25 break;
        case -1: vertical_acceleration = 0.75 break;
    }
    
    if (vertical_dir != sign(vsp) && vertical_dir != 0)
        vertical_acceleration = 1.25;
    
    var target_speed = vertical_movespeed * vertical_dir;
    var approach_speed = sprite_get_speed(sprite_index);
    
    if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond)
        approach_speed /= game_get_speed(gamespeed_fps);
    
    if (vertical_dir == 0)
    {
        target_speed = 3;
        
        if (sprite_index == spr_cape)
            image_index = approach(image_index, 7, approach_speed);
    }
    else if (sprite_index == spr_cape)
        image_index = approach(image_index, (image_number - 1) * real(vertical_dir == 1), approach_speed);
    
    vertical_movespeed = (vertical_dir == 1) ? 20 : 14;
    
    if (movespeed > 16) 
        movespeed += acceleration;

    vsp = approach(vsp, target_speed, vertical_acceleration);
    hsp = movespeed * dir;
}

/// @ignore
function state_player_cape_end()
{
    image_speed = 1;
    
    grav = 0.5;
    
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.stop();
    blur_afterimage_timer.stop();
    
    attacking = false;
    strength = 1;
}

/**
 * This function will return an array of the player cape state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_cape()
{
    return [state_player_cape_start, state_player_cape_step, state_player_cape_end];
}