if instance_exists(obj_roomTransition)
	exit;
warp_set_door()
var h = id

var left = x + 13 
var right = x + sprite_width - 13
with obj_player {
	var v = x
	v -= left
	v /= (right - left)
	vertcalHallwayMult = v
}
with other {
	verticalHallwayDir = sign(h.image_yscale) * -1
	targetDoor = h.targetDoor
	with instance_create(0, 0, obj_roomTransition)
		targetroom = h.targetroom
}