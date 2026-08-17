/**
 * Adds the given amount of points to the player's combo.
 * @parameter {Real} value How many points to add.
 * @parameter {Real} time What to set the Combo Timer to.
 */
function AddCombo(value, time)
{
    with (global)
    {
        combo = max(combo + value, 0);
        
        if (combo <= 0)
            return false;
        
        comboTimer.time = clamp(comboTimer.time + time, 0, 6.75);
    }
}

function ComboSetTime(time)
{
    
}