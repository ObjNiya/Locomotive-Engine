if (instance_exists(par_roomtransition))
    exit;

var bottom_y = y + sprite_height;
var player_bottom_y = other.y + (other.sprite_height - other.sprite_yoffset - PLAYER_MASK_OFFSET);

var y_offset = player_bottom_y - bottom_y;

queue_room(target_room, target_spawn);
add_spawn_offset(0, y_offset);

trans_room(obj_roomtrans_fade);