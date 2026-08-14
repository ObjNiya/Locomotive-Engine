/// @ignore
function StateEnemyStunnedCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = spr_stunned;
    
    stunned_timer.maxTime = 200;
    stunned_timer.Start();
}

/// @ignore
function StateEnemyStunnedStep()
{
    if (instance_exists(obj_player) && obj_player.stateName == "Taunt" && grounded)
        stunned_timer.curTime = 0;
    
    visualXScale = Approach(visualXScale, 1, 0.03);
    visualYScale = Approach(visualYScale, 1, 0.03);
    
    if (unstunableBuffer > 0)
        unstunableBuffer--;
    
    movespeed = Approach(movespeed, 0, 0.3);
    hsp = movespeed * -image_xscale;
    
    if (movespeed > 4 && grounded)
        create_particle_repeating(x, y + 43, obj_machturn_particle);
}

/// @ignore
function StateEnemyStunnedDestroy()
{
    visualXScale = 1;
    visualYScale = 1;
    
    stunned_timer.Stop();
}

/// @ignore
function StateEnemyStunnedDraw()
{
    bird.draw();
}