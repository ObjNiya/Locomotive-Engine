function define_level(name, starting_room, showtime_time, has_secrets_and_treasure, s_rank_requirement)
{
    return
    {
        name,
        starting_room,
        showtime_time,
        has_secrets_and_treasure,
        s_rank_requirement
    }
}

function goto_level(lvl_struct)
{
    global.level = lvl_struct;
    
    with (obj_level_manager)
        instance_destroy();
    
    instance_create(0, 0, obj_level_manager);
    
    room_transition(global.level.starting_room, "A");
}