/// @ignore
function StatePlayerSwingdingCreate()
{
    SpriteSet(spr_swingding, 0);
    
    deccel = 0.25;
    instakillHitbox.canAttack = true;
}

/// @ignore
function StatePlayerSwingdingStep()
{
    static spin_snd_timer = 5;
    static swingding_throw_cd = 20;
    
    if (grounded)
        movespeed = Approach(movespeed, 0, deccel);
    
    hsp = movespeed * dir;
    
    PlayerDoInstakill();
    
    if (--spin_snd_timer < 0 && floor(image_index) == 0)
    {
        spin_snd_timer = 5;
        sound_instance_start(sndSpin);
    }
    
    if (PlayerDoGroundpound())
        return;
    
    if ((--swingding_throw_cd < 0 && InputPressed(INPUT_VERB.GRABDASH)) || place_meeting_collision(x + hsp, y, Exclude.SLOPES))
    {
        swingding_throw_cd = 20;
        spin_snd_timer = 5;
        
        SmcSetState("Throw");
        
        SpriteSet(spr_swingding_throw, 0);
        image_xscale = Side(InputX(INPUT_CLUSTER.NAVIGATION), image_xscale);
        hsp = movespeed * image_xscale;
        
        sound_instance_stop(sndSpin, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    }
    
    if (hsp == 0)
    {
        SmcSetState("Normal");
        sprite_index = spr_hauling_idle;
        spin_snd_timer = 5;
        
        return;
    }
    
    var x_offset = 0;
    var targ_depth = PRIORITY.LOW;
    
    switch (floor(image_index))
    {
        case 0:
            x_offset = 50;
            break;
        
        case 1:
        case 7:    
            x_offset = 25;
            break;
        
        case 3:
        case 5:    
            x_offset = -25;
            break;
        
        case 4:
            x_offset = -50;
            break;
    }
    
    if (InRange(floor(image_index), 1, 3))
        targ_depth = PRIORITY.MAX;
    
    x_offset *= image_xscale;
    
    with (carryingId)
    {
        y = other.y;
        x = other.x + x_offset;
        
        SetLayer(targ_depth, false);
    }
}

/// @ignore
function StatePlayerSwingdingDestroy()
{
    
}

/// @ignore
function StatePlayerSwingdingRoomStart()
{
    instakillHitbox.canAttack = false;
    if (carryingId == noone)
        SmcSetState("Normal");
}