SINGLETON;

treasure_found = false;

points = 0;
combo = 0;
secrets_found = 0;

combo_timer = new Timer(6.75, time_source_units_seconds, function() {
    combo = 0;
});

showtime_timer = new Timer(60, time_source_units_seconds, function() {
    show_debug_message("Out Of Time")
});

var hud_data = room_get_info(rm_levelhud_setup, false, true, true, true, false, false);

for (var i = 0; i < array_length(hud_data.instances); i++)
{
    var hud_element = hud_data.instances[i];
    var hud_object = asset_get_index(hud_element.object_index);
    
    with (instance_create(hud_element.x, hud_element.y, hud_object))
    {
        if (hud_element.pre_creation_code != -1)
            hud_element.pre_creation_code();
        
        image_index = hud_element.image_index;
        image_speed = hud_element.image_speed;
        image_xscale = hud_element.xscale;
        image_yscale = hud_element.yscale;
        image_angle = hud_element.angle;
        image_blend = hud_element.colour;
        
        if (hud_element.creation_code != -1)
            hud_element.creation_code();
    } 
}


//instance_create(GAME_WIDTH - 115, 100, obj_hud_tv);
//instance_create(0, 384, obj_hud_pointsbook);