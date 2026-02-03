if (USE_FMOD_STUDIO) {
	fmod_studio_system_update();
}
else {
	fmod_system_update();
}

var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);

var _attr = new Fmod3DAttributes();

with (_attr.position)
{
    x = camera_x; 
    y = camera_y;
    z = -1;
}
with (_attr.forward)
{
    x = 0;
    y = 0;
    z = 1;
}
with (_attr.up)
{
    x = 0;
    y = 1;
    z = 0;
}

fmod_studio_system_set_listener_attributes(0, _attr)