/// @ignore
function sh_noclip(args)
{
    var player_number = real(args[1]);
    var player = instance_find(obj_player, player_number);
    
    if (player == noone)
        return "ERROR -- The specified player doesn't exist.";
    
    with (player)
        smc_set_state(state_player_noclip);
}

/// @ignore
function meta_noclip()
{
    return
    {
        description: "Makes the player with the specified number noclip.",
        arguments: ["player_number"],
        suggestions: ["0"],
        argumentDescriptions: ["The number of the player to make noclip."]
    }
}

/// @ignore
function sh_game_restart()
{
    game_restart();
}

/// @ignore
function meta_game_restart()
{
    return { description: "Restarts the game." }
}