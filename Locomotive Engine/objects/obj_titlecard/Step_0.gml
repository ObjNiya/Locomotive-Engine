if (sound_instance_get_playback_state(title_music) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
    exit;

queue_room(rm_initialize_level, obj_spawn_a);
trans_room(obj_roomtrans_fade, -1);