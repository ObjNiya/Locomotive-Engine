/// @ignore
function StatePlayerLadderCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    sprite_index = spr_ladder_up;
    image_speed = 1;
    
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vertMovespeed = 6;
    
    time_source_start(airCloudParticleTimer);
}

/// @ignore
function StatePlayerLadderStep()
{
    vertDir = sign(InputY(INPUT_CLUSTER.NAVIGATION));
    
    image_speed = 1;
    time_source_pause(airCloudParticleTimer);
    
    switch (vertDir)
    {
        case -1:
            sprite_index = spr_ladder_up;
            time_source_resume(airCloudParticleTimer);
            vertMovespeed = 6;
            break;
        case 0:
            sprite_index = spr_ladder_up;
            image_speed = 1;
            break;
        case 1:
            sprite_index = spr_ladder_down;
            image_speed = -1;
            vertMovespeed = 10;
            break;
    }
    
    vsp = vertMovespeed * vertDir;
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        SmcSetState("Normal");
        SpriteSet(spr_jump, 0);
        vsp = -11;
        
        if (vertDir == 1)
        {
            vsp = 10;
            sprite_index = spr_fall;
        }
        
        return;
    }
    
    if (!instance_exists(ladder_id) || !place_meeting(x, y, ladder_id) || (grounded && vertDir == 1 && !place_meeting(x, y, obj_platform)))
    {
        vsp = 0;
        SmcSetState("Normal");
    }
}

/// @ignore
function StatePlayerLadderDestroy()
{
    ladderId = noone;
    time_source_resume(airCloudParticleTimer);
    time_source_stop(airCloudParticleTimer);
    
    image_speed = 1;
    image_index = 0;
}