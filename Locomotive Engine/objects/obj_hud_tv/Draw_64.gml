x = GuiCalcX(fa_right) - 115;
y = GuiCalcY(fa_top) + yOffset;

with (comboBar)
{
	x = other.x + xOffset;
	y = other.y + yOffset;
}

with (comboSkull)
{
	x = other.comboBar.x + map(other.comboFill, 0, global.comboTimerMax, -50, 59);
	y = other.comboBar.y;
	
	Draw(x, y);
}

draw_sprite(spr_combobar, 0, comboBar.x, comboBar.y);

var _string = string(comboBar.count);
var _len = string_length(_string);

var _text_x = comboBar.x - 69;
var _text_y = comboBar.y + 6;

draw_set_font(global.fntCombo);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var i = _len; i > 0; i--) {
	draw_text(_text_x, _text_y, string_char_at(_string, i));
	_text_x -= 22;
	_text_y -= 8;
}

var tv_width = sprite_get_width(playerId.spr_tv_idle);
var tv_height = sprite_get_height(playerId.spr_tv_idle);

var tvbg_x = x - sprite_get_xoffset(playerId.spr_tv_turnon);
var tvbg_y = y - sprite_get_yoffset(playerId.spr_tv_turnon);

draw_set_mask(playerId.spr_tv_turnon, 0, x, y, false);
draw_set_color(global.level.tvbgColor);
draw_rectangle(tvbg_x, tvbg_y, tvbg_x + tv_width, tvbg_y + tv_height, false);
draw_set_color(c_white);
draw_reset_mask();

draw_self();

whitenoise.SetPosition(x, y);
whitenoise.Draw();

SmcRunEvent("Draw");
