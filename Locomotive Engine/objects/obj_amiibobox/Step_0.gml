
if (place_meeting(x, y, obj_player) && sprite_index == spr_amiibobox)
{
	//with (obj_player1)
	//{
	//	if (irandom(100) <= 50)
	//		fmod_studio_event_instance_start(happyvoice)
	//}
	add_points(1000, false)
	create_number(x, y, 1000)
	global.combotime = 60	
	var spr = ""
	var plush = ""
	switch content {
		case "waddle":
			global.plushiefollow.waddle = true
			spr = "tvplushie1"
			plush = "waddle"
			break;
		case "koopa":
			global.plushiefollow.koopa = true
			spr = "tvplushie2"
			plush = "koopa"
			break;
		case "squash":
			global.plushiefollow.squash = true
			spr = "tvplushie3"
			plush = "squash"
			break;
		case "cappy":
			global.plushiefollow.cappy = true
			spr = "tvplushie4"
			plush = "cappy"
			break;
		case "wario":
			global.plushiefollow.wario = true
			spr = "tvplushie5"
			plush = "wario"
			break;

	}
	if plush != "" {
		with follow_create(plush, x, y,
		asset_get_index($"spr_plushie{plush}"),
		asset_get_index($"spr_plushie{plush}_run"),
		asset_get_index($"spr_plushie{plush}_intro"),
		asset_get_index($"spr_plushie{plush}_taunt")) {
			image_index = 0 
			sprite_index = introspr
		}
	}
	var count = 0
	var names = struct_get_names(global.plushiefollow)
	for (var i = 0; i < array_length(names); i++) {
		if struct_get(global.plushiefollow, names[i])
			count++
	}
	var txt = string_concat("You need ", string(5 - count), " more plushies!" )
	if count == 5
		txt = "You got all the plushies!"
	create_transfotext(txt)
	fmod_event_oneshot3D(sfx_collectplushie)
    change_tv(asset_get_index($"spr_{spr}_damian"), true, 60 * 3, 0.25)
	
    instance_destroy()
}