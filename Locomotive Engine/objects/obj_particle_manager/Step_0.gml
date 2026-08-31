if (global.gamePaused)
    exit;

var part_lay_keys = ds_map_keys_to_array(global.partLayers);

array_foreach(part_lay_keys, function(key, index) {
    part_system_update(global.partLayers[? key].system);
});