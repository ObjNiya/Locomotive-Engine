set_collision_visible(show_collisions);

layers = layer_get_all();

var layer_count = array_length(layers);
var i = 0;

var closest_depth = -50;
var furthest_depth = 0;

repeat (layer_count)
{
    var lay = layers[i];
    var lay_name = layer_get_name(lay);
    
    /*if (string_starts_with(lay_name, "Tiles_Secret"))
    {
        var lay_num = string_digits(lay_name);
        
        if (lay_num != "")
        {
            lay_num = real(lay_num);
            var cur_depth = -50 * lay_num;
            
            layer_depth(lay, cur_depth);
            if (cur_depth < closest_depth)
                closest_depth = cur_depth;
            
            log("obj_layer_manager - room start", LOG_LEVELS.INFO, ["Giving layer: ", lay_name, " a depth of: ", cur_depth]);
        }
        else
        {
            closest_depth -= 50;
            layer_depth(lay, closest_depth);
            
            log("obj_layer_manager - room start", LOG_LEVELS.INFO, [lay_name, "Has no number, so it will be given the closest depth which is: ", closest_depth]);
        }
    }*/
    
       
    if (string_pos("Secret", layer_get_name(lay)) == 0)
    {
        i++;
        break;
    }
    
    layer_script_begin(lay, function() {
        if (event_type == ev_draw && event_number == ev_draw_normal)
        {
            shader_set(shd_secret_tiles);
            
            shader_set_uniform_f(scrt_ts_pos_uniform, global.scrt_ts_circle_x, global.scrt_ts_circle_y);
            shader_set_uniform_f(scrt_ts_radius_uniform, global.scrt_ts_circle_radius);
        }
    });
    
    layer_script_end(lay, function() {
        if (event_type == ev_draw && event_number == ev_draw_normal)
            shader_reset();
    })
}