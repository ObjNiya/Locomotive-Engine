with (spawner_id)
{
    if (player_get_mach_stage() <= 2 || state_step != state_player_mach_step)
        instance_destroy(other);
    
    other.x = x;
    other.y = y;
}