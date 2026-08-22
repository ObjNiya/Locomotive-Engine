/**
 * Enables the dissolve shader and passes in the given arguments into the according uniforms.
 * @parameter {Real} amount By how much to dissolve the next things that are drawn as a scalar.
 * @parameter {Real} static_speed How fast the static looking effect moves as a scalar.
 */
function DissolveSet(amount, static_speed = 1)
{
    shader_set(shd_dissolve);
    
    var dissolve_uniform = shader_get_uniform(shd_dissolve, "u_fdissolveAmt");
    var time_uniform = shader_get_uniform(shd_dissolve, "u_fTime");
    
    shader_set_uniform_f(dissolve_uniform, amount);
    
    var time_in_frames = (current_time * 60) / 1000;
    shader_set_uniform_f(time_uniform, time_in_frames * static_speed);
}