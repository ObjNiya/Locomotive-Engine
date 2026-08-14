event_inherited();

depth = DEPTHS.BACK;
image_speed = 0;
image_index = clamp(levelId, 0, sprite_get_number(sprite_index));

while (!place_meeting(x, y + 1, [obj_solid, obj_platform, obj_slope]) && y < room_height)
    y++;

with (InstanceCreate(x - sprite_xoffset, y - sprite_yoffset, obj_point_of_interest))
{
    image_xscale = other.sprite_width / sprite_width;
    image_yscale = other.sprite_height / sprite_height;
}

VisualHelperInit();

visualY = ystart - y;

rippleSpeed = 0;
rippleTime = 0;