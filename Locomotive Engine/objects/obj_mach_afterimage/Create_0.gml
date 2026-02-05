event_inherited();

image_blend = c_white;

spawner_id = noone;

colors = array_create(3, 0);
colors[0] = #FFCD15;
colors[1] = #6A0099;
colors[2] = #251833;

color_cycle = irandom(2);
flicker_count = 0;
use_alpha = true;

flicker_timer = new Timer(random_range(0.035, 0.065), time_source_units_seconds, function() {
    flicker_count++;
    visible = !visible;
    
    if (flicker_count++ >= 4)
        instance_destroy();
    
    color_cycle = irandom(array_length(colors) - 1);
    flicker_timer.max_time = random_range(0.035, 0.065);
})

flicker_timer.set_ext(1, true);
flicker_timer.start();