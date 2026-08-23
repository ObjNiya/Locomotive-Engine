/**
 * Adds the given amount of points to the player's combo.
 * @parameter {Real} value How many points to add.
 * @parameter {Real} time What to set the Combo Timer to, in seconds.
 */
function ComboAdd(value, time)
{
    with (global)
    {
        combo = max(combo + value, 0);
        
        if (combo <= 0)
            return false;
        
		var prev_time = time_source_get_time_remaining(comboTimer)
        var combo_time = clamp(prev_time + time, 0, comboTimerMax);
        
        time_source_reconfigure(comboTimer, combo_time, time_source_units_seconds, comboTimerFunc);
		time_source_start(comboTimer);
	}
}

/**
 * Sets the remaining combo time until the combo ends.
 * @parameter {Real} time The time to set, in seconds.
 */
function ComboSetTime(time)
{
    with (global)
	{
        time_source_reconfigure(comboTimer, time, time_source_units_seconds, comboTimerFunc);
		time_source_start(comboTimer);
	}
}