/// @description  If Moving Platform touches Trigger on creation...
if (place_meeting(x, y, obj_movingPlatformTrigger)) {
	with (instance_place(x, y, obj_movingPlatformTrigger)) {
		if (other.stopid != id) {
			other.platformDirection = targetAngle;
			other.stopped = true;
			other.stopid = id;
		}
	}
}



































