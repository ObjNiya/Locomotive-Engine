/**
 * Sets what corners players will align to when being positioned to a spawn.
 * @parameter {Constant.HAlign} x_align The horizontal alignment to set.
 * @parameter {Constant.VAlign} y_align The vertical alignment to set.
 */
function SpawnSetAlign(x_align, y_align)
{
    with (obj_room_goto)
    {
        spawnXAlign = x_align;
        spawnYAlign = y_align;
    }
}


/**
 * Sets how far to offset the players from the spawn they're getting positioned to.
 * @parameter {Real} x_offset The horizontal offset to set.
 * @parameter {Real} y_offset The vertical offset to set.
 */
function SpawnSetOffset(x_offset, y_offset)
{
    if (!is_real(x_offset) || !is_real(y_offset))
    {
        Log(SpawnSetOffset, LOG_TYPES.WARNING, "The given offset values are ", x_offset, " and ", y_offset, ", which aren't numbers. Cancelling out of the function early...");
        return false;
    }
    
    with (obj_room_goto)
    {
        spawnXOffset = x_offset;
        spawnYOffset = y_offset;
    }
    
    return true;
}


/**
 * Sets a function to run on the given room event.
 * @parameter {Real} event Which room event to set as a ```ROOM_EVS``` enum member.
 * @parameter {Function} func The function to run on the event.
 */
function SetRoomEvent(event, func)
{
    global.roomEvents[? event] = func;
}


/**
 * Queue's the given room and spawn for the next ```RoomGoto()``` call.
 * @parameter {Asset.GMRoom} rm The room to queue.
 * @parameter {Asset.GMObject} spawn The spawn to go to upon queued room.
 */
function RoomQueue(rm, spawn)
{
    if (!room_exists(rm))
    {
        Log(RoomQueue, LOG_TYPES.WARNING, "The given room index is ", rm, ", which is not a room or it doesn't exist. Cancelling out of the function early...");
        return false;
    }
    
    if (!object_exists(spawn))
    {
        Log(RoomQueue, LOG_TYPES.WARNING, "The given spawn object index is ", rm, ", which is not an object or it doesn't exist. Cancelling out of the function early...");
        return false;
    }
    
    with (global)
    {
        targetRoom = rm;
        targetSpawn = spawn;
    }
    
    return true;
}


/**
 * Goes to the previously queued room and moves all players to the set spawn.
 */
function RoomGoto()
{
    with (obj_room_goto)
        event_user(0);
}


/**
 * Moves all players to the set spawn.
 */
function SpawnGoto()
{
    with (obj_room_goto)
        event_user(1);
}


/**
 * Goes to the previously queued room with the given transition and moves all players to the set spawn.
 * @parameter {Asset.GMObject} transition_obj (OPTIONAL) The transition object to use.
 * @parameter {String} event_path (OPTIONAL) The FMOD Studio event path to the sound to play.
 * @parameter {Function|Real} on_switch (OPTIONAL) A function that is ran when the room is switched to the target. Default is `-1`, making it run nothing.
 */
function RoomTrans(transition_obj = obj_roomtrans_fade, event_path = sfx_trans_fade, on_switch = -1)
{
    if (!object_exists(transition_obj))
    {
        Log(RoomTrans, LOG_TYPES.WARNING, "The given transition object is ", transition_obj, ", which is not an object or it doesn't exist. Cancelling out of the function early...");
        return noone;
    }
    
    if (object_get_parent(transition_obj) != par_roomtransition)
    {
        Log(RoomTrans, LOG_TYPES.WARNING, "The given transition objects parent is ", object_get_parent(transition_obj), ", which is incorrect as it always should be par_roomtransition. Cancelling out of the function early...");
        return noone;
    }
    
    with (par_roomtransition)
        instance_destroy();
    
    if (is_string(event_path))
    {
        var event_id = fmod_studio_system_get_event(event_path);
        
        if (sound_description_is_valid_ext(event_id))
            sound_instance_one_shot(event_path);
    }
    
    with (InstanceCreate(0, 0, transition_obj))
    {
        onSwitch = on_switch;
        return id;
    }
}