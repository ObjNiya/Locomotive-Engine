draw_set_mask(spr_levelpainting_frame, 1, x, ystart, true);

if (rippleSpeed > 0)
{
    var uvs = sprite_get_uvs(sprite_index, image_index);
    rippleTime += rippleSpeed;
    
    shader_set(shd_painting_ripples);
    shader_set_uniform_f(shader_get_uniform(shd_painting_ripples, "u_fTime"), rippleTime);
    shader_set_uniform_f(shader_get_uniform(shd_painting_ripples, "u_vUVs"), uvs[0], uvs[1], uvs[2], uvs[3]);
    
    VhDrawSelf();
    shader_reset();
}
else
    VhDrawSelf();

draw_reset_mask();
draw_sprite_ext(spr_levelpainting_frame, 0, x, y + visualY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);