ds_map_clear(global.prlxData.layerDepths);

struct_foreach(global.prlxData.cfg[PRLX_CFG_TYPES.LAYER], function(name, prlx_layer) {
    prlx_layer.Reset();
});