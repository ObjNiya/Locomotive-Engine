/// @ignore
function state_player_cape_start()
{
    sprite_index = spr_cape;
    image_speed = 0;
    
    grav = 0;
    vert_movespeed = 15;
    
    vert_dir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (vert_dir == 0)
    {
        vsp = 3;
        image_index = 7;
    }
    else
    {
        vsp = 12 * vert_dir;
        image_index = image_number * real(vert_dir == 1);
    }
    
    accel = 0.025;
    vert_accel = 0.8;
    
    blur_afterimage_timer.start();
}

/// @ignore
function state_player_cape_step()
{
    vert_dir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (sprite_index == spr_cape_bounce)
    {
        vsp = 0;
        
        if (animation_end(spr_cape))
        {
            image_xscale *= -1;
            dir = image_xscale;
            
            vsp = vert_movespeed * vert_dir;
            
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
        
        sprite_set(spr_cape_spin, 0);
        image_speed = 1;
        
        sound_instance_start(snd_grabdash);
        
        mach_afterimage_use_alpha = false;
        mach_afterimage_timer.start();

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
            sprite_set(spr_cape_bounce, 0);
            image_speed = 1;
            
            vert_movespeed = max(12, abs(vsp));
            
            mach_afterimage_use_alpha = true;
            mach_afterimage_timer.stop();
        }
        
        return;
    }
    
    if (sprite_index == spr_cape_spin)
    {
        hurt_enemy();
        
        if (animation_end(spr_cape))
        {
            mach_afterimage_use_alpha = true;
            mach_afterimage_timer.stop();
            
            image_speed = 0;
        }
    }
    
    switch (vert_dir)
    {
        case 1: vert_accel = 1.5 break;
        case 0: vert_accel = 0.25 break;
        case -1: vert_accel = 0.75 break;
    }
    
    if (vert_dir != sign(vsp) && vert_dir != 0)
        vert_accel = 1.25;
    
    var target_speed = vert_movespeed * vert_dir;
    var approach_speed = sprite_get_speed(sprite_index);
    
    if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond)
        approach_speed /= game_get_speed(gamespeed_fps);
    
    if (vert_dir == 0)
    {
        target_speed = 3;
        
        if (sprite_index == spr_cape)
            image_index = approach(image_index, 7, approach_speed);
    }
    else if (sprite_index == spr_cape)
        image_index = approach(image_index, (image_number - 1) * real(vert_dir == 1), approach_speed);
    
    vert_movespeed = (vert_dir == 1) ? 20 : 14;
    
    if (movespeed > 16) 
        movespeed += accel;

    vsp = approach(vsp, target_speed, vert_accel);
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