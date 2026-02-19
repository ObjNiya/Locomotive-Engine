function player_routine_jumpstop(divisor = 20)
{
    if (!InputReleased(INPUT_VERB.JUMP) || vsp >= 0 || grounded)
        return false;
    
    vsp /= divisor;
    
    return true;
}