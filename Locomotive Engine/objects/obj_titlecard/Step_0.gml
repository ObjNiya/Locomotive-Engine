if (sound_instance_get_playback_state(titleMusic) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
    exit;

RoomQueue(rm_initialize_level, obj_spawn_a);
RoomTrans(obj_roomtrans_fade, -1);