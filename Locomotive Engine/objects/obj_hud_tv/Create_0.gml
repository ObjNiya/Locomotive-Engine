x -= GAME_WIDTH;
depth = DEPTHS.CLOSEST;
sprite_index = spr_tv_turnon_damian;

// Idle state variables

idleDoMach3Tv = function()
{
    TvTriggerExpr(id, playerId.spr_tv_mach3, true, infinity, function() {
        if (playerId.state_id == state_player_mach || playerId.state_id == state_player_wallclimb || playerId.state_id == state_player_machturn || playerId.state_id == state_player_cape)
        {
            if (playerId.sprite_index == playerId.spr_mach4)
                idleDoMach4Tv();
            return true;
        }
        
        return false;
    });
}

idleDoMach4Tv = function()
{
    TvTriggerExpr(id, playerId.spr_tv_mach4, true, infinity, function() {
        if (playerId.state_id == state_player_wallclimb || playerId.state_id == state_player_mach || playerId.state_id == state_player_machturn || playerId.state_id == state_player_cape)
        {
            if (playerId.state_id == state_player_machturn)
                idleDoMach3Tv();
            return true;
        }
        
        return false;
    });
}

// Whitenoise state variables

whitenoise = new Sprite(spr_tv_whitenoise_damian);
whitenoiseNextState = StateTvIdle;
whitenoiseNextSprite = spr_tv_idle_damian;

// Expression state variables

exprTimer = 60;
exprStep = function() { return true };

IdleAnimTimer = 240 + (60 * irandom_range(-1, 2));
playerId = noone;

state_machine_initialize();