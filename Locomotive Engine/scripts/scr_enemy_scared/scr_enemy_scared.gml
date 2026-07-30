/// @ignore
function StateEnemyScaredCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = spr_scared;
    hsp = 0;
    
    if (grounded)
        vsp = -3;
    else
        vsp = 0;
    
    scared_timer.Start();
}

/// @ignore
function StateEnemyScaredStep()
{
    if (instance_exists(obj_player) && obj_player.stateName == "Taunt")
        scared_timer.curTime = 0;
    
    scared_prefix();
    scared_timer.Step();
    scared_postfix();
}

/// @ignore
function StateEnemyScaredDestroy()
{
    scared_timer.Stop();
}