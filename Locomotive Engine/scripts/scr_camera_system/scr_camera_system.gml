function attach_camera()
{
    var camera_instance = instance_create(x, y, obj_camera)
    with (camera_instance)
        follow_target = other.id;
    
    camera_id = camera_instance;
}

function extend_camera_horizontal(extend_target, extend_speed)
{
    with (camera_id)
    {
        x_extend_target = extend_target;
        x_extend_speed = extend_speed;
    }
}

function extend_camera_vertical(extend_target, extend_speed)
{
    with (camera_id)
    {
        y_extend_target = extend_target;
        y_extend_speed = extend_speed;
    }
}


function lock_camera()
{
    with (camera_id)
        follow_target = noone;
}

function unlock_camera()
{
    with (camera_id)
        follow_target = other.id;
}

function deattach_camera()
{
    instance_destroy(camera_id);
}