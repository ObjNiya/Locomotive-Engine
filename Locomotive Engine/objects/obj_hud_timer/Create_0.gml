saveTimer = new NewTimer(9223372036854775807, time_source_units_frames, function() { show_message("You have no life") });
levelTimer = new NewTimer(9223372036854775807, time_source_units_frames, function() { show_message("You have no life") });

with (saveTimer)
{
    SetCountdownMode(false);
    SetRepeating(false, true);
    SetCountdownMode(false);
    Start();
}

levelTimer.SetCountdownMode(false);