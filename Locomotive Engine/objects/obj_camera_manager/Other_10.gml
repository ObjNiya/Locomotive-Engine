if (ArrayIsEmpty(global.cameras))
{
    view_enabled = false;
    exit;
}

view_enabled = true;

array_foreach(global.cameras, function(camera, index) {
    with (camera)
    {
        view_visible[viewport] = true;
        view_wport[viewport] = global.baseAppWidth;
        view_hport[viewport] = global.baseAppHeight;
        
        camId = view_camera[viewport];
    }
});