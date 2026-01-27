image_alpha -= fade_speed;
if (image_alpha <= 0)
    instance_destroy();

var draw_alpha = (current_time % 2 > 0) ? image_alpha * 1.5 : image_alpha;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, draw_alpha);