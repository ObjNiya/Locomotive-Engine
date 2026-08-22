/**
 * Enables the TV Nauta static shader and passes in the given arguments into the according uniforms.
 * @parameter {Constant.Color} color_to_static Which color of the next things that are drawn to turn into static.
 * @parameter {Constant.Color} static_color The primary color of the static.
 * @parameter {Constant.Color} static_back_color The secondary color of the static.
 */
function NautaStaticSet(color_to_static, static_color, static_back_color)
{
    shader_set(shd_nauta_static);
    
    static time_uniform = shader_get_uniform(shd_nauta_static, "u_fTime");
    static uvs_uniform = shader_get_uniform(shd_nauta_static, "u_vUVs");
    static color_to_static_uniform = shader_get_uniform(shd_nauta_static, "u_vColToStatic");
    static static_back_color_uniform = shader_get_uniform(shd_nauta_static, "u_vStaticBackCol");
    static static_color_uniform = shader_get_uniform(shd_nauta_static, "u_vStaticCol");
    
    shader_set_uniform_f(time_uniform, current_time);
    shader_set_uniform_f(uvs_uniform, 0, 0, 1, 1);
    shader_set_uniform_f(color_to_static_uniform, color_get_red(color_to_static) / 255, color_get_green(color_to_static) / 255, color_get_blue(color_to_static) / 255);
    shader_set_uniform_f(static_back_color_uniform, color_get_red(static_back_color) / 255, color_get_green(static_back_color) / 255, color_get_blue(static_back_color) / 255);
    shader_set_uniform_f(static_color_uniform, color_get_red(static_color) / 255, color_get_green(static_color) / 255, color_get_blue(static_color) / 255);
}


/**
 * Sets the TV Nauta static shaders UV uniform to fix static generation if it's the current shader.
 * @parameter {Asset.GMSprite} sprite The index of the sprite to get the UVs from.
 * @parameter {Real} subimage The sprites sub-image to get the UVs from.
 */
function NautaStaticSetUvs(sprite, subimage)
{
    static uvs_uniform = shader_get_uniform(shd_nauta_static, "u_vUVs");
    var uvs = sprite_get_uvs(sprite, subimage);
    
    shader_set_uniform_f(uvs_uniform, uvs[0], uvs[1], uvs[2] - uvs[0], uvs[3] - uvs[1]);
}