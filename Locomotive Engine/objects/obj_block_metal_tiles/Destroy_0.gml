repeat (debris_amount)
{
    var debris_offset = effects_get_offset();
    
    with (instance_create(x + debris_offset[0], y + debris_offset[1], obj_block_debris))
    {
        sprite_index = other.debris_sprite;
        image_speed = 0;
        image_index = irandom(image_number);
    }
}

sleep(5);
instance_create(x + 32, y + 32, obj_bang_particle);
sound_instance_one_shot(destroy_sound, x, y);
add_saveroom();

with (obj_player)
{
    camera.set_shake_x(20, 0.666);
    camera.set_shake_y(20, 0.666);
}