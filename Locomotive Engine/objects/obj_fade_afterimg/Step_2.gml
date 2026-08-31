event_inherited();

fade -= fadeSpd;
image_alpha = fade;

var odd_frame = (current_time % 2 != 0);
if (odd_frame)
    image_alpha += 0.3;

if (fade <= 0)
    instance_destroy();