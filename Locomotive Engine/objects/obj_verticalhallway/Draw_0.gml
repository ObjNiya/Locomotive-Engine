draw_self()
var h = id

var left = x + 13 
var right = x + sprite_width - 13
with obj_player {
	var v = x
	v -= left
	v /= abs(right - left)
	verticalHallwayMult = v
}
draw_text(x, y, string(v))