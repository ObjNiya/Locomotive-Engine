/// @ignore
function StatePlayerParryStart()
{
    movespeed = -8;
    parryCount = 0;
    
    sprite_index = choose(spr_parry1, spr_parry2, spr_parry3, spr_parry4);
    image_index = 0;
    image_speed = 0.5;
    
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
    
    if (parryCount >= 8)
        return;
    
    parryCount++;
    
    with (par_enemy)
    {
        static parry_threshold = 84;
        
        if (other.parryTarget != id && distance_to_object(other) > parry_threshold)
            return;
        
        if (FIX_PARRYABLE_FORKNIGHTS_DURING_STUN)
        {
            if (stateName != "Walk" || hitstunTimer.state == TIMER_STATES.STARTED)
                return;
        }
        else
        {
            if ((stateName != "Walk" && (stateName != "Stunned" || object_index != obj_shyguy)) || hitstunTimer.state == TIMER_STATES.STARTED)
                return;
        }
        
        // TODO: Add Combo
        
        other.image_xscale = -image_xscale;
        
        hitstunApply(5);
        SmcSetState("Death");
        
        with (other)
        {
            camera.shake_set(3, 0.05);
            if (FIX_MISSING_PARRY_HITSTUN)
                hitstunApply(5);
            if (!grounded)
                vsp = -6;
            
        }
        
        repeat (3)
            instance_create(x, y, obj_slap_star_debris);
        repeat (3)
            instance_create(x, y, obj_enemy_debris);
        instance_create(x, y, obj_parry_particle);
    }
}