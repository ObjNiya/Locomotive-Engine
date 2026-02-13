with (other)
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 || !grounded)
        exit;
 
    smc_set_state(state_player_jump_to_background);
}