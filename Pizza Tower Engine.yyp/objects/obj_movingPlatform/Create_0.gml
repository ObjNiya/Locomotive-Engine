depth = 5;
image_speed = 0.35;

hsp = 0;
vsp = 0;


stopped = false;
stopid = noone;

// Smooth in and Out.
stopSpeed = 0;
stopSpeedMax = 4;
stopSpeedAcc = 0.5;
stopSpeedDecc = 0.5;
platformDirection = targetDirection;
TrueX = x;
TrueY = y;


hasMove = false;
moveCode = function() {
	if (hasMove) {
		return;
	}
	xprevious = x;
	yprevious = y;	
	// Moving Code.
	if (!active) {
		return;
	}

	hsp = round(lengthdir_x(moveSpeed - stopSpeed, targetDirection));
	vsp = round(lengthdir_y(moveSpeed - stopSpeed, targetDirection));
	TrueX += hsp;
	TrueY += vsp;
	x = round(TrueX);
	y = round(TrueY);

	// Collide and interact with Triggers.
	if (place_meeting(x + sign(hsp), y + sign(vsp), obj_movingPlatformTrigger) && !stopped) {
		with (instance_place(x + sign(hsp), y + sign(vsp), obj_movingPlatformTrigger)) {
			if (other.stopid != id) {
				other.platformDirection = targetAngle;
				other.stopped = true;
				other.stopid = id;
			}
		}
	}

	// Smooth in and out.
	if (stopped) {
		stopSpeed = approach(stopSpeed, stopSpeedMax, stopSpeedAcc);
		if (stopSpeed >= stopSpeedMax) {
			targetDirection = platformDirection;
			stopped = false;
		}
	} else {
		stopSpeed = approach(stopSpeed, 0, stopSpeedDecc);
	}
	hasMove = true;
}
