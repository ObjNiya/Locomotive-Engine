with (other)
{
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 || !grounded || state_id == state_player_grabdash || state_id == state_player_bananaslip || state_id == state_player_animation || state_id == state_player_door)
        exit;
    
    var prev_spawn_align = global.target_spawn_align;
    set_spawn_alignment(SPAWN_XALIGN.CENTER, SPAWN_YALIGN.BOTTOM);
    
    if (!queue_room(other.target_room, other.target_spawn))
    {
        set_spawn_alignment(prev_spawn_align[0], prev_spawn_align[1]);
        exit;
    }
    
    var y_offset = sprite_yoffset + sprite_get_bbox_bottom(mask_index) - sprite_height;
    y_offset++;
    
    add_spawn_offset(0, -y_offset)
    
    smc_set_state(state_player_door);
    
    trans_room(obj_roomtrans_fade);
}