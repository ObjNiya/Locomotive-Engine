/// @ignore
function StatePlayerPaintingCreate()
{
    
    
    sprite_index = spr_walk;
    
    hsp = 0;
    movespeed = 0;
    vertMovespeed = 0;
    accel = 0.5;
    
    camera.LockSet(CAM_LOCK.ON);
}

/// @ignore
function StatePlayerPaintingStep()
{
    if (!instance_exists(paintingId))
    {
        SmcSetState("Normal");
        return;
    }
    
    var target_dir = BSign(paintingId.x < x);
    var target_x = paintingId.x + (120 * target_dir);
    
    if (x != target_x && grounded)
    {
        if (time_source_get_state(cloudParticleTimer) != time_source_state_active)
            time_source_start(cloudParticleTimer); 
        
        movespeed = Approach(movespeed, 6, accel );
        x = Approach(x, target_x, movespeed);
        
        sprite_index = spr_walk;
        image_xscale = target_dir;
        
        var image_speed_curve = [1, 1.25, 1.5];
        
        var image_speed_curve_index = floor(movespeed / 3);
        image_speed_curve_index = clamp(image_speed_curve_index, 0, array_length(image_speed_curve) - 1);
        
        image_speed = image_speed_curve[image_speed_curve_index];
    }
    else if (grounded)
    {
        time_source_stop(cloudParticleTimer); 
        sound_instance_one_shot(sfxJump, x, y);
        
        vsp = -15;
        hsp = -2.5 * target_dir;
        movespeed = 0;
        
        SpriteSet(spr_jump, 0);
        image_speed = 1;
        image_xscale = -target_dir;
    }
    else
    {
        AnimationEnd(spr_fall);
        
        if (sign(vsp) == -1)
            exit;
        
        if (y > paintingId.ystart && visible)
        {
            visible = false;
            
            hsp = 0;
            vsp = 0;
            grav = 0;
            
            with (paintingId)
            {
                rippleSpeed = 0.032;
                alarm[0] = 45;
            }

            sound_instance_one_shot(sfx_enterpainting);
        }
        else if (y + vsp > paintingId.ystart)
        {
            FadeAfterimgCreate();
            FlashEffectSet();
        }
    }
}

/// @ignore
function StatePlayerPaintingDestroy()
{
    camera.LockSet(CAM_LOCK.OFF);
    
    visible = true;
}