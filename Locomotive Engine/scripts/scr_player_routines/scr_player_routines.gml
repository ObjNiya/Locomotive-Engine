/**
 * This function will run the routine to make the player stop jumping if jump is released.
 * @parameter {Real} divisor By how much to divide the players vsp to make the jump stop.
 * @returns {Bool}
 */
function player_routine_jumpstop(divisor = 20)
{
    if (!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded)
        return false;
    
    vsp /= divisor;
    
    return true;
}