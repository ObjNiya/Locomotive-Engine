/// @ignore
function StatePlayerCapeCreate()
{
    SpriteSet(spr_cape, 0);
    image_speed = 0;
    
    grav = 0;
    vertMovespeed = 12;
    movespeed = 16;
    vsp = -8;
    
    accel = 0.025;
    vertAccel = 0.55;
    
    time_source_start(blurAfterimageTimer);
}

/// @ignore
function StatePlayerCapeStep()
{
    vertDir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (sprite_index == spr_cape_bounce)
    {
        vsp = Approach(vsp, 0, 0.5);
        
        if (!AnimationEnd())
            return;
        
        SpriteSet(spr_cape, 0);
        image_speed = 0;
        image_xscale *= -1;
        dir = image_xscale;
        hsp = 12 * dir;
        
        switch (vertDir)
        {
            case -1:
                vsp  = -8;
                image_index = 0;
                break;
            
            case 0:
                vsp = 1;
                image_index = 6;
                break;
            
            case 1:
                vsp = 8;
                image_index = image_number - 1;
                break;
        }
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        SmcSetState("CapeFall");
        return;
    }
    
    if (PlayerDoTaunt())
        return;
    
    if (grounded)
    {
        SmcSetState("Machroll");
        return;
    }
    
    if (PlayerHitWall())
    {
        SpriteSet(spr_cape_bounce, 0);
        image_speed = 1;
        vsp = clamp(vsp, -5, 5);
        
        return;
    }

    if (sign(vsp) == -1 && vertDir == -1)
        vertAccel = 0.5;
    else
        vertAccel = 1.2;
    
    vertMovespeed = (sign(vsp) == 1) ? 20 : 12;
    
    var target_speed = vertMovespeed * vertDir;
    var approach_speed = sprite_get_speed(sprite_index);
    
    if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond)
        approach_speed /= game_get_speed(gamespeed_fps);
    
    if (vertDir == 0)
    {
        target_speed = 2;
        
        if (sprite_index == spr_cape)
            image_index = Approach(image_index, 7, approach_speed);
    }
    else if (sprite_index == spr_cape)
        image_index = Approach(image_index, (image_number - 1) * real(vertDir == 1), approach_speed);
    
    image_xscale = Side(hsp, image_xscale);
    
    vertMovespeed = (vertDir == 1) ? 20 : 14;
    
    var input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (input_x != 0)
        dir = input_x;
    
    hsp = Approach(hsp, movespeed * dir, accel);
    vsp = Approach(vsp, target_speed, vertAccel);
    
    var abs_hsp = abs(hsp);
    
    if (InRange(abs_hsp, 0, 6) || sign(hsp) != dir)
        accel = 0.8;
    else if (InRange(abs_hsp, 6, 8))
        accel = 0.7;
    else if (InRange(abs_hsp, 8, 12))
        accel = 0.5;
    else
        accel = 0.025;
}

/// @ignore
function StatePlayerCapeDestroy()
{
    image_speed = 1;
    
    grav = 0.5;
    
    instakillHitbox.canAttack = false;
    machAfterimageUseAlpha = true;
    
    time_source_stop(machAfterimageTimer);
    time_source_stop(blurAfterimageTimer);
}