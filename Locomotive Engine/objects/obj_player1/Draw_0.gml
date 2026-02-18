var spr = sprite_index
var X = x
var Y = y
var xsc = xscale * scale_xs
var ysc = yscale * scale_ys
var img = image_index
var col = c_white
var rot = image_angle
var a = 1
if state == playerState.mach3 {
	chargeImg += 0.5
	chargeFrames++
	if chargeFrames % 4 == 0
		chargeShow = !chargeShow
	chargeImg %= sprite_get_number(spr_chargeeffect)
	draw_sprite_ext(spr_chargeeffect, chargeImg, x + (10 * xscale), y, xscale, yscale, 0, c_white, chargeShow ? (0.5 + random(0.5)) : (0.2 + random(0.8)))
}
if flash
	set_fog(c_white)
else
	pal_swap_set(spr_palette_damian, palSelect.number, false)
draw_sprite_ext(spr, img, X, Y, xsc, ysc, rot, col, a)
if sprite_exists(palSelect.patsprite)
    pattern_draw(spr, img, X, Y, spr_palcolors_damian, palSelect.patsprite, 0, xsc, ysc, rot, col, a)
if using_shader()
	shader_reset()
if using_fog()
	reset_fog()

