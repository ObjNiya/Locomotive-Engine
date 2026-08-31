function StatePlayerKungfuCreate()
{
    image_index = 0;
    
    if (grounded)
        sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3);
    else
        sprite_index = choose(spr_kungfu1_air_intro, spr_kungfu2_air_intro, spr_kungfu3_air_intro);
    
    accel = 0.6;
    deccel = 0.6;
    
    if (dir == 0)
        dir = image_xscale;
    else
        image_xscale = dir;
    
    if (grounded && movespeed < 10)
        movespeed = 10;
    
    instakillHitbox.canAttack = true;
    sound_instance_start(sndGrabdash);
    time_source_start(blurAfterimageTimer);
}

function StatePlayerKungfuStep()
{
    static kungfu_repress_cd = 15;
    
    if (--kungfu_repress_cd <= 0 && InputPressed(INPUT_VERB.GRABDASH))
    {
        kungfu_repress_cd = 15;
        
        StatePlayerKungfuCreate();
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
    {
        SmcSetState("Machroll");
        image_xscale = Side(hsp, image_xscale);
        return;
    }
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        vsp = -11;
        
        sprite_index = spr_kungfu_backflip;
        image_xscale = Side(sign_input_x, image_xscale);
        
        SmcSetState("Mach");
        PartSpawn(x, bbox_bottom, PART_TYPES.JUMPCLOUD);
        sound_instance_one_shot(sfx_player_grab_cancel, x, y);
        
        return;
    }
    
    if (sign_input_x == dir && movespeed < 12)
        movespeed += accel;
    else if (sign_input_x == -dir)
    {
        movespeed -= deccel;
        if (movespeed <= 0)
            dir = sign_input_x;
    }
        
    hsp = movespeed * dir;
    
    var x_pos = (sign(hsp) == 1) ? ceil(x + hsp) : floor(x + hsp);
    BlocksDestroy(x_pos, y, true, false, [obj_metalblock]);
    
    if (PlayerDoWallsplat())
        return;

    var ground_spr = EqualsToAny(sprite_index, spr_kungfu1, spr_kungfu2, spr_kungfu3);
    
    if (!grounded && ground_spr)
    {
        sprite_index = choose(spr_kungfu1_air_intro, spr_kungfu2_air_intro, spr_kungfu3_air_intro);
        image_index = 0;
    }
    
    if (grounded && (!EqualsToAny(sprite_index, spr_kungfu1, spr_kungfu2, spr_kungfu3) || AnimationEnd()))
    {
        if (PlayerMachrun() && sign_input_x == dir)
        {
            SmcSetState("Mach");
            sprite_index = spr_mach2;
            
            return;
        }
    
        SmcSetState("Normal");
    }
    
    AnimationEndExt(sprite_index == spr_kungfu1_air_intro, spr_kungfu1_air);
    AnimationEndExt(sprite_index == spr_kungfu2_air_intro, spr_kungfu2_air);
    AnimationEndExt(sprite_index == spr_kungfu3_air_intro, spr_kungfu3_air);
}

function StatePlayerKungfuDestroy()
{
    instakillHitbox.canAttack = false;
    time_source_stop(blurAfterimageTimer);
}