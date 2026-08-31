HITSTUN_STEP;

invincibleBuffer--;
unstompableTime--;
dashcloudPartTimer--;

scr_collision();
SmcRunEvent("Step");

var thrown_out_room = stateName == "Thrown" && (x > room_width + 100 || x < -100 || y < -100);