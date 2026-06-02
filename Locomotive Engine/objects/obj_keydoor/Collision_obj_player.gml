with (other)
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 || !grounded || stateName == "Grabdash" || stateName == "Bananaslip" || stateName == "Anim" || stateName == "Door")
        exit;
    
    if (has_key)
    {
        add_saveroom(other);
        has_key = false;
    }

    if (!check_saveroom(other))
        exit;
        
    if (!queue_room(other.target_room, other.target_spawn))
        exit;
    
    set_spawn_align(SPAWN_XALIGN.CENTER, SPAWN_YALIGN.BOTTOM);
    set_spawn_offset(0, 0);
    
    SmcSetState("Door");
    trans_room(obj_roomtrans_fade);
}