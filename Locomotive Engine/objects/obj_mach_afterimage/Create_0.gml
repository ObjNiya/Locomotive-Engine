event_inherited();

use_alpha = true;
spawner_prev_x = 0;

alarm[0] = 3;
alarm[1] = 15;

color = c_white;

call_later(1, time_source_units_frames, function() {
    color = choose(c_purple, c_yellow);
    
    with (spawner_id)
        other.spawner_prev_x = x;
})