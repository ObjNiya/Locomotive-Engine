with (other)
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 || !grounded || stateName == "Grabdash" || stateName == "Bananaslip" || stateName == "Anim" || stateName == "Door")
        exit;
    
    if (hasKey)
    {
        SaveroomAdd(other);
        hasKey = false;
    }

    if (!SaveroomCheck(other))
        exit;
    
    if (!RoomQueue(other.targetRoom, other.targetSpawn))
        exit;
    
    SpawnSetAlign(fa_center, fa_bottom);
    SpawnSetOffset(0, 0);
    
    SmcSetState("Door");
    RoomTrans(obj_roomtrans_fade);
}