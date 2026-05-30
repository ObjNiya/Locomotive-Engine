if (!room_exists(target_room))
{
    Log(obj_room_goto, LOG_TYPES.WARNING, "The target room index is ", target_room, ", which is not a room or it doesn't exist. Cancelling out of the function early...");
    exit;
}

room_goto(target_room);