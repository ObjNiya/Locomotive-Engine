/// @ignore
function StateEnemyStunnedCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = stunnedSpr;
    stunnedTimer = 200;
}

/// @ignore
function StateEnemyStunnedStep()
{
    unstunnableTime--;
    stunnedTimer--;
    
    if (instance_exists(obj_player) && obj_player.stateName == "Taunt" && grounded)
        stunnedTimer = 0;
    
    if (stunnedTimer <= 0)
    {
        SmcSetState("Walk");
        return;
    }
    
    visualXScale = Approach(visualXScale, 1, 0.03);
    visualYScale = Approach(visualYScale, 1, 0.03);
    
    movespeed = Approach(movespeed, 0, 0.3);
    hsp = movespeed * dir;
    
    if (movespeed > 4 && grounded)
        create_particle_repeating(x, y + 43, obj_machturn_particle);
}

/// @ignore
function StateEnemyStunnedDestroy()
{
    visualXScale = 1;
    visualYScale = 1;
}

/// @ignore
function StateEnemyStunnedDraw()
{
    stunBird.Draw(x, y - 40);
}