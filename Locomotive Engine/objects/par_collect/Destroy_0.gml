with instance_create(x - CAM_X, y - CAM_Y, obj_hudcollect) {
	value = other.value
	sprite_index = other.sprite_index
	image_index = other.image_index
}
got()
ds_list_add(global.saveroom, id)