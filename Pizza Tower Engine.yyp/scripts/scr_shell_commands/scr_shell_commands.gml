function sh_noclip()
{
    if (!instance_exists(obj_player))
        return "ERROR -- Player doesn't exist.";
    
    with (obj_player)
        state_machine_set_state(state_player_noclip());
}