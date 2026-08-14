/// @ignore
function StatePlayerCapeCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_index = spr_cape;
    image_speed = 1;
    
    grav = 0;
    vertMovespeed = 15;
    
    vertDir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (vertDir == 0)
    {
        vsp = 3;
        image_index = 7;
    }
    else
    {
        vsp = 12 * vertDir;
        image_index = image_number * real(vertDir == 1);
    }
    
    accel = 0.025;
    vertAccel = 0.8;
    
    time_source_start(blurAfterimageTimer);
}

/// @ignore
function StatePlayerCapeStep()
{
    vertDir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    if (sprite_index == spr_cape_bounce)
    {
        vsp = 0;
        
        if (AnimationEnd(spr_cape))
        {
            image_xscale *= -1;
            dir = image_xscale;
            
            vsp = vertMovespeed * vertDir;
            
            image_speed = 1;
        }
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        SmcSetState("CapeFall");
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH))
    {
        dir = Side(sign(InputX(INPUT_CLUSTER.NAVIGATION)), image_xscale);

        movespeed += 0.5 * (dir == image_xscale);
        movespeed = median(12, movespeed, 20);
        
        image_xscale = dir;
        
        SpriteSet(spr_cape_spin, 0);
        image_speed = 1;
        
        sound_instance_start(sndGrabdash);
        
        machAfterimageUseAlpha = false;
        
        if (time_source_get_state(machAfterimageTimer) != time_source_state_active)
            time_source_start(machAfterimageTimer);

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
        image_xscale *= -1;
        dir *= -1;
        return;
    }
    
    if (sprite_index == spr_cape_spin)
    {
        PlayerDoInstakill();
        instakillmove = true;
        
        if (AnimationEnd(spr_cape))
        {
            machAfterimageUseAlpha = true;
            time_source_stop(machAfterimageTimer);
            instakillmove = false;
            
            image_speed = 1;
        }
    }
    
    switch (vertDir)
    {
        case 1: vertAccel = 1.5 break;
        case 0: vertAccel = 0.25 break;
        case -1: vertAccel = 0.75 break;
    }
    
    if (vertDir != sign(vsp) && vertDir != 0)
        vertAccel = 1.25;
    
    var target_speed = vertMovespeed * vertDir;
    var approach_speed = sprite_get_speed(sprite_index);
    
    if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond)
        approach_speed /= game_get_speed(gamespeed_fps);
    
    if (vertDir == 0)
    {
        target_speed = 3;
        
        if (sprite_index == spr_cape)
            image_index = Approach(image_index, 7, approach_speed);
    }
    else if (sprite_index == spr_cape)
        image_index = Approach(image_index, (image_number - 1) * real(vertDir == 1), approach_speed);
    
    vertMovespeed = (vertDir == 1) ? 20 : 14;
    
    if (movespeed > 16) 
        movespeed += accel;

    vsp = Approach(vsp, target_speed, vertAccel);
    hsp = movespeed * dir;
}

/// @ignore
function StatePlayerCapeDestroy()
{
    image_speed = 1;
    
    grav = 0.5;
    
    instakillmove = false;
    machAfterimageUseAlpha = true;
    
    time_source_stop(machAfterimageTimer);
    time_source_stop(blurAfterimageTimer);
}