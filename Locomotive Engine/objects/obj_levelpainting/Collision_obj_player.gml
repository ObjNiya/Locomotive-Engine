with (other)
{
    if (stateName == "Painting" || sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1)
        exit;
    
    MusicStop();
    paintingId = other.id;
    SmcSetState("Painting");
}