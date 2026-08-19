/**
 * Adds the given amount of points to the player's combo.
 * @parameter {Real} value How many points to add.
 * @parameter {Real} time What to set the Combo Timer to.
 */
function ComboAdd(value, time)
{
    with (global)
    {
        combo = max(combo + value, 0);
        
        if (combo <= 0)
            return false;
        
        var combo_period = time_source_get_period(comboTimer);
        
        time_source_reconfigure(comboTimer, combo_period + time, time_source_units_seconds, comboTimerFunc);
    }
}

/**
 * Sets the remaining combo time until the combo ends.
 * @parameter {Real} time The time to set.
 */
function ComboSetTime(time)
{
    with (global)
        time_source_reconfigure(comboTimer, time, time_source_units_seconds, comboTimerFunc);
}