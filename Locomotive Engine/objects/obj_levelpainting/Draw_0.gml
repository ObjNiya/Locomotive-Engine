draw_set_mask(spr_levelpainting_frame, 1, x, ystart, true);

if (ripple_speed > 0)
{
    var uvs = sprite_get_uvs(sprite_index, image_index);
    ripple_time += ripple_speed;
    
    shader_set(shd_painting_ripples);
    shader_set_uniform_f(shader_get_uniform(shd_painting_ripples, "u_fTime"), ripple_time);
    shader_set_uniform_f(shader_get_uniform(shd_painting_ripples, "u_vUVs"), uvs[0], uvs[1], uvs[2], uvs[3]);
    
    vh_draw_self();
    shader_reset();
}
else
    vh_draw_self();

draw_reset_mask();
draw_sprite_ext(spr_levelpainting_frame, 0, x, y + visual_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);