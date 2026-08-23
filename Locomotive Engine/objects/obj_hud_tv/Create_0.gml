// TODO: Refactor Prop

//x -= global.baseAppWidth;

yOffset = 80;

playerId = noone;

SmcInit("Tv");

// State variables

IdleAnimTimer = 240 + (60 * irandom_range(-1, 2));

whitenoise = new Animator(spr_combobar);
whitenoiseNextState = "Idle";
whitenoiseNextSprite = spr_tv_idle_damian;

comboBar = { count: 0, x: 0, y: 0, xOffset: 0, yOffset: -379, vsp: 0, state: "Hide" };
comboSkull = new Animator(spr_combobar_skull);
comboSkull.x = 0; comboSkull.y = 0;
comboFill = 0

whitenoise.imageAlpha = 0

exprTimerFunc = function()
{
    TvDoWhitenoise(id, "Idle", playerId.spr_tv_idle);
}

exprTimer = time_source_create(time_source_game, 60, time_source_units_frames, exprTimerFunc);
