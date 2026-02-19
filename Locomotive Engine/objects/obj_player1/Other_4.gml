afterimages_mach = []
afterimages_blur = []
saveroom_init_room()
var dr = noone
if targetDoor == "S"
    dr = obj_secretportalstart
else
    dr = asset_get_index("obj_door_" + targetDoor)
var h = -4
var v = -4
if instance_exists(dr) {
	x = dr.x + 16
	y = dr.y - 14
    if piped {
        y = dr.y + (bbox_height * pipedDir)
        x = dr.x + 16
        piped = false
    }
	with dr {
		if place_meeting(x, y, obj_hallway) {
			h = instance_place(x, y, obj_hallway)
		}
        if place_meeting(x, y, obj_verticalhallway) {
			v = instance_place(x, y, obj_verticalhallway)
		}
	}
	if instance_exists(h) {
		var mult = mask_index == spr_crouchmask ? horizontalHallwayMult_crouch : horizontalHallwayMult
		y = (h.y) + (mult * (h.sprite_height - 46))
		x = h.x + horizontalHallwayDir * 100
	}
    if instance_exists(v) {
        y = v.y + (100 * verticalHallwayDir)
		x = v.x + 13 + (verticalHallwayMult * (v.sprite_width - (13 * 2)))
    }
}
roomstartx = x
roomstarty = y