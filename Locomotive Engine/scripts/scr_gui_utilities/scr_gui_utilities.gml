/*function gui_get_xscale()
{
    with (obj_screen)
        return application_width / GAME_WIDTH;
}

function gui_get_yscale()
{
    with (obj_screen)
        return application_height / GAME_HEIGHT;
}

function gui_get_width()
{
    with (obj_screen)
        return application_width;
}

function gui_get_height()
{
    with (obj_screen)
        return application_height;
}


function gui_element_get_scale()
{
    with (obj_screen)
        return (gui_scale == -1 || gui_scale < application_scale) ? application_scale : gui_scale;
}

poopy 