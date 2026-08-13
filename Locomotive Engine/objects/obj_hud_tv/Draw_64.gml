var tv_x = GuiCalcX(fa_right, 0);
var tv_y = GuiCalcY(fa_top, y);

var tv_width = sprite_get_width(playerId.spr_tv_idle);
var tv_height = sprite_get_height(playerId.spr_tv_idle);

var tvbg_x = tv_x - sprite_get_xoffset(playerId.spr_tv_turnon);
var tvbg_y = tv_y - sprite_get_yoffset(playerId.spr_tv_turnon);

draw_set_mask(playerId.spr_tv_turnon, 0, tv_x, tv_y, false);
draw_set_color(global.level.tvbg_color);
draw_rectangle(tvbg_x, tvbg_y, tvbg_x + tv_width, tvbg_y + tv_height, false);
draw_set_color(c_white);
draw_reset_mask();

draw_sprite_ext(sprite_index, image_index, tv_x, tv_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

whitenoise.x = tv_x;
whitenoise.y = tv_y;

SmcRunEvent(STATE_EVENTS.DRAW);