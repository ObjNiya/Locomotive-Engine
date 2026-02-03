if (previous_window_width == window_get_height() && previous_window_height == window_get_height())
    exit;

previous_window_width = window_get_width();
previous_window_height = window_get_height();

event_user(0);

// Take the changes from User Event 0 into account

application_x = (window_get_width() / 2) - (application_width / 2);
application_y = (window_get_height() / 2) - (application_height / 2);

if (application_width != surface_get_width(application_surface) || application_height != surface_get_height(application_surface))
    surface_resize(application_surface, application_width, application_height);

display_set_gui_maximise(-1, -1);