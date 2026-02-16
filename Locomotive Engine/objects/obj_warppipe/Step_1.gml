with (par_player)
{
    if (state_id == state_player_hurt || state_id == state_player_bananaslip || state_id == state_player_warppipe || state_id == state_player_animation)
        exit;
    
    var up_warppipe = (place_meeting(x, y - 1, other) && other.image_yscale == -1 && bbox_top >= other.bbox_bottom && floor(vsp) <= 0 && !grounded && (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1 || state_id == state_player_sjump));
    var down_warppipe = (place_meeting(x, y + 1, other) && other.image_yscale == 1 && bbox_bottom <= other.bbox_top && grounded && (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1 || state_id == state_player_groundpound));

    if (!up_warppipe && !down_warppipe)
        exit;
    
    var prev_spawn_align = global.target_spawn_align;
    set_spawn_alignment(SPAWN_XALIGN.RIGHT, SPAWN_YALIGN.BOTTOM);
    
    if (!queue_room(other.target_room, other.target_spawn))
    {
        set_spawn_alignment(prev_spawn_align[0], prev_spawn_align[1]);
        exit;
    }
    
    x = (other.x - other.sprite_xoffset) + (other.sprite_width / 2);
    
    var y_offset = sprite_yoffset + sprite_get_bbox_bottom(mask_index) - sprite_height;
    y_offset++;
    
    add_spawn_offset(0, -y_offset);
    
    if (up_warppipe)
    {
        sprite_set(spr_warppipe_up, 0);
        if (state_id == state_player_sjump)
            image_index = image_number / 2;
    }
    else if (down_warppipe && state_id == state_player_groundpound)
        image_index = image_number / 2;
    
    warppipe_id = other.id;
    smc_set_state(state_player_warppipe);
    
    sound_instance_one_shot(sfx_warp_pipe_enter);
}