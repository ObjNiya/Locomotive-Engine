function add_camera(target)
{
    var viewport = 0;
    
    while (view_get_camera(viewport) == -1 && viewport <= 7)
        viewport++;
    
    if (viewport > 7)
    {
        show_debug_message("Reached camera limit");
        return;
    }
    
    var camera = camera_create_view(0, 0, GAME_WIDTH, GAME_HEIGHT, 0);
    
    with (obj_camera_manager)
    {
        array_push(cameras, {
            id: camera,
            update_func: camera_end_step,
            
            target: target,
            
            x_extend: 0,
            x_extend_speed: 0.2,
            x_extend_target: 0,
            
            y_extend: 0,
            y_extend_speed: 0.2,
            y_extend_target: 0,
            
            shake_magnitude: 0,
            shake_speed: 0.1,
            
            zoom: 1,
            zoom_speed: 0.1,
            zoom_target: 1
        });
        
        camera_indices[viewport] = array_length(cameras) - 1;
        
        set_up_viewports();
    }
    
    return camera;
}

function delete_camera(camera)
{
    with (obj_camera_manager)
    {
        var camera_count = array_length(cameras);
        var camera_index = -1;
        
        for (var i = 0; i < camera_count && camera_index == -1; i++)
        {
            if (cameras[i].id == camera)
                camera_index = i;
        }
        
        var camera_indices_index = array_get_index(camera_indices, camera_index);
        
        camera_destroy(camera);
        
        array_delete(cameras, camera_index, 1);
        camera_indices[camera_indices_index] = -1;
        
        view_visible[camera_indices_index] = false;
        view_enabled[camera_indices_index] = false;
        
        view_wport[camera_indices_index] = 0;
        view_hport[camera_indices_index] = 0;
        
        view_camera[camera_indices_index] = -1;
    }
}

function camera_end_step()
{
    with (obj_camera_manager)
    {
        var camera_index = camera_indices[view_current];

        if (camera_index == -1)
            return;
        
        with (cameras[camera_index])
        {
            x_extend = approach(x_extend, x_extend_target, x_extend_speed);
            y_extend = approach(y_extend, y_extend_target, y_extend_speed);
            
            shake_magnitude = approach(shake_magnitude, 0, shake_speed);
            zoom = lerp(zoom, zoom_target, zoom_speed);
            
            if (!instance_exists(target))
                return;
            
            var camera_width = GAME_WIDTH * zoom;
            var camera_height = GAME_HEIGHT * zoom;
            
            camera_set_view_size(id, camera_width, camera_height);
            
            var camera_x_shake = irandom_range(-shake_magnitude, shake_magnitude);
            var camera_x = (target.x + camera_x_shake) - camera_get_view_width(id) / 2;  
            camera_x = clamp(camera_x, 0, room_width);
            
            var camera_y_shake = irandom_range(-shake_magnitude, shake_magnitude);
            var camera_y = (target.y + camera_y_shake) - camera_get_view_height(id) / 2;  
            camera_y = clamp(camera_y, 0, room_height);
            
            camera_set_view_pos(id, camera_x, camera_y);
        }
    }
}