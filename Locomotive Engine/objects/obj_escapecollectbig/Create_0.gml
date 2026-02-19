event_inherited();


depth = 201
// can be hidden through tiles with this depth

randomize()
image_speed = 0.35 

value = 100

function got() {
    add_points(value)
	global.combotime = 60
	create_number(x + 16, y, value)
    fmod_event_oneshot3D(sfx_escape_bigcollect)
    change_tv(spr_tvcollect_damian, true, 60 * 3)
}