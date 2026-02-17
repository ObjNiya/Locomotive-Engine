function set_spawn_align(x_align, y_align)
{
    if (!is_numeric(x_align) || !is_numeric(y_align))
    {
        log(set_spawn_align, LOG_LEVELS.WARN, ["The given align values are ", x_align, " and ", y_align, ", which aren't numbers. Cancelling out of the function early..."]);
        return false;
    }
    
    with (obj_room_goto)
    {
        spawn_xalign = x_align;
        spawn_yalign = y_align;
    }
    
    return true;
}

function set_spawn_offset(x_offset, y_offset)
{
    if (!is_numeric(x_offset) || !is_numeric(y_offset))
    {
        log(set_spawn_offset, LOG_LEVELS.WARN, ["The given offset values are ", x_offset, " and ", y_offset, ", which aren't numbers. Cancelling out of the function early..."]);
        return false;
    }
    
    with (obj_room_goto)
    {
        spawn_xoffset = x_offset;
        spawn_yoffset = y_offset;
    }
    
    return true;
}

function queue_room(index, spawn)
{
    if (!room_exists(index))
    {
        log(queue_room, LOG_LEVELS.WARN, ["The given room index is ", index, ", which is not a room or it doesn't exist. Cancelling out of the function early..."]);
        return false;
    }
    
    with (obj_room_goto)
    {
        target_room = index;
        target_spawn = spawn;
    }
    
    return true;
}

function goto_room()
{
    with (obj_room_goto)
        event_user(0);
    
}

function trans_room(transition_obj, event_path = sfx_transition_fade)
{
    if (!object_exists(transition_obj))
    {
        log(trans_room, LOG_LEVELS.WARN, ["The given transition object is ", transition_obj, ", which is not an object or it doesn't exist. Cancelling out of the function early..."]);
        return noone;
    }
    
    if (object_get_parent(transition_obj) != par_roomtransition)
    {
        log(trans_room, LOG_LEVELS.WARN, ["The given transition objects parent is ", object_get_parent(transition_obj), ", which is incorrect as it always should be par_roomtransition. Cancelling out of the function early..."]);
        return noone;
    }
    
    with (par_roomtransition)
        instance_destroy();
    
    if (is_string(event_path))
    {
        var event_id = fmod_studio_system_get_event(event_path);
        
        if (fmod_studio_event_description_is_valid(event_id))
            sound_instance_one_shot(event_path);
    }
    
    return instance_create(0, 0, transition_obj);
}

// Getters

function get_target_room()
{
    return obj_room_goto.target_room;
}


function get_target_spawn()
{
    return obj_room_goto.target_spawn;
}


function get_spawn_xalign()
{
    return obj_room_goto.spawn_xalign;
}


function get_spawn_yalign()
{
    return obj_room_goto.spawn_yalign;
}


function get_spawn_xoffset()
{
    return obj_room_goto.spawn_xoffset;
}


function get_spawn_yoffset()
{
    return obj_room_goto.spawn_yoffset;
}