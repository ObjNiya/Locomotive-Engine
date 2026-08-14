/**
 * Starts the given level.
 * @parameter {Struct.Lvl|Real} index A Level Struct **OR** the index of the Level.
 * @parameter {Asset.GMObject} transiton_obj (OPTIONAL) What transition to use.
 */
function LvlGoto(lvl, transition_obj = obj_roomtrans_fade)
{
    CATCH_UNDEFINED_LVL;
    
    global.level = lvl;
    
    RoomQueue(rm_titlecard, obj_spawn_a);
    return RoomTrans(transition_obj, -1);
}

/*
