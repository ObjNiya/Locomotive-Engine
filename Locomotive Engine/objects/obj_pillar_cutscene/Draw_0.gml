draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_black);
player_spr.draw();
pillar_spr.draw();

draw_set_color(c_red);
draw_set_alpha(0.5);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
draw_set_color(c_white);

draw_self();