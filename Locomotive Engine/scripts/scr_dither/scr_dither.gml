/**
 * Enables the dithering shader for drawing, which replaces translucency with dithering based on the draw alpha.
 * @parameter {Asset.GMSprite} dither (OPTIONAL) The sprite that dictates the dithering threshold. Defaault is normal dithering.
 */
function DitherSet(dither = spr_dither)
{
    static u_DitherTex = shader_get_sampler_index(shd_dither, "u_DitherTex");
    static u_DitherSize = shader_get_uniform(shd_dither, "u_DitherSize");
    
    shader_set(shd_dither)
    
    texture_set_stage(u_DitherTex, sprite_get_texture(dither, 0))
    shader_set_uniform_f(u_DitherSize, sprite_get_width(dither), sprite_get_height(dither))
}