/// @ignore
function state_enemy_walk_start()
{
    sprite_index_set(walk_sprite, 0);
}

/// @ignore
function state_enemy_walk_step()
{
    if (!place_meeting(x + hsp, y + 1, obj_solid))
        image_xscale *= -1;
    
    hsp = movespeed * sign(image_xscale);
    
    if (animation_end())
    {
        instance_create(x, y + 43, obj_cloud_particle);
        image_index = 0;
    }
}

/// @ignore
function state_enemy_walk_end()
{
    
}

function state_enemy_walk()
{
    return [state_enemy_walk_start, state_enemy_walk_step, state_enemy_walk_end];
}