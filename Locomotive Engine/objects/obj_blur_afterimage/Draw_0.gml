image_alpha -= fade_speed;
if (image_alpha <= 0)
    instance_destroy();

var draw_alpha = image_alpha;

if (++lifespan % 2 > 0)
    draw_alpha *= 0.2;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, draw_alpha);