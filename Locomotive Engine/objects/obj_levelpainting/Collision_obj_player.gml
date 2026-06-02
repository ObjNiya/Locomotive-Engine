with (other)
{
    if (cam_painting_up.seek_target != 1 || stateName == "Painting" || sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1)
        exit;
    
    stop_music();
    painting_id = other.id;
    SmcSetState("Painting");
}