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

alarm[0] = irandom_range(2, 4);