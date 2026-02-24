/// @ignore
function Camera(id, target) constructor
{
    self.id = id;
    
    update_func = camera_end_step;
    
    listener = -1;
    fmod_3d_attributes = new Fmod3DAttributes();
    
    with (fmod_3d_attributes)
    {
        forward.z = 1;
        up.y = 1;
    }
    
    self.target = target;
    
    x_extend = 0;
    x_extend_speed = 0.2;
    x_extend_target = 0;
    
    y_extend = 0;
    y_extend_speed = 0.2;
    y_extend_target = 0;
    
    shake_magnitude = 0;
    shake_deccel = 0.1;
    
    zoom = 1;
    zoom_target = 1;
    zoom_speed = 0.1;
}

/**
 * This function will add a dynamic camera with automatic functionality for extending, shaking and zooming.
 * @parameter {Id.Instance|Asset.GMObject} target The instance or object for the camera to follow.
 * @returns {Id.Camera}
 */
function add_camera(target)
{
    var viewport = 0;
    
    while (view_camera[viewport] == -1 && viewport <= 7)
        viewport++;
    
    if (viewport > 7)
    {
        trace("Reached camera limit!");
        return;
    }
    
    var camera = camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT, 0);
    
    with (obj_camera_system)
    {
        array_push(cameras, new Camera(camera, target));
        
        var camera_index = array_length(cameras) - 1;
        
        camera_indices[viewport] = camera_index;
        ds_map_add(camera_map, camera, camera_index);
        
        set_up_viewports();
    }
    
    fmod_studio_system_set_num_listeners(viewport);
    fmod_studio_system_set_listener_weight(viewport, 0);
    
    return camera;
}

/**
 * This function will delete the given camera, removing it from the screen.
 * @parameter {Id.Camer} camera The camera to delete.
 */
function delete_camera(camera)
{
    with (obj_camera_system)
    {
        var camera_index = ds_map_find_value(camera_map, camera);
        var camera_ind_index = array_get_index(camera_indices, camera_index);
        
        camera_destroy(camera);
        
        array_delete(cameras, camera_index, 1);
        ds_map_delete(camera_map, camera);
        
        camera_indices[camera_ind_index] = -1;
        
        view_visible[camera_ind_index] = false;
        //view_enabled[camera_indices_index] = false;
        
        view_wport[camera_ind_index] = 0;
        view_hport[camera_ind_index] = 0;
        
        view_camera[camera_ind_index] = -1;
        
        fmod_studio_system_set_num_listeners(fmod_studio_system_get_num_listeners() - 1);
    }
}

/// @ignore
function camera_end_step()
{
    with (obj_camera_system)
    {
        var camera_index = camera_indices[view_current];

        if (camera_index == -1)
            return;
        
        with (cameras[camera_index])
        {
            x_extend = approach(x_extend, x_extend_target, x_extend_speed);
            y_extend = approach(y_extend, y_extend_target, y_extend_speed);
            
            shake_magnitude = approach(shake_magnitude, 0, shake_deccel);
            zoom = lerp(zoom, zoom_target, zoom_speed);
            
            if (!instance_exists(target))
                return;
            
            var camera_width = GAME_WIDTH * zoom;
            var camera_height = GAME_HEIGHT * zoom;
            
            camera_set_view_size(id, camera_width, camera_height);
            
            var camera_x_origin = camera_get_view_width(id) / 2;
            var camera_x_shake = irandom_range(-shake_magnitude, shake_magnitude);
            var camera_x = clamp(target.x + camera_x_shake - camera_x_origin, 0, room_width - camera_width);

            var camera_y_origin = camera_get_view_height(id) / 2;
            var camera_y_shake = irandom_range(-shake_magnitude, shake_magnitude);
            var camera_y = clamp(target.y + camera_y_shake - camera_y_origin, 0, room_height - camera_height);

            camera_set_view_pos(id, camera_x, camera_y);
            
            with (fmod_3d_attributes.position)
            {
                x = camera_x + camera_x_origin;
                y = camera_y + camera_y_origin;
            }
            
            fmod_studio_system_set_listener_attributes(view_current, fmod_3d_attributes);
        }
    }
}

/**
 * This function lets you set how far the given camera extends on the x axis.
 * @parameter {Id.Camera} camera Which camera to extend on the x axis.
 * @parameter {Real} extend_target How far to extend the camera on the x axis.
 * @parameter {Real} extend_speed The speed at which the camera will extend on the x axis.
 */
function camera_set_x_extend(camera, extend_target, extend_speed)
{
    with (obj_camera_system)
    {
        var camera_index = ds_map_find_value(camera_map, camera);
        
        cameras[camera_index].x_extend_target = extend_target;
        cameras[camera_index].x_extend_speed = extend_speed;
    }
}

/**
 * This function lets you set how far the given camera extends on the y axis.
 * @parameter {Id.Camera} camera Which camera to extend on the y axis.
 * @parameter {Real} extend_target How far to extend the camera on the y axis.
 * @parameter {Real} extend_speed The speed at which the camera will extend on the y axis.
 */
function camera_set_y_extend(camera, extend_target, extend_speed)
{
    with (obj_camera_system)
    {
        var camera_index = ds_map_find_value(camera_map, camera);
        
        cameras[camera_index].y_extend_target = extend_target;
        cameras[camera_index].y_extend_speed = extend_speed;
    }
}

/**
 * This function lets you set how much the given camera should shake around it's follow target.
 * @parameter {Id.Camera} camera Which camera to shake.
 * @parameter {Real} shake_magnitude By how many pixels the camera will shake around it's follow target.
 * @parameter {Rea} shake_deccel By how much the shaking should deccelerate each frame until it reaches 0.
 */
function camera_set_shake(camera, shake_magnitude, shake_deccel)
{
    with (obj_camera_system)
    {
        var camera_index = ds_map_find_value(camera_map, camera);
        
        cameras[camera_index].shake_magnitude = shake_magnitude;
        cameras[camera_index].shake_deccel = shake_deccel;
    }
}