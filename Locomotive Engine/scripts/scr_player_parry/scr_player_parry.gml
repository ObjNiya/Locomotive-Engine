/// @ignore
function StatePlayerParryCreate()
{
    movespeed = -8;
    parryCount = 0;
    
    sprite_index = choose(spr_parry1, spr_parry2, spr_parry3, spr_parry4);
    image_index = 0;
    
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
            camera.ShakeSet(3, 0.05, 0);
            if (!grounded)
                vsp = -6;
        }
        
        PartSpawn(x, y, PART_TYPES.SLAPSTARS_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);
        PartSpawn(x, y, PART_TYPES.ENEMY_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);
        PartSpawn(x, y, PART_TYPES.PARRYSPARK);
        PartSpawn(x, y, PART_TYPES.PUFF);

        call_later(1, time_source_units_frames, function() {
            PartSpawn(x, y, PART_TYPES.BANG);
        });
        
        call_later(5, time_source_units_frames, function() {
            instance_destroy();
        })
    }
}