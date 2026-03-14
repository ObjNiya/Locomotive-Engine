if (transitioned)
    exit;

if (!queue_room(target_room, target_spawn))
    exit;

set_spawn_align(spawn_xalign, spawn_yalign);

var spawn_offsets = get_spawn_offset(other);
set_spawn_offset(spawn_offsets[0], spawn_offsets[1]);

if (trans_room(obj_roomtrans_fade))
    transitioned = true;