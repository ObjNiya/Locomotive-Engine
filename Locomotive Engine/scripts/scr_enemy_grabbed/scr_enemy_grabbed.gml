/// @ignore
function StateEnemyGrabbedCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = grabbedSpr;
    
    grav = 0;
    hsp = 0;
    movespeed = 0;
    vsp = 0;
}

/// @ignore
function StateEnemyGrabbedDestroy()
{
    grav = 0.5;
}