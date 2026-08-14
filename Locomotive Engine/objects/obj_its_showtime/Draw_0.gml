if (flashAlpha == -1)
    exit;

draw_set_alpha(flashAlpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

with (obj_player)
    event_perform(ev_draw, ev_draw_normal);

flashAlpha = Approach(flashAlpha, 0, 0.075);
if (flashAlpha == 0)
    instance_destroy();