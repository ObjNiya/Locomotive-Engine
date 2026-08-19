var layers = layer_get_all();

global.baseDepth = 0;

array_foreach(layers, function(lay, index) {
    var name = string_lower(layer_get_name(lay));
    
    if (name == string_lower(LAYER_DEPTH_BASE))
        global.baseDepth = layer_get_depth(lay);
    
    if (string_pos("secret", name) == -1)
        return;
    
    layer_script_begin(lay, function() {
        if (event_type != ev_draw || event_number != ev_draw_normal)
            return;
        
        shader_set(shd_secret_tiles);
        
        var circ_rad_uniform = shader_get_uniform(shd_secret_tiles, "u_fCircleRadius");
        var circ_pos_uniform = shader_get_uniform(shd_secret_tiles, "u_vCirclePos");
        
        shader_set_uniform_f(circ_rad_uniform, global.ScrtTsCircleRadius);
        shader_set_uniform_f(circ_pos_uniform, global.ScrtTsCircleX, global.ScrtTsCircleY);
    });
    
    layer_script_end(lay, function() {
        if (event_type == ev_draw && event_number == ev_draw_normal)
            shader_reset();
    });
});


with (all)
{
    if (!ObjDepthExists(object_index))
        continue;
    
    DepthSet();
    Log(obj_layer_manager, LOG_TYPES.INFO, "Setting ", object_index, "s depth to: ", depth)
}