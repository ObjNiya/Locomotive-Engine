if (!instance_exists(obj_camera))
{
    view_enabled = false;
    exit;
}

view_enabled = true;

with (obj_camera)
{
    view_visible[viewport] = true;
    view_wport[viewport] = global.baseAppWidth;
    view_hport[viewport] = global.baseAppHeight;
    
    camId = view_camera[viewport];
}