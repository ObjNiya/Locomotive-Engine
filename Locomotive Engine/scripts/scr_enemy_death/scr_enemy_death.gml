/// @ignore
function StateEnemyDeathCreate()
{
    ENEMY_STATE_FAILSAVE;
    sprite_index = stunnedSpr;
}

function StateEnemyDeathStep()
{
    instance_destroy();
}