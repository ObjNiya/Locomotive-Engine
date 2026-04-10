/// @ignore
function Camera(instance_to_follow) constructor
{
    var view = 0;
    
    while (view_camera[view] == -1)
    {
        if (view++ > 7)
        {
            log(Camera, LOG_TYPES.WARNING, ["Camera limit reached! Camera with target ", instance_to_follow, " will not be added."])
            return;
        }    
    }
    
    viewport = view;
    id = camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT);
    
    target = instance_to_follow;

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
    
    width = GAME_WIDTH;
    height = GAME_HEIGHT;
    
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
        if (!view_enabled)
            view_enabled = true;
        
        view_visible[viewport] = true;
        view_wport[viewport] = GAME_WIDTH;
        view_hport[viewport] = GAME_HEIGHT;
        view_camera[viewport] = id;
    }
    
    static step = function()
    {
        // Calculate certain attributes
        
        if (!zoom_locked)
            zoom = 1 * array_get_sum(zoom_offsets);
        
        width = GAME_WIDTH * zoom;
        height = GAME_HEIGHT * zoom;
        
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
    
    static destroy = function()
    {
        camera_destroy(id);
        
        view_visible[viewport] = false;
        view_camera[viewport] = -1;
    }
}