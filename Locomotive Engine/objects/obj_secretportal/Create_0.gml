paletteselect = irandom(sprite_get_width(spr_eggpalette) - 1)
if (global.palettesaveroom[? id] == undefined)
	global.palettesaveroom[? id] = paletteselect;
image_speed = 0.35
active = true
depth = 201
