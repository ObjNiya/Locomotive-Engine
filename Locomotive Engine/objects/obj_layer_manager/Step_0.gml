var meeting_scrt_ts = false;
with (obj_player)
    meeting_scrt_ts = place_meeting(x, y, obj_secret_tiles);

global.scrt_ts_circle_radius = scrt_ts_circle_rad.value;

if (!meeting_scrt_ts)
{
    scrt_ts_circle_rad.set_seek_target(0);
    exit;
}

scrt_ts_circle_rad.set_seek_target(1);
    
global.scrt_ts_circle_x = obj_player.x;
global.scrt_ts_circle_y = obj_player.y;