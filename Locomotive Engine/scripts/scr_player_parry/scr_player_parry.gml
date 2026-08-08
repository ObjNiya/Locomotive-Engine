/// @ignore
function StatePlayerParryCreate()
{
    movespeed = -8;
    parryCount = 0;
    
    sprite_index = choose(spr_parry1, spr_parry2, spr_parry3, spr_parry4);
    image_index = 0;
    image_speed = 1.15;
    
    create_flash_effect(true);
}

/// @ignore
function StatePlayerParryStep()
{
    invincibleBuffer = 1;
    
    if (animation_end())
    {
        SmcSetState("Normal");
        return;
    }
    
    movespeed = approach(movespeed, 0, 0.5);
    hsp = movespeed * dir;
    
    if (parryCount >= 8)
        return;
    
    parryCount++;
    
    with (par_enemy)
    {
        static parry_threshold = 84;
        
        if ((other.parryTarget != id && distance_to_object(other) > parry_threshold) 
            || hitstunTimer.state == TIMER_STATES.STARTED || !parryable)
            continue;
        
        // TODO: Add Combo
        
        other.image_xscale = -image_xscale;
        other.dir = other.image_xscale;
        
        SmcSetState("Death");
        hitstunApply(5);
        
        with (other)
        {
            camera.shake_set(3, 0.05);
            if (FIX_MISSING_PARRY_HITSTUN)
                hitstunApply(5);
            if (!grounded)
                vsp = -6;
            
        }
        
        repeat (3)
            InstanceCreate(x, y, obj_slap_star_debris);
        repeat (3)
            InstanceCreate(x, y, obj_enemy_debris);
        InstanceCreate(x, y, obj_parry_particle);
        
        call_later(1, time_source_units_frames, function() {
            InstanceCreate(x, y, obj_bang_particle);
        });
    }
}