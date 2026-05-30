global.saveTimer = new Timer(9223372036854775807, time_source_units_frames, function() { show_message("You have no life") });
global.levelTimer = new Timer(9223372036854775807, time_source_units_frames, function() { show_message("You have no life") });

with (global.saveTimer)
{
    SetCountdownMode(false);
    SetRepeating(false, true);
    SetCountdownMode(false);
}

with (global.levelTimer)
{
    SetCountdownMode(false);
    SetRepeating(false, true);
    SetCountdownMode(false);
}