/// @ignore
function state_player_ladder_start()
{
    sprite_index = spr_ladder_up;
    image_speed = 0;
    
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vert_movespeed = 6;
    
    cloud_particle_timer.start();
}

/// @ignore
function state_player_ladder_step()
{
    vert_dir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    image_speed = 1;
    cloud_particle_timer.set_paused(true);
    
    switch (vert_dir)
    {
        case -1:
            sprite_index = spr_ladder_up;
            cloud_particle_timer.set_paused(false);
            vert_movespeed = 6;
            break;
        case 0:
            sprite_index = spr_ladder_up;
            image_speed = 0;
            break;
        case 1:
            sprite_index = spr_ladder_down;
            image_speed = -1;
            vert_movespeed = 10;
            break;
    }
    
    vsp = vert_movespeed * vert_dir;
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        smc_set_state(state_player_normal);
        sprite_set(spr_jump, 0);
        vsp = -11;
        
        if (vert_dir == 1)
        {
            vsp = 10;
            sprite_index = spr_fall;
        }
        
        return;
    }
    
    if (!instance_exists(ladder_id) || !place_meeting(x, y, ladder_id) || (grounded && vert_dir == 1 && !place_meeting(x, y, obj_platform)))
    {
        vsp = 0;
        smc_set_state(state_player_normal);
    }
}

/// @ignore
function state_player_ladder_end()
{
    ladder_id = noone;
    cloud_particle_timer.set_paused(false);
    cloud_particle_timer.stop();
    
    image_speed = 1;
    image_index = 0;
}

/**
 * This function will return an array of the player ladder state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_ladder()
{
    return [state_player_ladder_start, state_player_ladder_step, state_player_ladder_end];
}