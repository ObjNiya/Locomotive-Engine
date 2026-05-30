if (IsShowtime() || check_saveroom())
{
    if (!IsShowtime())
        visible = false;
    exit;
}

with (obj_player)
{
    x = other.x;
    y = other.y;
    
    smc_set_state(state_player_exitportal);
    sound_instance_one_shot(sfx_player_banana_slip, x, y);
}

alarm[0] = 90;
add_saveroom();