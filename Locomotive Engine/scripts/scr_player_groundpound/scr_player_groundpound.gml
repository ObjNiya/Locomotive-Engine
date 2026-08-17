/// @ignore
function StatePlayerGroundpoundCreate()
{
    PLAYER_STATE_FAILSAVE;
    
    SpriteSet(spr_groundpound_intro, 0);
    if (carryingId != noone)
        sprite_index = spr_piledriver;
    
    accel = 0.25;
    deccel = 0.05;
    
    if (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == 0)
        hsp = 0;
    vsp = -6;
    
    terminalVelocity = infinity;
    instakillHitbox.canAttack = true;
    machAfterimageUseAlpha = false;
    
    time_source_start(blurAfterimageTimer);
    sound_instance_start(sndGroundpound);
}

/// @ignore
function StatePlayerGroundpoundStep()
{
    var landed = EqualsToAny(sprite_index, spr_groundpound_land, spr_divebomb_land, spr_piledriverland);
    
    if (grounded || landed)
    {
        if (groundedSlope && carryingId == noone)
        {
            SmcSetState("Mach"); 
            SpriteSet(spr_machroll_getup, 0);
            
            if (groundpoundSmash > 20)
                movespeed = 12;
            else
                movespeed = 8;
            
            dir = sign(-instance_place(x, y + 1, obj_slope).image_xscale);
            image_xscale = Side(dir, image_xscale);
            
            create_particle(x, y + 45, obj_jump_particle);
            return;
        }
        
        if (!landed)
        {
            SpriteSet((sprite_index == spr_divebomb) ? spr_divebomb_land : spr_groundpound_land, 0);
            image_speed = 1;
            
            hsp = 0;
            movespeed = 0;
            
            camera.shake_set(5, 0.25);
            
            machAfterimageUseAlpha = true;
			
            time_source_stop(machAfterimageTimer);
            time_source_stop(blurAfterimageTimer);
            time_source_stop(downwardsWooshPartTimer);
            time_source_stop(airCloudParticleTimer);

            create_particle(x, y + 45, obj_groundpound_slam_particle);
            instance_destroy(groundpoundEffectId);
            
            if (groundpoundSmash >= 10)
                BlocksDestroy(x, y + 1, false, true);
            
            sound_instance_stop(sndGroundpound, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
            sound_instance_one_shot(sfx_player_groundpound_land, x, y);
            
            if (carryingId != noone)
            {
                SpriteSet(spr_piledriverland, 0);
                create_particle(x, y + 35, obj_bang_particle);
                create_particle(x, y + 45, obj_land_cloud_particle);
            }    
           
            // TODO: Make enemies JUMP
            
            return;
        }
        
        vsp = 0;
        
        if (!AnimationEnd())
            return;
        
        SmcSetState("Normal");
        
        if (carryingId == noone)
        {
            SpriteSet(spr_groundpound_idle_intro, 0);
            return;
        }
        
        var prev_carry = carryingId;
        carryingId = noone;
        
        PlayerDoInstakill(prev_carry);
        
        if (InputCheck(INPUT_VERB.JUMP))
            vsp = -11;
        else
            vsp = -0.55;
        
        SpriteSet(spr_piledriver_jump, 0);
        return;
    }
    
    with (carryingId)
    {
        x = other.x + (16 * other.image_xscale);
        y = other.y + 16;
        depth = DEPTHS.CLOSE;
    }
    
    var y_pos = (sign(vsp) == 1) ? ceil(y + vsp + grav) : floor(y + vsp + grav);
    BlocksDestroy(x, y_pos, false, true, [obj_metalblock]);
    if (carryingId == noone)
        InputVerbConsume(INPUT_VERB.JUMP);
    PlayerDoInstakill();
    
    if (InputPressed(INPUT_VERB.GRABDASH))
    {
        SmcSetState("Sjump");
        SpriteSet(spr_sjump_cancel_prepare, 0);
        instance_destroy(obj_explosion_particle_alt);
        
        sound_instance_one_shot(sfx_player_sjump_cancel, x, y);
        
        vsp = 0;
        grav = 0;
        return;
    }

    groundpoundSmash++;
    
    if (vsp < 0)
        groundpoundSmash = -14;  
    
    if (groundpoundSmash >= 10)
    {
        if (!instance_exists(groundpoundEffectId))
            groundpoundEffectId = create_particle(x, y, obj_groundpound_effect, false);
    }
    
    if (vsp >= 2)
    {
        grav = 1;
        
        if (time_source_get_state(airCloudParticleTimer) != time_source_state_active)
            time_source_start(airCloudParticleTimer);
        
        if (vsp > 17)
        {
            if (time_source_get_state(machAfterimageTimer) != time_source_state_active)
                time_source_start(machAfterimageTimer);
            
            if (time_source_get_state(downwardsWooshPartTimer) != time_source_state_active)
                time_source_start(downwardsWooshPartTimer);
        }
    }
    else
        grav = 0.5;
    
    AnimationEndExt((sprite_index == spr_groundpound_intro), spr_groundpound);
    
    if (sprite_index == spr_bananaslip_bump)
    {
        hsp = 0;
        
        return;
    }
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION));

    hsp = movespeed * dir;
    
    if (movespeed > 7)
        movespeed -= deccel;
    else if (dir != 0)
        movespeed += accel;
    
    if (sign_input_x != dir || place_meeting_collision(x + hsp, y))
    {
        dir = sign_input_x;
        movespeed = 0;
    }        
    
    if (sprite_index != spr_divebomb && sprite_index != spr_piledriver)
        image_xscale = Side(sign_input_x, image_xscale);
}

/// @ignore
function StatePlayerGroundpoundDestroy()
{
    grav = 0.5;
    terminalVelocity = 20;
    
    instakillHitbox.canAttack = false;
    machAfterimageUseAlpha = true;
    
    time_source_stop(machAfterimageTimer);
    time_source_stop(blurAfterimageTimer);
    time_source_stop(downwardsWooshPartTimer);
    time_source_stop(airCloudParticleTimer);
    
    instance_destroy(groundpoundEffectId);
    sound_instance_stop(sndGroundpound, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
}