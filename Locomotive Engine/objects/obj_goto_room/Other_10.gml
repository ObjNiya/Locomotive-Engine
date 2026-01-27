if (!room_exists(target_room)) 
{
    show_debug_message("Room with ID: " + string(target_room) + " doesn't exist.");
    instance_destroy();
    exit;
}

room_goto(target_room);