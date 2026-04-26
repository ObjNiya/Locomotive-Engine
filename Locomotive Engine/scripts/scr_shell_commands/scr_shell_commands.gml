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
        argumentDescriptions: ["The number of the player to make noclip."]
    }
}


/// @ignore
function sh_toggle_collisions()
{
    with (obj_layer_manager)
        set_collision_visible(!show_collisions);
}

/// @ignore
function meta_toggle_collisions()
{
    return
    {
        description: "Toggles the visiblity of collision objects."
    }
}


/// @ignore
function sh_goto_room(args)
{
    var rm = asset_get_index(args[1]);
    var spawn = asset_get_index(args[2]);
    
    if (!queue_room(rm, spawn))
        return;
    
    trans_room(obj_roomtrans_fade, -1);
}

/// @ignore
function meta_goto_room()
{
    return
    {
        description: "Goes to the given room and places every player at the first instance of the given spawn object.",
        arguments: ["room", "spawn"],
        suggestions:
        [
            function()
            {
                var rooms = asset_get_ids(asset_room);
                var room_count = array_length(rooms);
                
                var room_names = [];
                var i = 0;
                
                repeat (room_count)
                {
                    array_push(room_names, room_get_name(rooms[i]));
                    i++;
                }
                
                return room_names;
            },
            
            ["obj_spawn_a", "obj_spawn_b", "obj_spawn_c", "obj_spawn_d", "obj_spawn_e", "obj_spawn_f"]
        ],
        argumentDescriptions: ["The room to go to.", "The spawn point to spawn at."]
    }
}

function sh_set_game_speed (args) {
	var type = args[2] == "microseconds" ? gamespeed_microseconds : gamespeed_fps
	game_set_speed(floor(real(args[1])), type);
}

function meta_set_game_speed() {
	return {
		description: "Set the games framerate, or microseconds per game frame",
		arguments: ["frames/microseconds", "type"],
		suggestions: [
			["60", "16666"],
			["fps", "microseconds"]
		],
		hidden: false,
		deferred: false
	}
}

if (IDE_BUILD)
{
    /// @ignore
    function sh_log_type_set_hidden(args)
    {
        var hidden = (string_lower(args[2]) == "true");
    
        switch (string_lower(args[1]))
        {
            case "info": log_type_set_hidden(LOG_TYPES.INFO, hidden) break;
            case "warning": log_type_set_hidden(LOG_TYPES.WARNING, hidden) break; 
            case "error": log_type_set_hidden(LOG_TYPES.ERROR, hidden) break;       
        }
    }
    
    /// @ignore
    function meta_log_type_set_hidden()
    {
        return
        {
            description: "Lets you set whether or not to hide a certain log type.",
            arguments: ["log_type", "hidden"],
            suggestions:
            [
                ["INFO", "WARNING", "ERROR"],
                ["true", "false"]
            ],
            argumentDescriptions: ["The log type to hide.", "Whether or not to hide it."]
        }
    }
}