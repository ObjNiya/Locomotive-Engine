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

comboBar = { count: 0, x: 0, y: 0, xOffset: 0, yOffset: 0, vsp: 0, state: "Fall" };
comboSkull = new Animator(spr_combobar_skull);
comboPlaceholderAnimShow = false // Makes the combo meter do it's animations. Set to false if it gets annoying.

whitenoise.imageAlpha = 0

exprTimerFunc = function()
{
    TvDoWhitenoise(id, "Idle", playerId.spr_tv_idle);
}

exprTimer = time_source_create(time_source_global, 60, time_source_units_frames, exprTimerFunc);
