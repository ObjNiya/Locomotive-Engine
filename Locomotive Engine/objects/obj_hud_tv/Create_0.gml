x -= GAME_WIDTH;
depth = DEPTHS.CLOSEST;
sprite_index = spr_tv_turnon_damian;


playerId = noone;

SmcInit();
statePrefix = "StateTv";

// State variables

IdleAnimTimer = 240 + (60 * irandom_range(-1, 2));

whitenoise = new Sprite(spr_tv_whitenoise_damian);
whitenoiseNextState = "Idle";
whitenoiseNextSprite = spr_tv_idle_damian;

exprTimer = new Timer(60, time_source_units_frames, function() {
    TvDoWhitenoise(id, "Idle", playerId.spr_tv_idle);
});