if instance_exists(obj_roomTransition)
	exit;
warp_set_door()
var dr = id
with other {
	if up_pressed && grounded && is(state, playerState.normal, playerState.mach2, playerState.mach3) && (global.catripi and other.image_index == 0)  {
		create_cutscene("catripiDoor", cs_catripiDoor, {
            follow_data: get_follow("catripi"),
            targetroom: dr.targetroom
        })
		targetDoor = dr.targetDoor
	} 
    if up_pressed && grounded && is(state, playerState.normal, playerState.mach2, playerState.mach3) && other.image_index == 1 {
        create_cutscene("warpdoor", cs_warpdoor)
		targetDoor = dr.targetDoor
		with instance_create(0, 0, obj_roomTransition)
			targetroom = dr.targetroom
    }
}