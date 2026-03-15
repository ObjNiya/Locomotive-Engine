/*var painting_spr_index = clamp(level_id, 0, sprite_get_number(spr_levelpainting));

draw_set_mask(spr_levelpainting_frame, 1, x, ystart, true);

shader_set(shd_painting_ripples)
shader_set_uniform_f(shader_get_uniform(shd_painting_ripples, "u_fTime"), current_time / 1000);

var uvs = sprite_get_uvs(spr_levelpainting, painting_spr_index);
shader_set_uniform_f(shader_get_uniform(shd_painting_ripples, "u_vUVs"), uvs[0], uvs[1], uvs[2], uvs[3]);

draw_sprite_ext(spr_levelpainting, painting_spr_index, x, ystart, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();

draw_reset_mask();



draw_sprite_ext(sprite_index, 0, x, ystart, image_xscale, image_yscale, image_angle, image_blend, image_alpha);