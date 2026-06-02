#macro PLAYER_STATE_FAILSAVE if (object_index != obj_player) { SmcSetState("None") Log(object_index, LOG_TYPES.WARNING, "Attempted to enter a player state despite not being a player! Setting state to none...") return }

/**
 * This function will attack the given Player, meant to be exclusively called by obj_hitbox.
 * @parameter {Instance.Id} player Which Player instance to attack.
 * @parameter {Instance.Id} attacker_id The instance that Player was attacked by.
 */
function AttackPlayer(player, attacker_id)
{
    if (player.object_index != obj_player)
        return;
    
    with (player)
    {
       
    }
}