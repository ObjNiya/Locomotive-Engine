/*global.__insLayers__ = [];

global.__defaultLayerId__ = layer_get_id(DEFAULT_LAYER);

var layers = layer_get_all();
var layer_count = array_length(layers);

var ins_layers = [];
var i = 0;

repeat (layer_count)
{
    var lay = layers[i];
    var lay_name = layer_get_name(lay);
    lay_name = string_lower(lay_name);
    
    if (string_starts_with(lay_name, "instances"))
        array_push(ins_layers, lay);
    
    if (string_pos("secret", lay_name) == 0)
    {
        i++;
        continue;
    }
    
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
}

global.__insLayers__ = array_create(9 * array_length(ins_layers), -1);

array_foreach(ins_layers, function(ins_lay, index) {
    var base_depth = layer_get_depth(ins_lay);
    var i = -4;
    
    repeat (9)
    {
        var ind = (i + 4) * (index + 1);
        
        if (i != 0)
            global.__insLayers__[ind] = layer_create(base_depth + i);
        else
            global.__insLayers__[ind] = ins_lay;
        
        i++;
    }
});
*/
with (all)
{
    if (!PriorityExists(object_index))
        continue;
    
    SetLayer();
}

if (UserEventPostfix != -1)
    UserEventPostfix();
