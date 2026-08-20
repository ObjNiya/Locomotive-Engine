enum GAME_STATES
{
    TITLE,
    HUB,
    LEVEL,
    TIMES_UP,
    RANK,
}

global.__gameState__ = GAME_STATES.TITLE;

function GameStateSet(state)
{
    if (global.__gameState__ == state)
        return false;
    
    switch (global.__gameState__)
    {
        case GAME_STATES.HUB:
            InstanceDestroySafe(obj_hud_pointsbank);
            break;
        
        case GAME_STATES.LEVEL:
            InstanceDestroySafe(obj_hud_tv);
            InstanceDestroySafe(obj_hud_book);
            InstanceDestroySafe(obj_level);
            break;
    }
    
    global.__gameState__ = state;
    
    switch (global.__gameState__)
    { 
        case GAME_STATES.HUB:
            PrlxInitHub();
            MusicSet(mu_hub);
            InstanceCreate(0, 0, obj_hud_pointsbank);
            break;       
        
        case GAME_STATES.LEVEL:
            InstanceCreate(0, 0, obj_level);
            
            with (obj_player)
            {
                var tv = InstanceCreate(845, 80, obj_hud_tv);
                tv.playerId = id;
                hudTvId = tv;
                
                with (tv)
                    SmcSetState("Idle");
                
                var book = InstanceCreate(5, 390, obj_hud_book);
                book.playerId = id;
                hudBookId = book;
            }
            
            global.level.prlxInit();
            break;
    }
    
    return true;
}


function GameStateGet()
{
    return global.__gameState__;
}