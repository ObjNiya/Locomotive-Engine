with (other)
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 || !grounded || state_id != state_player_normal)
        exit;
    
    other.player_ins = id;
    vsp = -(y - other.ystart) * (grav / 5.8);
    hsp = 0;
    
    sprite_index = spr_lookdoor;
    image_index = image_number - 1;
    image_speed = 0;
    
    smc_set_state(smc_empty_state);
}