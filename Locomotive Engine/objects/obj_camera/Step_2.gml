x_extend = approach(x_extend, x_extend_target, x_extend_speed);
y_extend = approach(y_extend, y_extend_target, y_extend_speed);

if (!instance_exists(follow_target))
	exit;

var x_origin = camera_get_view_width(view_id) / 2;
var y_origin = camera_get_view_height(view_id) / 2;

var natural_y_offset = 50;

var target_x = (follow_target.x - x_origin) + x_extend;
target_x = clamp(target_x, 0, room_width);

var target_y = (follow_target.y - y_origin) + + y_extend;
target_y = clamp(target_y, 0, room_height);

camera_set_view_pos(view_id, target_x, target_y);