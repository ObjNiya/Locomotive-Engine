function create_points_number(value)
{
    with (InstanceCreate((x - sprite_xoffset) + (sprite_width / 2), y, obj_points_number))
        number = value;
}