var spawnpoint_instance = global.spawnpoints[$ target_spawnpoint];

if (!instance_exists(spawnpoint_instance))
{
    with (par_player)
    {
        x = 0;
        y = 0;
    }
    
    show_debug_message("Spawnpoint with name: " + target_spawnpoint + " doesn't exist, setting players X and Y to 0.");
    instance_destroy();
    
    exit;
}

var target_x = 0;
var target_y = 0;

with (spawnpoint_instance)
{
    target_x = (x - sprite_xoffset) + (sprite_width / 2);
    target_y = (y - sprite_yoffset) + (sprite_height);
}

with (par_player)
{
    
    x = target_x - sprite_xoffset;
    y = target_y - sprite_yoffset;
}

instance_destroy();