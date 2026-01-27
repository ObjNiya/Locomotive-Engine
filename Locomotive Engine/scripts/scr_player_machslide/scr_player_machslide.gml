/// @ignore
function state_player_machslide_start()
{
    sprite_index = spr_machslide_intro;
    image_index = 0;
}

/// @ignore
function state_player_machslide_step()
{
    movespeed = approach(movespeed, 0, 0.4);
    hsp = movespeed * sign_image_xscale;
    
    if (movespeed <= 0)
    {
        state_machine_set_state(state_player_normal());
        sprite_index_set(spr_machslide_end, 0);
        
        return;
    }
    
    if (player_perform_wallsplat())
        return;
    
    animation_end_ext((sprite_index == spr_machslide_intro), spr_machslide);
    
    if (instance_exists(mach_cloud_particle_id) || !grounded)
        return;
    
    with (instance_create(x, y + 45, obj_machturn_particle)) 
    {
        other.mach_cloud_particle_id = id;
        image_xscale = other.image_xscale;
    }
}

/// @description This function will return an array containing the machslide states start, step and end event in order.
/// @returns {Array<Function>}
/// @pure
function state_player_machslide()
{
    return [state_player_machslide_start, state_player_machslide_step, -1];
}