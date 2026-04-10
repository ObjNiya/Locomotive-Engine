function create_points_number(value)
{
    with (instance_create((x - sprite_xoffset) + (sprite_width / 2), y, obj_points_number))
        number = value;
}