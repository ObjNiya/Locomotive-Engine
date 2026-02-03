if (USE_FMOD_STUDIO) {
	fmod_studio_system_update();
}
else {
	fmod_system_update();
}

var camera_x = camera_get_view_x(view_camera[0]) - (camera_get_view_width(view_camera[0]) / 2);
var camera_y = camera_get_view_y(view_camera[0]) - (camera_get_view_height(view_camera[0]) / 2);

var listener_3dattributes = new Fmod3DAttributes()

with (listener_3dattributes.position)
{
    x = camera_x;
    y = camera_y;
}

fmod_studio_system_set_listener_attributes(0, listener_3dattributes)