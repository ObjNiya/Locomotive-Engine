if (!room_exists(global.target_room)) 
{
    show_debug_message("Room with ID: " + string(global.target_room) + " doesn't exist.");
    instance_destroy();
    exit;
}

room_goto(global.target_room);