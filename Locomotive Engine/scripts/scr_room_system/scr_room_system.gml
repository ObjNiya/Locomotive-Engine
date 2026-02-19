/**
 * This function will go to the given room and move every player to the position of the given spawnpoint letter, not to be confused with the built-in function called ```room_goto```.
 * @parameter {Asset.GMRoom} index The index of the room to go to.
 * @parameter {String} spawnpoint_letter The letter of the spawnpoint to move the players to, which should be A, B, C, D, E or F.
 */ 
function goto_room(index, spawnpoint_letter)
{
    if (instance_exists(obj_goto_room))
        return;

    global.target_room = index;
    global.target_spawnpoint = spawnpoint_letter;
    
    with (instance_create(x, y, obj_goto_room))
        event_user(0);
}

/**
 * This function will use the given transition object to smoothly transition to the given room and move every player to the position of the given spawnpoint letter.
 * Instructions on making your own room transition object can be found in ```obj_roomtransition_fade```.
 * @parameter {Asset.GMRoom} index The index of the room to transition to.
 * @parameter {String} spawnpoint_letter The letter of the spawnpoint to move the players to, which should be A, B, C, D, E or F.
 */
function room_transition(index, spawnpoint_letter, transition_object = obj_roomtransition_fade)
{
    global.target_room = index;
    global.target_spawnpoint = spawnpoint_letter;
    
    instance_create(x, y, transition_object);
    instance_create(x, y, obj_goto_room);
}