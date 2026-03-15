var plyr = instance_place(x, y, obj_player);

with (plyr)
    other.player = id;

if (!instance_exists(player))
    exit;

player.camera.y_offsets[$ "painting_extend"] = cam_tween.value * -120;

if (cutscene)
{
    cam_tween.set_seek_target(0);
    
    with (player)
    {
        if (y >= other.y && vsp >= 0 && visible)
        {
            visible = false;
            goto_level(other.level_id);
        }
        
        visual_xscale = approach(visual_xscale, 0.4, other.plyr_shrink_spd);
        visual_yscale = approach(visual_yscale, 0.4, other.plyr_shrink_spd);
        
        other.plyr_shrink_spd += 0.0002;
    }
    
    exit;
}

if (place_meeting(x, y, player))
{
    cam_tween.set_seek_target(real(player.dir == 0));
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1 && player.grounded && player.state_id == state_player_normal)
    {
        cutscene = true;
        
        with (player)
        {
            sprite_index = spr_paintingjump;
            
            grav = 0.3;
            vsp = -12;
            
            if (other.x > x)
                hsp = 1;
            else
                hsp = -1;
            
            movespeed = 0;
            
            smc_set_state(smc_empty_state);
            sound_instance_one_shot(sfx_jump, x, y);
        }
    }
}
else
    cam_tween.set_seek_target(0);