if (transitioned)
    exit;

var prev_spawn_align = global.target_spawn_align;
set_spawn_alignment(spawn_alignment[0], spawn_alignment[1]);

if (!queue_room(target_room, target_spawn))
{
    set_spawn_alignment(prev_spawn_align[0], prev_spawn_align[1]);
    exit;
}

set_spawn_offset(other);

if (trans_room(obj_roomtrans_fade))
    transitioned = true;