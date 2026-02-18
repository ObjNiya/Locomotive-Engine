if ds_list_find_index(global.saveroom, id) == -1 {
    with (instance_create((x + 32), (y + 32), obj_sausageman_dead))
        sprite_index = spr_metalbsecretdead
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = (40 / 60) // room_speed
    }
    fmod_event_oneshot3D(sfx_metaldestructible)
}
for (var i = 0; i < array_length(target_tiles); i++)
	scr_destroy_tiles(32, target_tiles[i]);
scr_cutoff()
scr_destroy_nearby_tiles()