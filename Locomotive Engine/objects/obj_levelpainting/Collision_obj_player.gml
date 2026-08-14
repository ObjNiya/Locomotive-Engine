with (other)
{
    if (camPaintingUp.seek_target != 1 || stateName == "Painting" || sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1)
        exit;
    
    MusicStop();
    paintingId = other.id;
    SmcSetState("Painting");
}