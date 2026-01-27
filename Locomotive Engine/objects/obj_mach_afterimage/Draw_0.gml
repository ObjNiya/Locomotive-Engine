if (instance_exists(spawner_id || !use_alpha))
    image_alpha = abs(spawner_id.hsp) / 12;
else
    image_alpha = 1;

draw_self();

gpu_set_fog(true, colors[color_cycle], 1, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.5);
gpu_set_fog(false, c_white, 0, 0);