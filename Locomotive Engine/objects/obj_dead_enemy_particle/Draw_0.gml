var shake_x = irandom_range(-shake_magnitude, shake_magnitude);
var shake_y = irandom_range(-shake_magnitude, shake_magnitude);

draw_sprite_ext(sprite_index, image_index, x + shake_x, y + shake_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);