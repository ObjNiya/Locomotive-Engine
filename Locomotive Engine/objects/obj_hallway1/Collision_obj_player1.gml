if instance_exists(obj_roomTransition)
	exit;
warp_set_door()
var h = id
var top = y - 1
var bottom = y + sprite_height - 46
with obj_player {
	var v = y
	v -= top
	v /= abs(bottom - top)
	horizontalHallwayMult = v
}
top = y - 24
with obj_player {
	v = y
	v -= top
	v /= abs(bottom - top)
	horizontalHallwayMult_crouch = v
}

with other {
	horizontalHallwayDir = sign(h.image_xscale)
	targetDoor = h.targetDoor
	with instance_create(0, 0, obj_roomTransition)
		targetroom = h.targetroom
}