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