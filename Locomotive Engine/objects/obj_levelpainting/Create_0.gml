depth = DEPTHS.BACK;
image_speed = 0;
image_index = clamp(level_id, 0, sprite_get_number(sprite_index));

while (!place_meeting(x, y + 1, [obj_solid, obj_platform, obj_slope]) && y < room_height)
    y++;

with (instance_create(x - sprite_xoffset, y - sprite_yoffset, obj_point_of_interest))
{
    image_xscale = other.sprite_width / sprite_width;
    image_yscale = other.sprite_height / sprite_height;
}

visual_helper_initialize();

visual_y = ystart - y;

ripple_speed = 0;
ripple_time = 0;