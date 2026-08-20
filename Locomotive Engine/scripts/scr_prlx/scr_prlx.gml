enum PRLX_CFG_TYPES
{
    GLOBAL = 0,
    LAYER = 1,
}

global.prlxData = {
    cfg: array_create(2, {}),
    layerDepths: ds_map_create(),
    biggestCamW: 0,
    biggestCamH: 0
}

__PrlxDefinitions__();


/**
 * Updates Parallax Layers with the given camera index.
 * @parameter {Real} camera_index The index of the camera on the `view_camera` array.
 */
function PrlxStep(camera_index)
{
    if (is_real(camera_index))
        var cam = view_camera[camera_index];
    else
        var cam = camera_index;
    
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);
    
    with (global.prlxData)
    {
        biggestCamW = max(biggestCamW, cam_w);
        biggestCamH = max(biggestCamH, cam_h);
        
        var struct_names = struct_get_names(cfg[PRLX_CFG_TYPES.LAYER]);
        var struct_length = array_length(struct_names);
        var i = 0;
          
        repeat (struct_length)
        {
            cfg[PRLX_CFG_TYPES.LAYER][$ struct_names[i]].Step(camera_index);
            i++;
        }
    }

}