with (par_player)
{
    if (state_step == state_player_jump_to_background_step && !visible)
    {
        global.level = other.level;
        room_transition(rm_titlecard, "A");
    }
}