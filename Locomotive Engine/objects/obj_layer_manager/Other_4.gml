set_collision_visible(show_collisions);

var ins_layers = layer_get_all();
var ins_layer_count = array_length(ins_layers);

for (var i = 0; i < ins_layer_count; i++;)
{
    var lay_name = string_lower(layer_get_name(ins_layers[i]));
    
    while (string_pos("instances", lay_name) == -1)
    {
        array_delete(ins_layers, i, 1);
        lay_name = string_lower(layer_get_name(ins_layers[i]));
    }
}

var mid_depth = floor(array_length(ins_layers) / 2);
mid_depth = ins_layers[mid_depth];

global.baseDepth = layer_get_depth(mid_depth);
QuickLog(global.baseDepth)

with (all)
{
    var my_depth = ObjGetDepth(object_index);
    if (is_undefined(my_depth))
        my_depth = ObjGetDepth(object_get_parent(object_index));
    if (is_undefined(my_depth))
        continue;
    
    
    var lay_depth = (layer_exists(layer_get_name(layer))) ? layer_get_depth(layer_get_name(layer)) : global.baseDepth;
    //layer = -1;
    QuickLog(object_index, " ", lay_depth + my_depth);
    depth = my_depth;
}    


/*
layers = layer_get_all();

var layer_count = array_length(layers);
var i = 0;

var closest_depth = -50;
var furthest_depth = 0;

var scrt_ts_lay_count = 0;

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
            
            shader_set_uniform_f(scrt_ts_pos_uniform, global.ScrtTsCircleX, global.ScrtTsCircleY);
            shader_set_uniform_f(scrt_ts_radius_uniform, global.ScrtTsCircleRadius);
        }
    });
    
    layer_script_end(lay, function() {
        if (event_type == ev_draw && event_number == ev_draw_normal)
            shader_reset();
    })
}