enum GAME_STATES
{
    TITLE,
    HUB,
    LEVEL,
    TIMES_UP,
    RANK,
}

with (global)
{
    // Pausing and Gamestate
    
    canPause = true;
    gamePaused = false;
    
    // Gamestate
    
    prevGameState = GAME_STATES.TITLE;
    gameState = GAME_STATES.TITLE;
}
