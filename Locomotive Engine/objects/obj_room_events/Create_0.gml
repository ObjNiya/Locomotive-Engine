global.roomEvents = ds_map_create();

enum ROOM_EVS
{
    END,
    
    BEGIN_STEP,
    STEP,
    END_STEP,
    
    BEGIN_DRAW,
    DRAW,
    END_DRAW,
    
    BEGIN_DRAW_GUI,
    DRAW_GUI,
    END_DRAW_GUI,
    
    GAME_END,
    BROADCAST_MSG,
}


runRoomEv = function(event)
{
    if (is_undefined(global.roomEvents[? event]))
        return;
    
    global.roomEvents[? event]();
}