event_inherited();

image_blend = c_white;

spawner_id = noone;

palette_cycle = irandom_range(1, 2);
flicker_count = 0;

use_alpha = true;

flicker_timer = new Timer(irandom_range(2, 4), time_source_units_frames, function() {
    visible = !visible;
    
    if (flicker_count++ >= 4)
        instance_destroy();
    
    palette_cycle = irandom_range(1, 2);
    flicker_timer.max_time = irandom_range(2, 4);
})

flicker_timer.set_ext(1, true);
flicker_timer.start();