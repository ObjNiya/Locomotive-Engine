with (obj_player)
{
    if (stateName == "Hurt" || stateName == "Bananaslip" || stateName == "Warppipe" || stateName == "Anim")
        exit;
    
    var up_warppipe = (place_meeting(x, y - 1, other) && other.image_yscale == -1 && bbox_top >= other.bbox_bottom && floor(vsp) <= 0 && !grounded && (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1 || stateName == "Sjump"));
    var down_warppipe = (place_meeting(x, y + 1, other) && other.image_yscale == 1 && bbox_bottom <= other.bbox_top && grounded && (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 || stateName == "Groundpound"));

    if (!up_warppipe && !down_warppipe)
        exit;
    
    if (!RoomQueue(other.targetRoom, other.targetSpawn))
        exit;
    
    SpawnSetAlign(fa_right, fa_bottom);
    SpawnSetOffset(0, 0);
    
    x = other.x;
    
    if (up_warppipe)
    {
        SpriteSet(spr_warppipe_up, 0);
        if (stateName == "Sjump")
            image_index = image_number / 2;
    }
    else if (down_warppipe && stateName == "Groundpound")
        image_index = image_number / 2;
    
    warppipeId = other.id;
    SmcSetState("Warppipe");
    
    sound_instance_one_shot(sfx_warp_pipe_enter);
}