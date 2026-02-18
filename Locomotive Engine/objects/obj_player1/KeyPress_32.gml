exit;
with instance_create(0, 0, obj_jumpscare)
	sprite_index = choose(nightmarechica_jumpscare, foxy_jumpscare)
audio_play_sound(ANIMATRONICSCREAM, 10, false, 1)