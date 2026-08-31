/// @ignore
function StatePlayerExitportalCreate()
{
    
    
    grav = 0.2;
    vsp = -3;
    hsp = 0;
    
    movespeed = 0;
    vertMovespeed = 0;
    
    visualXScale = 0;
    visualYScale = 0;
    
    sprite_index = spr_bananaslip_bump;
    image_xscale = 1;
    
    time_source_start(blurAfterimageTimer);
}

/// @ignore
function StatePlayerExitportalStep()
{
    if (grounded)
    {
        if (sprite_index != spr_bananaslip_land)
        {
            visualXScale = 1;
            visualYScale = 1;
            
            time_source_stop(blurAfterimageTimer);
            PartSpawn(x, bbox_bottom, PART_TYPES.BANG);
            sound_instance_one_shot(sfx_player_bananaslip_bump, x, y);
            
            sprite_index = spr_bananaslip_land;
        }
        else if (AnimationEnd())
            SmcSetState("Normal");
        
        return;
    }
    
    visualXScale = Approach(visualXScale, 1, 0.04);
    visualYScale = Approach(visualYScale, 1, 0.04);
    
    if (grav < 0.4)
        grav += 0.007 ;
}

/// @ignore
function StatePlayerExitportalDestroy()
{
    grav = 0.5;
}