var layers = layer_get_all();
var layer_func = function(lay, index)
{
    var lay_name = layer_get_name(lay), tilemap = layer_tilemap_get_id(lay);
    lay_name = string_lower(lay_name);
    
    if (string_pos("secret", lay_name) == 0 || tilemap  == -1)
        return;
    
    var lay_begin = function()
    {
        if (event_type != ev_draw || event_number != ev_draw_normal)
            return;
        
        var player = global.cameras[view_current].followTarget;
        
        static radius_uniform = shader_get_uniform(shd_secret_tiles, "u_fCircleRadius");
        static pos_uniform = shader_get_uniform(shd_secret_tiles, "u_vCirclePos");
        
        shader_set(shd_secret_tiles);
        
        shader_set_uniform_f(radius_uniform, obj_game_manager.scrtTsCircleRadius);
        shader_set_uniform_f(pos_uniform, player.x, player.y);
    }
    
    var lay_end = function()
    {
        if (event_type == ev_draw && event_number == ev_draw_normal)
            shader_reset();
    }
    
    layer_script_begin(lay, lay_begin);
    layer_script_end(lay, lay_end);
    
    array_push(scrtTilemaps, tilemap)
}

array_foreach(layers, layer_func);
ShowCollisions(collisionVisible);