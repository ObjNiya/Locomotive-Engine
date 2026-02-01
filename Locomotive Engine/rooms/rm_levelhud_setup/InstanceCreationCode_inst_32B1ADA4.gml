var layers = room_get_info(rm_levelhud_setup, false, false, true, true, false, false).layers;
var required_tag = "Pointsbook";

for (var i = 0; i < array_length(layers); i++)
{
    var current_layer = layers[i];
    
    if (string_pos(required_tag, current_layer.name) == 0)
        continue;
    
    var pointsbook_element = string_trim_start(current_layer.name, ["Assets_" + required_tag + "_"]);
    
    for (var j = 0; j < array_length(current_layer.elements); j++)
    {
        if (pointsbook_element == "Stickers")
            array_push(obj_hud_pointsbook.stickers, current_layer.elements[j]);
    }
}