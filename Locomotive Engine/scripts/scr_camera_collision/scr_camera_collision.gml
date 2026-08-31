/**
 * Returns whether or not the current instance is colliding the given camera.
 * @parameter {Real} x The x position of the current instance to check at.
 * @parameter {Real} y The y position of the current instance to check at.
 * @parameter {Id.Camera} camera_id The camera to check collision for.
 * @parameter {Bool} prec (OPTIONAL) Whether or not collision checks with the current instance should be precise. Default is true.
 */
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

/**
 * Returns an array of cameras that the current instance is colliding with.
 * @parameter {Real} x The x position of the current instance to check at.
 * @parameter {Real} y The y position of the current instance to check at.
 */
function CameraPlaceArray(x, y)
{
    var cd_cameras = [];
    
    var camera_count = array_length(global.cameras);
    var i = 0;
    
    repeat (camera_count)
    {
        var cam_id = global.cameras[i].camId;
        if (PlaceMeetingCamera(x, y, cam_id))
            array_push(cd_cameras, cam_id);
        
        i++;
    }
    
    return cd_cameras;
}


/**
 * Returns the ID of the camera the current instance is colliding with **OR** -1 if the current instance is not colliding with any cameras.
 * @parameter {Real} x The x position of the current instance to check at.
 * @parameter {Real} y The y position of the current instance to check at.
 * @returns {Id.Camera|Real}
 */
function CameraPlace(x, y)
{
    var cameras = CameraPlaceArray(x, y);
    
    if (array_length(cameras) == 0)
        return -1;
    else
        return cameras[0];
}