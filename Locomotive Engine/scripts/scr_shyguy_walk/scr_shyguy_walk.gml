/// @ignore
function StateShyguyWalkCreate()
{
    StateEnemyWalkCreate();
}

/// @ignore
function StateShyguyWalkStep()
{
    StateEnemyWalkStep();
    TryHurtPlayer(HitboxPlace(attackHitbox, obj_player, "hitbox"), self);
}

/// @ignore
function StateShyguyWalkDestroy()
{
    StateEnemyWalkDestroy();
}