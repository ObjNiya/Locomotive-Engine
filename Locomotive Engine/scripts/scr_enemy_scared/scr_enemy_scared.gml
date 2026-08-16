/// @ignore
function StateEnemyScaredCreate()
{
    ENEMY_STATE_FAILSAVE;
    
    sprite_index = scaredSpr;
    hsp = 0;
    
    if (grounded)
        vsp = -3;
    else
        vsp = 0;
    
    scaredTimer = 84;
}

/// @ignore
function StateEnemyScaredStep()
{
    if ((instance_exists(obj_player) && obj_player.stateName == "Taunt") || --scaredTimer <= 0)
        SmcSetState("Walk");
}

/// @ignore
function StateEnemyScaredDestroy()
{
    
}