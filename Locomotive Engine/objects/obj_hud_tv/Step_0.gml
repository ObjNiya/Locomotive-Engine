state_machine_step();

tv_offset_target = 0;

with (par_player)
{
    if (x > room_width - other.tv_offset_hitbox[0] && y < other.tv_offset_hitbox[1])
        other.tv_offset_target = sprite_width * 2;
}

var tv_movespeed = 15;

//x = approach(x, xstart + tv_offset_target, tv_movespeed);
//y = approach(y, ystart - tv_offset_target, tv_movespeed);