/// @ignore
function state_player_machturn_start()
{
    sprite_index = (player_get_mach_stage() > 2) ? spr_mach3_turn_intro : spr_mach2_turn_intro;
    image_index = 0;
}

/// @ignore
function state_player_machturn_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * sign(image_xscale);
    
    animation_end_ext((sprite_index == spr_mach2_turn_intro), spr_mach2_turn);
    animation_end_ext((sprite_index == spr_mach3_turn_intro), spr_mach3_turn);
    
    if (movespeed <= 0 && grounded)
    {
        var mach3 = (equals_to_either(sprite_index, [spr_mach3_turn_intro, spr_mach3_turn]));
        
        image_xscale *= -1;
        
        movespeed = (mach3) ? 12 : 10;
        
        state_machine_set_state(state_player_mach());
        sprite_index_set((mach3) ? spr_mach3 : spr_mach2, 0);
            
        return;
    }
    
    if (instance_exists(mach_cloud_particle_id) || !grounded)
        return;
    
    with (instance_create(x, y + 45, obj_machturn_particle)) 
    {
        other.mach_cloud_particle_id = id;
        image_xscale = other.image_xscale;
    }
}

/// @description This function will return an array containing the machturn states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_machturn()
{
    return [state_player_machturn_start, state_player_machturn_step, -1];
}