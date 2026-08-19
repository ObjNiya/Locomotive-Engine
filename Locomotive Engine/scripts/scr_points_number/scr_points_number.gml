/**
 * Creates a flashing points number that moves up with the given number.
 * @parameter {Real} value The number that should display.
 */
function PointsNumberCreate(value)
{
    with (InstanceCreate((x - sprite_xoffset) + (sprite_width / 2), y, obj_points_number))
        number = value;
}