#macro SPAWN_OBJECTS [obj_spawn_a, obj_spawn_b, obj_spawn_c, obj_spawn_d, obj_spawn_e, obj_spawn_f]

enum SPAWN_XALIGN
{
    LEFT = 0,
    CENTER = 2,
    RIGHT = 1,
}

enum SPAWN_YALIGN
{
    TOP = 0,
    MIDDLE = 2,
    BOTTOM = 1,
}

global.target_room = -1;
global.target_spawn_object = -1;

global.target_spawn_pos = [0, 0];
global.target_spawn_align = [SPAWN_XALIGN.LEFT, SPAWN_YALIGN.TOP];

function set_spawn_alignment(x_align, y_align)
{
    global.target_spawn_align = [x_align, y_align];
}

function queue_room(index, spawn_obj_name)
{
    if (!room_exists(index))
    {
        log(queue_room, LOG_LEVELS.WARN, ["The given room index is ", index, ", which is not a room or it doesn't exist. Cancelling out of the function early..."]);
        return false;
    }
    
    if (!is_string(spawn_obj_name))
    {
        log(queue_room, LOG_LEVELS.WARN, ["The given spawn object name is not a string as it should be. Cancelling out of the function early..."]);
        return false;
    }
    
    global.target_room = index;
    
    var instances = room_get_info(global.target_room, false, true, false, false, false, false).instances;
    var instances_count = array_length(instances);
    
    for (var i = 0; i < instances_count; i++)
    {
        var instance = instances[i];
        var object_name = instance.object_index;
        
        if (object_name != spawn_obj_name)
            continue;
        
        var sprite = object_get_sprite(asset_get_index(object_name));
        
        var spawn_x = instance.x - sprite_get_xoffset(sprite);
        var spawn_y = instance.y - sprite_get_yoffset(sprite);
        
        if (global.target_spawn_align[0] != 0)
            spawn_x += sprite_get_width(sprite) / global.target_spawn_align[0];
        if (global.target_spawn_align[1] != 0)
            spawn_y += sprite_get_height(sprite) / global.target_spawn_align[1];
        
        global.target_spawn_pos = [spawn_x, spawn_y];
        break;
    }
    
    return true;
}

function add_spawn_offset(x, y)
{
    global.target_spawn_pos[0] += x;
    global.target_spawn_pos[1] += y;
}

function goto_room()
{
    if (!room_exists(global.target_room))
    {
        log(goto_room, LOG_LEVELS.WARN, ["The target room index is ", global.target_room, ", which is not a room or it doesn't exist. Cancelling out of the function early..."]);
        return false;
    }
    
    room_goto(global.target_room);
    
    with (par_player)
    {
        xstart = global.target_spawn_pos[0];
        ystart = global.target_spawn_pos[1];
        
        x = xstart;
        y = ystart;
    }
    
    return true;
}

function trans_room(transition_object, event_path = sfx_transition_fade)
{
    if (!room_exists(global.target_room))
    {
        log(trans_room, LOG_LEVELS.WARN, ["The target room index is ", global.target_room, ", which is not a room or it doesn't exist. Cancelling out of the function early..."]);
        return false;
    }
    
    if (instance_exists(par_roomtransition))
        instance_destroy(par_roomtransition);
    
    var event_id = fmod_studio_system_get_event(event_path);
    
    if (fmod_studio_event_description_is_valid(event_id))
        sound_instance_one_shot(event_path);
    
    return instance_create(0, 0, transition_object);
}