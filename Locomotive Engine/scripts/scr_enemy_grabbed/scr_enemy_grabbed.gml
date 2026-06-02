/// @ignore
function StateEnemyGrabbedCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = stun_sprite;
    thrown_blur_afterimage_timer.Start();
}

/// @ignore
function StateEnemyGrabbedStep()
{
    grabbed_prefix();
    thrown_blur_afterimage_timer.step();
    grabbed_postfix();
}

/// @ignore
function StateEnemyGrabbedDestroy()
{
    thrown_blur_afterimage_timer.Stop();
}