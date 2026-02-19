if instance_exists(obj_roomTransition)
	exit;
warp_set_door()
var dr = id
with other {
	if up_held && grounded && is(state, playerState.normal, playerState.mach2, playerState.mach3, playerState.superjumpprep) {
		create_cutscene("warpdoor", cs_warpdoor)
		targetDoor = dr.targetDoor
		with instance_create(0, 0, obj_roomTransition)
			targetroom = dr.targetroom
	}
}