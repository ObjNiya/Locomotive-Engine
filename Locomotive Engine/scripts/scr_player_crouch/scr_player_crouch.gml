/// @ignore
function StatePlayerCrouchCreate()
{
    mask_index = spr_crouchmask;
    image_speed = 1;
    
    maxSpd = 4;
    acel = 4;
    
    if (!grounded)
    {
        sprite_index = spr_crouch_fall;
        return;
    }
    
    if (sign(hsp) == 0)
        SpriteSet(spr_crouch_intro, 0);
    else
        sprite_index = spr_crawl;
}

/// @ignore
function StatePlayerCrouchStep()
{
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = maxSpd * dir;
    
    image_xscale = Side(dir, image_xscale);
    
    if (PlayerNothingAbove() && PlayerJump())
    {
        PlayerDoJump(false, spr_crouch_jump, -8);
        grounded = false;
    }
    
    if (PlayerDoLadder())
        return;
    
    if (!grounded)
    {
        if (sprite_index == spr_crouch_jump && !AnimationEnd())
            return;
        
        sprite_index = spr_crouch_fall;
        return;    
    }
    
    if (PlayerGetUp())
    {
        SmcSetState("Normal");
        return;
    }
    
    if (dir != 0)
    {
        sprite_index = spr_crawl;
        return;
    }
    
    if (sprite_index != spr_crouch_intro || AnimationEnd())
        sprite_index = spr_crouch;
}

/// @ignore
function StatePlayerCrouchDestroy()
{
    mask_index = spr_player_mask;
}