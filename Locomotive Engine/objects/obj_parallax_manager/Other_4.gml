var layers = layer_get_all();

array_foreach(layers, function(value, index) {
    var lay_depth = layer_get_depth(value);
    
    if (is_undefined(global.prlxData.layerDepths[? lay_depth]))
        global.prlxData.layerDepths[? lay_depth] = [];
    
    array_push(global.prlxData.layerDepths[? lay_depth], value);
    
    var name = layer_get_name(value);
    if (!is_undefined(global.prlxData.cfg[PRLX_CFG_TYPES.LAYER][$ name]))
        global.prlxData.cfg[PRLX_CFG_TYPES.LAYER][$ name].Create(name);
});