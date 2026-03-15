depth = DEPTHS.BACK;

while (!place_meeting(x, y + 1, [obj_solid, obj_platform, obj_slope]) && y < room_height)
    y++;

with (instance_create(x - sprite_xoffset, y - sprite_yoffset, obj_point_of_interest))
{
    image_xscale = other.sprite_width / sprite_width;
    image_yscale = other.sprite_height / sprite_height;
}

cutscene = false;
player = noone;

cam_tween = new Tween(ac_ease, "out", 0.6, time_source_units_seconds);
plyr_shrink_spd = 0.01;