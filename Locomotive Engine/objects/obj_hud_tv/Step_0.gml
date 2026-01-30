state_machine_step();

var tv_offset = 0;

with (par_player)
{
    var overlapping_tv_x = 317;
    var overlapping_tv_y = 284;
    
    if (x > room_width - overlapping_tv_x && y < overlapping_tv_y)
        tv_offset = max(sprite_width * 2, sprite_height * 2);
}

var tv_movespeed = 15;

x = approach(x, xstart + tv_offset, tv_movespeed);
y = approach(y, ystart - tv_offset, tv_movespeed);