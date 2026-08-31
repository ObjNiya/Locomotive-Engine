var shell_open = (instance_exists(obj_shell) && obj_shell.isOpen);

if (global.canPause && !global.gamePaused && InputPressed(INPUT_VERB.PAUSE) && !shell_open)
    GamePause(true);

if (global.gamePaused)
    exit;

var tilemap_func = function(tilemap, index)
{
    with (obj_player)
    {
        if (place_meeting(x, y, tilemap))
            obj_game_manager.scrtTsCircleRadius = lerp(obj_game_manager.scrtTsCircleRadius, global.baseAppHeight, 0.15);
        else
            obj_game_manager.scrtTsCircleRadius = lerp(obj_game_manager.scrtTsCircleRadius, 0, 0.15);
    }
}

array_foreach(scrtTilemaps, tilemap_func);