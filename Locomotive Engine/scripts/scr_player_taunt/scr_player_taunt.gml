function state_player_taunt_start()
{
    stored_sprite_index = sprite_index;
    stored_image_index = image_index;
    
    sprite_index_set(spr_taunt, irandom(sprite_get_number(spr_taunt)));
    
    stored_vsp = vsp;
    stored_hsp = hsp;
    stored_movespeed = movespeed;
    
    grav = 0;
    vsp = 0;
    hsp = 0;
    movespeed = 0;
    
    with (instance_create(x, y, obj_taunt_particle))
        player_instance = other.id;
    
    taunt_timer.start();
}

function state_player_taunt_step()
{
    taunt_timer.step();
    
}

function state_player_taunt()
{
    return [state_player_taunt_start, state_player_taunt_step, -1];
}
