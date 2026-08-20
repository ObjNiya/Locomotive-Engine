if (global.prevGameState == global.gameState)
    exit;

switch (global.prevGameState)
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

global.prevGameState = global.gameState;

switch (global.gameState)
{
    case GAME_STATES.HUB:
        PrlxInitHub();
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
        break;
}