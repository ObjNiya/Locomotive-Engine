/// @ignore
function StatePlayerUppercutCreate()
{
    
    
    SpriteSet(spr_uppercut, 0);
    
    movespeed = 4;
    accel = 0.5;
    
    vsp = (grounded) ? -14 : -10;
    
    instakillHitbox.canAttack = true;
    machAfterimageUseAlpha = false;
    
    time_source_start(machAfterimageTimer);
}

/// @ignore
function StatePlayerUppercutStep()
{
    PlayerDoInstakill();
    BlocksDestroy(x, y - 50, false, true, [obj_metalblock]);
    
    dir = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    hsp = Approach(hsp, movespeed * dir, accel);
    
    if (AnimationEnd())
        image_speed = 0;
    
    if (vsp > 0)
        time_source_stop(machAfterimageTimer);
    
    if (!grounded)
        return;
    
    SmcSetState("Normal");
    return;
}

/// @ignore
function StatePlayerUppercutDestroy()
{
    instakillHitbox.canAttack = false;
    machAfterimageUseAlpha = true;
    
    time_source_stop(machAfterimageTimer);
    
    image_speed = 1;
}