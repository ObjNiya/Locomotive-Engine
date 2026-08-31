var part_lay_keys = ds_map_keys_to_array(global.partLayers);

array_foreach(part_lay_keys, function(key, index) {
    part_system_layer(global.partLayers[? key].system, PriorityGetLay(key, false));
});