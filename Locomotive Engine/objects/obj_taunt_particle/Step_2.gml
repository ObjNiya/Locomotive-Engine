with (player_instance)
{
    if (state_step != state_player_taunt_step)
        instance_destroy(other);
    
    other.x = x;
    other.y = y;
}