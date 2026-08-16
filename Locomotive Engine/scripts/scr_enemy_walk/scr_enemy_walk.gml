/// @ignore
function StateEnemyWalkCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = walkSpr;
    movespeed = 1;
    //parryable = true;
}

/// @ignore
function StateEnemyWalkStep()
{
    //walk_prefix();
    
    if (sprite_index == turnSpr)
    {
        if (!AnimationEnd())
        {
            hsp = 0;
            return;
        }
        
        sprite_index = walkSpr;
        image_xscale *= -1;
    }
    
    
    var end_of_floor = !place_meeting_collision(x + sign(image_xscale) * 15, y + 31);
    var touch_wall = place_meeting_collision(x + image_xscale, y, Exclude.SLOPES);
    
    if ((end_of_floor && grounded) || touch_wall)
    {
        if (turnSpr != -1)
            SpriteSet(turnSpr, 0);
        else
            image_xscale *= -1;
    }
    
    hsp = movespeed * image_xscale;
    
    if (!AnimationEnd() || !grounded)
        return;
    
    InstanceCreate(x, y + 43, obj_cloud_particle);
    image_index = 0;
    
    //walk_postfix();
}

/// @ignore
function StateEnemyWalkDestroy()
{
    //parryable = false;
}