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

SaveroomAdd();
Sleep(5);
sound_instance_one_shot(destroySnd, x, y);