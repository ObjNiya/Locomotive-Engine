if (previous_window_width == window_get_height() && previous_window_height == window_get_height())
    exit;

previous_window_width = window_get_width();
previous_window_height = window_get_height();

event_user(0);

// Take the changes from User Event 0 into account

app_x = (window_get_width() / 2) - (app_width / 2);
app_y = (window_get_height() / 2) - (app_height / 2);

if (app_width != surface_get_width(application_surface) || app_height != surface_get_height(application_surface))
    surface_resize(application_surface, app_width, app_height);

event_user(1);