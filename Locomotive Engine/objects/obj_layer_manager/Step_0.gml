var meeting_scrt_ts = false;
with (obj_player)
    meeting_scrt_ts = place_meeting(x, y, obj_secret_tiles);

global.ScrtTsCircleRadius = scrt_ts_circle_rad.value;

if (!meeting_scrt_ts)
{
    scrt_ts_circle_rad.set_seek_target(0);
    exit;
}

scrt_ts_circle_rad.set_seek_target(1);
    
global.ScrtTsCircleX = obj_player.x;
global.ScrtTsCircleY = obj_player.y;