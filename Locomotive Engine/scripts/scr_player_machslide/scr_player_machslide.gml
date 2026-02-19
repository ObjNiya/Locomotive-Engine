/// @ignore
function state_player_machslide_start()
{
    sprite_index = spr_machslide_intro;
    image_index = 0;
    
    sound_instance_one_shot(sfx_mach_brake, x, y);
    
    attacking = true;
}

/// @ignore
function state_player_machslide_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * dir;
    
    if (movespeed <= 0)
    {
        smc_set_state(state_player_normal);
        sprite_index_set(spr_machslide_end, 0);
        
        return;
    }
    
    if (PLAYER_HIT_WALL)
    {
        player_setup_wallsplat();
        return;
    }
    
    animation_end_ext((sprite_index == spr_machslide_intro), spr_machslide);
    
    if (grounded)
        create_particle_repeating(x, y + 45, obj_machturn_particle);
}

/// @ignore
function state_player_machslide_end()
{
    attacking = false;
}

/**
 * This function will return an array of the player's machslide state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_machslide()
{
    return [state_player_machslide_start, state_player_machslide_step, state_player_machslide_end];
}