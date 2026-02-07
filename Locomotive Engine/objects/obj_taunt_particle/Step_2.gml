with (spawner_id)
{
    if (other.spawner_previous_sprite == -1)
        other.spawner_previous_sprite = sprite_index;
    else if (sprite_index != other.spawner_previous_sprite)
        instance_destroy(other);
    
    other.x = x;
    other.y = y;
}