#macro SPAWN_SPRITE_SIZE 32
#macro PLAYER_MASK_OFFSET 4 

global.target_room = -1;
global.target_spawn_pos = [0, 0];

function queue_room(index, spawn_object)
{
    global.target_room = index;
    
    var instances = room_get_info(global.target_room, false, true, false, false, false, false).instances;
    var instances_count = array_length(instances);
    
    var found_spawn_pos = false;
    
    for (var i = 0; i < instances_count && !found_spawn_pos; i++)
    {
        var instance = instances[i];
        
        if (instance.object_index == object_get_name(spawn_object))
        {
            var spawn_x = instance.x + (SPAWN_SPRITE_SIZE / 2);
            var spawn_y = instance.y + SPAWN_SPRITE_SIZE;
            
            with (par_player)
                spawn_y -= sprite_get_yoffset(mask_index) - PLAYER_MASK_OFFSET;
            
            global.target_spawn_pos = [spawn_x, spawn_y];
            found_spawn_pos = true;
        }
    }
}

function goto_room()
{
    room_goto(global.target_room);
    
    with (par_player)
    {
        xstart = global.target_spawn_pos[0];
        ystart = global.target_spawn_pos[1];
        
        x = xstart;
        y = ystart;
    }
}

function trans_room(transition_object, event_path = sfx_transition_fade)
{
    if (instance_exists(par_roomtransition))
        return noone;
    
    var event_id = fmod_studio_system_get_event(event_path);
    
    if (fmod_studio_event_description_is_valid(event_id))
        sound_instance_one_shot(event_path);
    
    return instance_create(0, 0, transition_object);
}

function add_spawn_offset(x, y)
{
    global.target_spawn_pos[0] += x;
    global.target_spawn_pos[1] += y;
}