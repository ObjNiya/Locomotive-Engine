var painting_spr_index = clamp(level_id, 0, sprite_get_number(spr_levelpainting));

draw_set_mask(spr_levelpainting_frame, 1, x, ystart, true);
draw_sprite_ext(spr_levelpainting, painting_spr_index, x, ystart, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_reset_mask();

draw_sprite_ext(sprite_index, 0, x, ystart, image_xscale, image_yscale, image_angle, image_blend, image_alpha);