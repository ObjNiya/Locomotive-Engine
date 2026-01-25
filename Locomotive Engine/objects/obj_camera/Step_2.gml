if (!instance_exists(target))
	exit;

/*xoffset = approach(xoffset, xoffset_target, xoffset_speed);
yoffset = approach(yoffset, yoffset_target, yoffset_speed);

xscale = approach(xscale, xscale_target, xscale_speed);
yscale = approach(yscale, yscale_target, yscale_speed);

angle = approach(angle, angle_target, angle_speed);*/

var center_x = camera_get_view_width(camera) / 2;
var center_y = camera_get_view_height(camera) / 2;

var natural_y_offset = 50;

var target_x = clamp(target.x - center_x - xoffset, 0, room_width);
var target_y = clamp(target.y - center_y - natural_y_offset - yoffset, 0, room_width);

camera_set_view_size(camera, 960 * xscale, 540 * yscale);
camera_set_view_angle(camera, angle);
camera_set_view_pos(camera, target_x, target_y);