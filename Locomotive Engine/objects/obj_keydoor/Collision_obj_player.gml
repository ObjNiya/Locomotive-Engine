with (other)
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 || !grounded || stateName == "Grabdash" || stateName == "Bananaslip" || stateName == "Anim" || stateName == "Door")
        exit;
	
	var play_keydoor_animation = false
    
    if (hasKey)
    {
        hasKey = false;
		play_keydoor_animation = true
		other.image_index = 0
        SaveroomAdd(other.id);
    }
	
    if (!SaveroomCheck(other.id) || !RoomQueue(other.targetRoom, other.targetSpawn))
        exit;
    
    SpawnSetAlign(fa_center, fa_bottom);
    SpawnSetOffset(0, 0);
    
    SmcSetState("Door");
	
	if play_keydoor_animation
	{
		SpriteSet(spr_keydoor, 0);
		sound_instance_one_shot(sfx_door_unlock);
	}
	else
		RoomTrans(obj_roomtrans_fade);
}