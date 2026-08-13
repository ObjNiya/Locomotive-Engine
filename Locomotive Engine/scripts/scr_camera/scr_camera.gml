function Camera() constructor
{
    var cur_viewport = 0;
    
    while (global.viewport_taken[cur_viewport])
    {
        if (cur_viewport++ > 7)
        {
            Log(Camera, LOG_TYPES.WARNING, "All viewports are already occupied, returning -1.");
            return -1;
        }
    }
    
    global.viewport_taken[cur_viewport] = true;
    viewport = cur_viewport;
    
    id = view_camera[viewport];
    target = other.id;
    
    fmod_studio_system_set_num_listeners(viewport);
    fmod_attr = new Fmod3DAttributes();
    
    with (fmod_attr)
    {
        forward.z = 1;
        up.y = 1; 
    }
    
    x = 0;
    x_locked = false;
    x_offsets = [];
    
    y = 0;
    y_locked = false;
    y_offsets = [];
    
    zoom = 1;
    zoom_locked = false;
    zoom_offsets = [1];
    
    width = global.baseAppWidth;
    height = global.baseAppHeight;
    
    shake_mag = 0;
    shake_mag_deccel = 0;

    static add_x_offset = function(offset_value)
    {
        array_push(x_offsets, offset_value);
        return array_length(x_offsets) - 1;
    }
    
    static remove_x_offset = function(offset_index)
    {
        array_delete(x_offsets, offset_index, 1);
    }
    
    static add_y_offset = function(offset_value)
    {
        array_push(y_offsets, offset_value);
        return array_length(y_offsets) - 1;
    }
    
    static remove_y_offset = function(offset_index)
    {
        array_delete(y_offsets, offset_index, 1);
    }
    
    static add_zoom_offset = function(offset_value)
    {
        array_push(zoom_offsets, offset_value);
        return array_length(zoom_offsets) - 1;
    }
    
    static remove_zoom_offset = function(offset_index)
    {
        array_delete(zoom_offsets, offset_index, 1);
    }
    
    static properties_set_locked = function(lock_x, lock_y, lock_zoom)
    {
        x_locked = lock_x;
        y_locked = lock_y;
        zoom_locked = lock_zoom;
    }
    
    static shake_set = function(shake_magnitude, shake_magnitude_decceleration)
    {
        shake_mag = shake_magnitude;
        shake_mag_deccel = shake_magnitude_decceleration;
    }
    
    static room_start = function()
    {
        view_visible[viewport] = true;
        view_wport[viewport] = global.baseAppWidth;
        view_hport[viewport] = global.baseAppHeight;
        view_xport[viewport] = global.baseAppHeight * viewport;
        
        while (view_xport[viewport] > global.appVisualWidth)
        {
            view_xport[viewport] -= global.baseAppWidth * 2;
            view_yport[viewport] += global.baseAppHeight;
        }
        
        id = view_camera[viewport];
        
        if (id == -1)
        {
            id = camera_create_view(0, 0, width, height);
            view_camera[viewport] = id;
        }
    }
    
    array_push(global.cameras, self);
}

function CameraStep(camera_to_update)
{
    with (camera_to_update)
    {
        if (!zoom_locked)
            zoom = 1 * array_get_sum(zoom_offsets);
        
        width = global.baseAppWidth * zoom;
        height = global.baseAppHeight * zoom;
        
        camera_set_view_size(id, width, height);
        
        shake_mag = approach(shake_mag, 0, shake_mag_deccel);
        
        var target_exists = instance_exists(target);
        
        var cam_x_center = width / 2;
        var cam_y_center = height / 2;
        
        if (!x_locked && target_exists)
        {
            x = (target.x + array_get_sum(x_offsets)) - cam_x_center;
            x = clamp(x, 0, room_width - width);
        }
        
        if (!y_locked && target_exists)
        {
            y = (target.y + array_get_sum(y_offsets)) - (50 + cam_y_center);
            y = clamp(y, 0, room_height - height);
        }
         
        var fin_x = x + irandom_range(-shake_mag, shake_mag);
        var fin_y = y + irandom_range(-shake_mag, shake_mag);
        
        camera_set_view_pos(id, fin_x, fin_y);
        
        with (fmod_attr.position)
        {
            x = fin_x + cam_x_center;
            y = fin_y + cam_y_center;
        }
        
        fmod_studio_system_set_listener_attributes(viewport, fmod_attr);
    }
}

function CameraDestroy(camera_to_delete)
{
    var cam_index = array_get_index(global.cameras, camera_to_delete);
    array_delete(global.cameras, cam_index, 1);
    
    view_visible[camera_to_delete.viewport] = false;
    global.viewport_taken[camera_to_delete.viewport] = false;
}