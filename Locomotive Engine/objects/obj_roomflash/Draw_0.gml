draw_set_color(flashColor);
draw_set_alpha(fade);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
draw_set_color(c_white);

if (!is_array(drawAbove))
    exit;

array_foreach(drawAbove, function(obj, index) {
    with (obj)
        draw_self();
});