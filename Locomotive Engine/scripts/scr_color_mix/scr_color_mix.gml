enum COLOR_MIX_MODES
{
    MULTIPLY = 0, // Multiplies the base color by the mix color.
    MIX = 1, // Mixes black with the mix color based on the color sum of the base color.
    MIX_ALT = 2, // Mixes the base color with the mix color based on the color sum of the base color.
    OVERLAY = 3, // Mixes the base color with the mix color based on the strength of the mix color.
}

/**
 * Enables the color mix shader and passes in the given arguments into the according uniforms.
 * @parameter {Real} mode Which color mix mode to use as a ```COLOR_MIX_MODES``` enum member.
 * @parameter {Constant.Color} color Which color to mix with the current draw color.
 * @parameter {Bool} inverse Whether or not to inverse the color sum of the current draw color for the ```COLOR_MIX_MODES.MIX``` and ```COLOR_MIX_MODES.MIX_ALT``` mode.
 */
function SetColorMix(mode, strength = 1, color = image_blend, inverse = false)
{
    shader_set(shd_color_mix);
    
    var color_uniform = shader_get_uniform(shd_color_mix, "u_vMixColor");
    var mode_uniform = shader_get_uniform(shd_color_mix, "u_iMixMode");
    var inverse_uniform = shader_get_uniform(shd_color_mix, "u_bMixInverse");
    
    shader_set_uniform_f(color_uniform, color_get_red(color) / 255, color_get_green(color) / 255, color_get_blue(color) / 255, strength);
    shader_set_uniform_i(mode_uniform, int64(mode));
    shader_set_uniform_i(inverse_uniform, inverse);
}