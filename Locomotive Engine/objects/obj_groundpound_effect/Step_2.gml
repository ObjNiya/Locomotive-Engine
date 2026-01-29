with (spawner_id)
{
    if (state_step != state_player_groundpound_step || grounded)
        instance_destroy(other);
    
    other.x = x + 16;
    other.y = y;
}