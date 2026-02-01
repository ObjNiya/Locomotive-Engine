application_x = (window_get_width() / 2) - (application_width / 2);
application_y = (window_get_height() / 2) - (application_height / 2);

if (application_width != surface_get_width(application_surface) || application_height != surface_get_height(application_surface))
    surface_resize(application_surface, application_width, application_height);

draw_surface(application_surface, application_x, application_y);
draw_rectangle(application_x, application_y, application_x + application_width + 1, application_y + application_height + 1, true);
