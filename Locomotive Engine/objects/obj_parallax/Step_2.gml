camera_x_previous = camera_x;
camera_y_previous = camera_y;

camera_x = camera_get_view_x(view_camera[0]) - (camera_get_view_width(view_camera[0]) / 2);
camera_y = camera_get_view_y(view_camera[0]) - (camera_get_view_height(view_camera[0]) / 2);

var layers = layer_get_all();
var layer_count = array_length(layers);

for (var i = 0; i < layer_count; i++)
{
    var current_layer = layers[i];
    
    var parallax_multiplier = (1 / (1 + layer_get_depth(current_layer) / 33.33)) / 8;
    
    var layer_xspeed = (camera_x_previous - camera_x) * parallax_multiplier;
    var layer_yspeed = (camera_y_previous - camera_y) * parallax_multiplier;
    
    var layer_name = layer_get_name(current_layer);
    
    if (string_pos("Still_H", layer_name))
    {
        var layer_background = layer_background_get_id(current_layer);
        var layer_xscroll = (current_time / 33.33) * layer_get_hspeed(current_layer);
        
        if (layer_background != -1)
        {
            var background_sprite = layer_background_get_sprite(layer_background);
            var background_width = sprite_get_width(background_sprite);
            
            var background_still_x = parallax_calculate_still_position(camera_x, background_width, GAME_WIDTH, room_width);
            layer_x(current_layer, background_still_x + layer_xscroll);
        }
        else
            layer_x(current_layer, camera_x + layer_xscroll);
    }
    else
        layer_x(current_layer, layer_get_x(current_layer) + layer_xspeed);
    
    if (string_pos("Still_V", layer_name))
    {
        var layer_background = layer_background_get_id(current_layer);
        var layer_yscroll = (current_time / 33.33) * layer_get_vspeed(current_layer);
        
        if (layer_background != -1)
        {
            var background_sprite = layer_background_get_sprite(layer_background);
            var background_height = sprite_get_height(background_sprite);
            
            var background_still_y = parallax_calculate_still_position(camera_y, background_height, GAME_HEIGHT, room_height);
            layer_y(current_layer, background_still_y + background_height / 2 + layer_yscroll);
        }
        else
            layer_y(current_layer, camera_y + layer_yscroll);
    }
    else
        layer_y(current_layer, layer_get_y(current_layer) + layer_yspeed);
}