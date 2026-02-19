if (place_meeting(x, y, obj_player))
{
	ds_list_add(global.saveroom, id)
	global.combotime = 60
	global.catripi = true
    var plush = "catripi"
	with follow_create(plush, x, y, 
        asset_get_index($"spr_{plush}_keyidle"), 
        asset_get_index($"spr_{plush}_keymove"), 
        asset_get_index($"spr_{plush}_collected"), 
        asset_get_index($"spr_{plush}_taunt")) { 
        image_index = 0 
        sprite_index = introspr 
    }
	fmod_event_oneshot3D(sfx_keymanget)
	change_tv(spr_tvcatripi_damian, true, 60 * 3, 0.25)
	instance_destroy()
	with (obj_player) {
	    roomstartx = other.x
	    roomstarty = other.y
	}
}