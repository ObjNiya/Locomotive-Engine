/// @ignore
function StateEnemyWalkCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = spr_walk;
    movespeed = 1;
    parryable = true;
}

/// @ignore
function StateEnemyWalkStep()
{
    walk_prefix();
    
    if (animation_end() && sprite_index == spr_turn)
    {
        sprite_index = spr_walk;
        image_xscale *= -1;
        movespeed = 1;
    }
    
    var end_of_floor = !place_meeting_collision(x + sign(image_xscale) * 15, y + 31);
    var touch_wall = place_meeting_collision(x + image_xscale, y, Exclude.SLOPES);
    
    if ((end_of_floor && grounded) || touch_wall)
    {
        if (sprite_exists(spr_turn) && sprite_index != spr_turn)
        {
            sprite_set(spr_turn, 0);
            movespeed = 0;
        }
        else if (!sprite_exists(spr_turn))
            image_xscale *= -1;
    }
    
    hsp = movespeed * image_xscale;
    
    if (animation_end() && grounded)
    {
        InstanceCreate(x, y + 43, obj_cloud_particle);
        image_index = 0;
    }
    
    walk_postfix();
}

/// @ignore
function StateEnemyWalkDestroy()
{
    parryable = false;
}