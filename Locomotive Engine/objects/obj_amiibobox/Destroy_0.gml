for (var i = 0; i < sprite_get_number(spr_amiibobox_debris); i++)
	with create_debris(x, y, spr_amiibobox_debris)
		image_index = i
ds_list_add(global.saveroom, id)

