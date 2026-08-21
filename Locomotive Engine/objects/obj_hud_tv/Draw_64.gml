x = GuiCalcX(fa_right) - 115;
y = GuiCalcY(fa_top) + yOffset;

var tv_width = sprite_get_width(playerId.spr_tv_idle);
var tv_height = sprite_get_height(playerId.spr_tv_idle);

var tvbg_x = x - sprite_get_xoffset(playerId.spr_tv_turnon);
var tvbg_y = y - sprite_get_yoffset(playerId.spr_tv_turnon);

draw_set_mask(playerId.spr_tv_turnon, 0, x, y, false);
draw_set_color(global.level.tvbgColor);
draw_rectangle(tvbg_x, tvbg_y, tvbg_x + tv_width, tvbg_y + tv_height, false);
draw_set_color(c_white);
draw_reset_mask();

draw_self()

whitenoise.Draw(x, y);

SmcRunEvent("Draw");
