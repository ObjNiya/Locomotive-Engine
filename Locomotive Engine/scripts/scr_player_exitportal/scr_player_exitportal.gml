/// @ignore
function StatePlayerExitportalCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    grav = 0.2;
    vsp = -3;
    hsp = 0;
    
    movespeed = 0;
    vert_movespeed = 0;
    
    visual_xscale = 0;
    visual_yscale = 0;
    
    sprite_index = spr_bananaslip_bump;
    image_xscale = 1;
    
    blur_afterimage_timer.Start();
}

/// @ignore
function StatePlayerExitportalStep()
{
    if (grounded)
    {
        if (sprite_index != spr_bananaslip_land)
        {
            visual_xscale = 1;
            visual_yscale = 1;
            
            sprite_set(spr_bananaslip_land, 0);
            create_particle(x, y + 45, obj_bang_particle);
            sound_instance_one_shot(sfx_player_banana_slip_bump, x, y);
            blur_afterimage_timer.Stop();
        }
        else if (animation_end())
            SmcSetState("Normal");
        
        return;
    }
    
    visual_xscale = approach(visual_xscale, 1, 0.04);
    visual_yscale = approach(visual_yscale, 1, 0.04);
    
    if (grav < 0.4)
        grav += 0.007;
}

/// @ignore
function StatePlayerExitportalDestroy()
{
    grav = 0.5;
}