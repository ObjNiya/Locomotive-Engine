repeat (debris_amount)
{
    var debris_offset = effects_get_offset();
    instance_create(x + debris_offset[0], y + debris_offset[1], obj_block_debris);
}

repeat (dust_amount)
{
    var dust_offset = effects_get_offset();
    create_particle(x + dust_offset[0], y + dust_offset[1], obj_block_dust_particle, false);
}

sleep(5);
sound_instance_one_shot(destroy_sound, x, y);
add_saveroom();