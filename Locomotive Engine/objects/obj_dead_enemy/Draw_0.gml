var shake_x = irandom_range(-shake_magnitude, shake_magnitude);
var shake_y = irandom_range(-shake_magnitude, shake_magnitude);

draw_sprite_ext(sprite_index, image_index, x + shake_x + visual_x, y + shake_y + visual_y, image_xscale * visual_xscale, image_yscale * visual_yscale, image_angle + visual_angle, image_blend, image_alpha);