with (other)
{
    if (cam_painting_up.seek_target != 1 || state_id == state_player_painting || sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1)
        exit;
    
    stop_music();
    painting_id = other.id;
    smc_set_state(state_player_painting);
}