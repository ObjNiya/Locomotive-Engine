function goto_room(room, spawnpoint)
{
    if (instance_exists(obj_goto_room))
        return;
    
    with (instance_create(x, y, obj_goto_room))
    {
        target_room = room;
        target_spawnpoint = spawnpoint;
        
        event_user(0);
    }
}

function room_transition(room, spawnpoint, transition_object = obj_roomtransition_fade)
{
    with (instance_create(x, y, transition_object))
    {
        target_room = room;
        target_spawnpoint = spawnpoint;
    }
    
    with (instance_create(x, y, obj_goto_room)) 
    {
        target_room = room;
        target_spawnpoint = spawnpoint;
    }  
}