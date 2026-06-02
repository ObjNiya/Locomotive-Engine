with (obj_player)
{
    if (stateName == "Hurt" || stateName == "Bananaslip" || stateName == "Warppipe" || stateName == "Anim")
        exit;
    
    var up_warppipe = (place_meeting(x, y - 1, other) && other.image_yscale == -1 && bbox_top >= other.bbox_bottom && floor(vsp) <= 0 && !grounded && (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1 || stateName == "Sjump"));
    var down_warppipe = (place_meeting(x, y + 1, other) && other.image_yscale == 1 && bbox_bottom <= other.bbox_top && grounded && (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 || stateName == "Groundpound"));

    if (!up_warppipe && !down_warppipe)
        exit;
    
    if (!queue_room(other.target_room, other.target_spawn))
        exit;
    
    set_spawn_align(SPAWN_XALIGN.RIGHT, SPAWN_YALIGN.BOTTOM);
    set_spawn_offset(0, 0);
    
    x = other.x;
    other.depth = DEPTHS.CLOSE;
    
    if (up_warppipe)
    {
        sprite_set(spr_warppipe_up, 0);
        if (stateName == "Sjump")
            image_index = image_number / 2;
    }
    else if (down_warppipe && stateName == "Groundpound")
        image_index = image_number / 2;
    
    warppipe_id = other.id;
    SmcSetState("Warppipe");
    
    sound_instance_one_shot(sfx_warp_pipe_enter);
}