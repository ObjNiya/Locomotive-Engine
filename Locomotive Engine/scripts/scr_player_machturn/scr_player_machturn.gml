/// @ignore
function state_player_machturn_start()
{
    sprite_index = (player_get_mach_stage() > 2) ? spr_mach3_turn_intro : spr_mach2_turn_intro;
    image_index = 0;
    
    sound_instance_one_shot(sfx_mach_turn, x, y);
    
    attacking = true;
}

/// @ignore
function state_player_machturn_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * dir;
    
    animation_end_ext((sprite_index == spr_mach2_turn_intro), spr_mach2_turn);
    animation_end_ext((sprite_index == spr_mach3_turn_intro), spr_mach3_turn);
    
    if (movespeed <= 0 && grounded)
    {
        var mach3 = (equals_to_either(sprite_index, [spr_mach3_turn_intro, spr_mach3_turn]));
        
        strength = real(mach3) + 1;
        
        dir *= -1;
        movespeed = (mach3) ? 12 : 10;
        
        image_xscale = dir;
        
        smc_set_state(state_player_mach);
        sprite_index_set((mach3) ? spr_mach3 : spr_mach2, 0);
            
        return;
    }
    
    if (grounded)
        create_particle_repeating(x, y + 45, obj_machturn_particle);
}

/// @ignore
function state_player_machturn_end()
{
    attacking = false;
    strength = 1;
}

/**
 * This function will return an array of the player's machturn state events to be given to the ```smc_set_state``` function to change the player's state.
 * @returns {Array<Function>}
 * @pure
 */
function state_player_machturn()
{
    return [state_player_machturn_start, state_player_machturn_step, state_player_machturn_end];
}