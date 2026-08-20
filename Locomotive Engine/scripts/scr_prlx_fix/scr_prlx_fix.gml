// The original layer_get_id_at_depth function has an issue which causes it to segfault, so I have to fix it myself (Thank you GameMaker devs)
function __layer_get_id_at_depth__(depth)
{
    if (!is_undefined(global.prlxData.layerDepths[? depth]))
        return global.prlxData.layerDepths[? depth];
    else
        return -1;
}

#macro layer_get_id_at_depth __layer_get_id_at_depth__