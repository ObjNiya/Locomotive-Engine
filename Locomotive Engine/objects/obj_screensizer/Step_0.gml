if (prev_window_width == window_get_height() && prev_window_height == window_get_height())
    exit;

prev_window_width = window_get_width();
prev_window_height = window_get_height();

update_screen_size();