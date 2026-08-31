function PlaceMeetingCamera(x, y, camera_id_or_index, prec = true)
{
    var cam = camera_id_or_index;
    if (is_real(cam) && cam >= 0 && cam <= 7 && view_visible[cam])
        cam = view_camera[cam];
    else if (is_real(cam))
        Log(PlaceMeetingCamera, LOG_TYPES.ERROR, "Given camera index is outside of the camera indes bounds. (0 to 7)");
    
    var prev_x = self.x;
    var prev_y = self.y;
    
    self.x = x;
    self.y = y;
    
    var x1 = camera_get_view_x(cam);
    var y1 = camera_get_view_y(cam);
    
    var x2 = x1 + camera_get_view_width(cam);
    var y2 = y1 + camera_get_view_height(cam);
    
    var result = collision_rectangle(x1, y1, x2, y2, id, true, false);
    
    self.x = prev_x;
    self.y = prev_y;
    
    return result != noone;
}


function CameraPlaceArray(x, y)
{
    var i = 0;
    var cameras = [];
    
    repeat (7)
    {
        if (PlaceMeetingCamera(x, y, i))
            array_push(cameras, view_camera[i]);
        
        i++;
    }
    
    return cameras;
}


function CameraPlace(x, y)
{
    var cameras = CameraPlaceArray(x, y);
    
    if (array_length(cameras) == 0)
        return -1;
    else
        return cameras[0];
}

