if ds_list_find_index(global.saveroom, id) == -1 {
    repeat (8) {
        with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), particlespr)) {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    repeat (3)
	   create_particle(x + random_range(0, 64), y + random_range(0, 64), spr_deadjohnsmoke)  
    fmod_event_oneshot3D(sfx_destructible) 
} 
for (var i = 0; i < array_length(target_tiles); i++)
	scr_destroy_tiles(32, target_tiles[i]);
scr_cutoff()
scr_destroy_nearby_tiles()