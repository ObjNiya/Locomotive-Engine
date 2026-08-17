/// @ignore
function StatePlayerParryCreate()
{
    movespeed = -8;
    parryCount = 0;
    
    sprite_index = choose(spr_parry1, spr_parry2, spr_parry3, spr_parry4);
    image_index = 0;
    image_speed = 1.15;
    
    FlashEffectSet();
}

/// @ignore
function StatePlayerParryStep()
{
    invincibleBuffer = 1;
    
    if (AnimationEnd())
    {
        SmcSetState("Normal");
        return;
    }
    
    movespeed = Approach(movespeed, 0, 0.5);
    hsp = movespeed * dir;
    
    if (parryCount >= 8)
        return;
    
    parryCount++;
    
    with (par_enemy)
    {
        static parry_threshold = 84;
        
        if ((other.parryTarget != id && distance_to_object(other) > parry_threshold) 
            || hitstunTimer > 0 || !parryable || stateName == "Grabbed")
            continue;
        
        other.image_xscale = -image_xscale;
        other.dir = other.image_xscale;
        
        attackHitbox.canAttack = false;
        HitstunSet(5);
        
        with (other)
        {
            camera.shake_set(3, 0.05);
            if (!grounded)
                vsp = -6;
        }
        
        repeat (3)
            InstanceCreate(x, y, obj_slap_star_debris);
        repeat (3)
            InstanceCreate(x, y, obj_enemy_debris);
        
        InstanceCreate(x, y, obj_parry_particle);
        InstanceCreate(x, y, obj_puff_particle);
        
        call_later(1, time_source_units_frames, function() {
            InstanceCreate(x, y, obj_bang_particle);
        });
        
        call_later(5, time_source_units_frames, function() {
            instance_destroy();
        })
    }
}