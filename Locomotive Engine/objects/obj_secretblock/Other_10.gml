if ds_list_find_index(global.saveroom, id) == -1 {
    repeat (2) {
        with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), particlespr)) {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    create_particle((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), spr_parryeffect) 
    fmod_event_oneshot3D(sfx_destructible)
}
for (var i = 0; i < array_length(target_tiles); i++)
	scr_destroy_tiles(32, target_tiles[i]);
