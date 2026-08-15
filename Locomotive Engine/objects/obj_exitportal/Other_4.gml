if (IsShowtime() || SaveroomCheck())
{
    if (!IsShowtime())
        visible = false;
    exit;
}

with (obj_player)
{
    x = other.x;
    y = other.y;
    
    SmcSetState("Exitportal");
    sound_instance_one_shot(sfx_player_banana_slip, x, y);
}

alarm[0] = 90;
SaveroomAdd();