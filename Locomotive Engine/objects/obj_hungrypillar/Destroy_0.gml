if ds_list_find_index(global.saveroom, id) == -1 {
    scr_escape_init(minutes, seconds)
    obj_camera.alarm[1] = 60
    
    // instance_create(x, y, obj_bangeffect)
    
    fmod_event_oneshot(sfx_pillardeath)
    repeat(3)
		create_particle(x, y, spr_slapstar)
	repeat(3)
		create_particle(x, y, spr_baddiegibs)
    
    with (obj_camera)
    {
        zooming = true
		zoom_target = 1
		zoom_spd = 0.035
        shake_mag = 3
        shake_mag_acc = (3 / 60)
    }
    ds_list_add(global.saveroom, id)
}