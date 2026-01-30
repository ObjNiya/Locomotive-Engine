depth = 3;

level = variable_global_get(level);

while (!place_meeting(x, y, obj_solid))
    y++;