if ds_list_find_index(global.saveroom, id) != -1 {
    active = 0
}
if !active {
    if instance_exists(obj_cutscene) {
        with instance_create(x, y, obj_secretportalstart) {
            paletteselect = other.paletteselect
            sprite_index = spr_secretportal_close
        }
    }
    instance_destroy()
}