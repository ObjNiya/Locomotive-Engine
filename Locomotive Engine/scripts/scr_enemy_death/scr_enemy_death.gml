/// @ignore
function StateEnemyDeathCreate()
{
    ENEMY_STATE_FAILSAVE;
    sprite_index = spr_stunned;
}

function StateEnemyDeathStep()
{
    instance_destroy();
}