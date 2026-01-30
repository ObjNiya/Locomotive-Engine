draw_sprite_ext(sprite_index, image_index, x, ystart, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_set_mask(sprite_index, 1, x, ystart, true);
draw_sprite(painting, 0, x, ystart);
draw_reset_mask()