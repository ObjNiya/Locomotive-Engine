/// @ignore
function StateEnemyGrabbedCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = grabbedSpr;
    grav = 0;
    movespeed = 0;
    //thrown_blur_afterimage_timer.Start();
}

/// @ignore
function StateEnemyGrabbedStep()
{
    //grabbed_prefix();
    //thrown_blur_afterimage_timer.step();
    //grabbed_postfix();
}

/// @ignore
function StateEnemyGrabbedDestroy()
{
    grav = 0.5;
    //thrown_blur_afterimage_timer.Stop();
}