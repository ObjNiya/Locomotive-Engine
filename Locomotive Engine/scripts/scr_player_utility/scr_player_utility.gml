/// @description This function will divide the vsp by the given amount if the player is going upwards in the air and released the jump bind.
/// @parameter {Real} divisor By how much to divide the vsp.
/// @returns {Bool}
function player_try_jumpstop(divisor = 20)
{
    if (!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded)
        return false;
    
    vsp /= divisor;
    
    return true;
}