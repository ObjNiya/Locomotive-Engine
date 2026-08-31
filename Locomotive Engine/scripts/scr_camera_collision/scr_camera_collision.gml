function PlaceMeetingCamera(x, y, camera_id, prec = true)
{
    var prev_x = self.x;
    var prev_y = self.y;
    
    self.x = x;
    self.y = y;
    
    var x1 = camera_get_view_x(camera_id);
    var y1 = camera_get_view_y(camera_id);
    
    var x2 = x1 + camera_get_view_width(camera_id);
    var y2 = y1 + camera_get_view_height(camera_id);
    
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