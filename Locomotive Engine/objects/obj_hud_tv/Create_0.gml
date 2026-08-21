// TODO: Refactor Prop

//x -= global.baseAppWidth;

yOffset = 80;

playerId = noone;

SmcInit("Tv");

// State variables

IdleAnimTimer = 240 + (60 * irandom_range(-1, 2));

whitenoise = new Animator(spr_tv_whitenoise_damian);
whitenoiseNextState = "Idle";
whitenoiseNextSprite = spr_tv_idle_damian;

whitenoise.imageAlpha = 0

exprTimerFunc = function()
{
    TvDoWhitenoise(id, "Idle", playerId.spr_tv_idle);
}

exprTimer = time_source_create(time_source_game, 60, time_source_units_frames, exprTimerFunc);
