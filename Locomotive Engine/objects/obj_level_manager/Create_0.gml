event_inherited();

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

instance_create(GAME_WIDTH - 115, 100, obj_hud_tv);
instance_create(0, 0, obj_hud_pointsbook);