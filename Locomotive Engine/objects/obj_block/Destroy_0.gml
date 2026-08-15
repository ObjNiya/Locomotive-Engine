if (array_length(targetTiles) >= 1)
    TilesDestroyArea(targetTiles, bbox_left, bbox_top, bbox_right, bbox_bottom);

repeat (debrisAmnt)
{
    with (InstanceCreate(x + M_RandomInt(sprite_width), y + M_RandomInt(sprite_height), obj_block_debris))
        sprite_index = other.debrisSpr;
}

repeat (dustAmnt)
{
    with (create_particle(x + M_RandomInt(sprite_width), y + M_RandomInt(sprite_height), obj_block_dust_particle, false))
        sprite_index = other.dustSpr;
}

Sleep(5);
sound_instance_one_shot(destroySnd, x, y);