if (prevWindowWidth == window_get_height() && prevWindowHeight == window_get_height())
    exit;

prevWindowWidth = window_get_width();
prevWindowHeight = window_get_height();

ScreenUpdate();