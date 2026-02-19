image_speed = 0.35
event_inherited();
val = 10
got = function() {
	add_points(10)
	add_combotime(10)
	create_number(x + 16, y, 10)
	fmod_event_oneshot3D(sfx_escape_collect)
}