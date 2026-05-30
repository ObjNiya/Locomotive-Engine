enum TIMER_TYPES
{
    NONE,
    PER_LEVEL,
    PER_SAVE,
    BOTH,
}

global.timerType = TIMER_TYPES.BOTH;
global.speedrunTimer = false;

global.saveTimer = new Timer(9223372036854775807, time_source_units_frames, function() { show_message("You have no life") });
global.levelTimer = new Timer(9223372036854775807, time_source_units_frames, function() { show_message("You have no life") });

with (global.saveTimer)
{
    SetCountdownMode(false);
    SetRepeating(false, true);
}

with (global.levelTimer)
{
    SetCountdownMode(false);
    SetRepeating(false, true);
}