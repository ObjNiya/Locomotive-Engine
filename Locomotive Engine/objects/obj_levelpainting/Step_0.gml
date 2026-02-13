with (par_player)
{
    if (state_id == state_player_jump_to_background && !visible)
    {
        global.level = other.level;
        room_transition(rm_titlecard, "A");
    }
}