/// @ignore
function StatePlayerNormalCreate()
{
    dir = sign(hsp);
    movespeed = abs(hsp);
    
    accel = 0.5;
    deccel = 0.1;
    momentum = false;
    
    if (EqualsToAny(sprite_index, spr_jump, spr_fall, spr_grabdash_bump, spr_hauling_intro, spr_land, spr_land_walk, 
        spr_showtime_idle, spr_highcombo_idle, spr_combo_idle, spr_idle, spr_idle_animation1, spr_idle_animation2,
        spr_highcombo_walk, spr_walk))
        return;
    
    if (!grounded)
    {
        sprite_index = spr_fall;
        return;
    }
    
    sprite_index = (InputX(INPUT_CLUSTER.NAVIGATION) == 0) ? spr_idle : spr_walk;
}

/// @ignore
function StatePlayerNormalStep()
{
    /////////////////////////////
    // General Logic
    /////////////////////////////
    
    static note_part_timer = 6;
    static dance_hold_require = 10; // How many frames of holding taunt should it take to spawn the beatbox?
    static idle_anims = [spr_idle_animation1, spr_idle_animation2]; // Which idle animations may the player randomly play?
    static idle_anims_count = 2; // How many random idle animations are available?
    
    with (carryingId)
    {
        var x_offset = 12 * other.image_xscale;
        var y_offset = 62;
        
        if (other.sprite_index == other.spr_hauling_intro)
        {
            switch (floor(other.image_index))
            {
                case 0: y_offset = 0; break;
                case 1: y_offset = 2; break;    
                case 2: y_offset = 43; break;
            }
        }

        x = floor(other.x + x_offset);
        y = floor(other.y - y_offset);
        image_xscale = -other.image_xscale;
    }
    
    if (carryingId == noone && PlayerDoUppercut())
        return;
    if (carryingId == noone && PlayerDoGrabdash())
    {
        if (!grounded)
            movespeed = 5;
        return;
    }
    else if (carryingId != noone && PlayerGrabdash())
    {
        SmcSetState("Throw");
        if (PlayerUppercut())
            SpriteSet(spr_throw_uppercut, 0);
        
        return;
    }
    
    if (carryingId == noone && PlayerDoTaunt())
        return;
    
    if (carryingId == noone && PlayerDoLadder())
        return;
    
    var max_speed = (carryingId == noone) ? 8 : 6;
    max_speed += CalcSlopeAccel(0, 1, 0, 1);
    
    var input_x = InputX(INPUT_CLUSTER.NAVIGATION);
    var sign_input_x = sign(input_x);
    var approach_spd = (movespeed > max_speed) ? deccel : accel;

    movespeed = Approach(movespeed, max_speed * abs(input_x), approach_spd);
    if (sign_input_x != dir)
    {
        dir = sign_input_x;
        
        if (dir != 0 || FIX_INSTATURN)
            movespeed = 0;
    }
    
    hsp = movespeed * dir;
    if (place_meeting_collision(x + dir, y, Exclude.SLOPES))
        movespeed = 0;
    
    image_xscale = Side(dir, image_xscale);
    image_speed = 1;
    
    
    /////////////////////////////
    // Airborne Logic
    /////////////////////////////

    
    if (!grounded)
    {
        if (sign(vsp) == -1)
        {
            if (BlocksDestroy(x, y + vsp, false, true, [obj_metalblock]))
                vsp = max(0, vsp);
        }
        
        var enemy = HitboxPlace(hitbox, par_enemy, "hurtbox");
        
        if (sprite_index != spr_stomp && sign(vsp) == 1 && StompEnemy(enemy, self))
        {
            PartSpawn(x, y, PART_TYPES.STOMPSTARS);
            SpriteSet(spr_stomp, 0);
            
            vsp = (InputCheck(INPUT_VERB.JUMP)) ? -14 : -9;
        }
        
        danceHoldTime = 0;
        
        time_source_stop(blurAfterimageTimer);
        time_source_stop(cloudParticleTimer);
        
        if (sprite_index != spr_stomp && sprite_index != spr_stomp_fall) 
            PlayerDoJumpstop();
        
        if (PlayerDoGroundpound())
            return;
        
        if (carryingId != noone)
        {
            if (sprite_index == spr_jump)
                sprite_index = spr_hauling_jump;
            else if (sprite_index != spr_hauling_jump || AnimationEnd())
                sprite_index = spr_hauling_fall;
                
            return; 
        }
        
        if (sprite_index == spr_piledriver_jump && !AnimationEnd())
            return;
        
        if (EqualsToAny(sprite_index, spr_stomp, spr_stomp_fall))
        {
            AnimationEnd(spr_stomp_fall);
            return;
        }
        
        var no_fall_spr = (sprite_index == spr_grabdash_bump)
        var fall_spr_on_end = EqualsToAny(sprite_index, spr_jump, spr_grabdash_cancel);
        
        if ((!fall_spr_on_end || (fall_spr_on_end && AnimationEnd())) && !no_fall_spr)
            sprite_index = spr_fall;
        return;
    }
    
    
    /////////////////////////////
    // General Ground Logic
    /////////////////////////////
    
    if (carryingId == noone && PlayerMachrun())
    {
        SmcSetState("Mach");
        return;
    }
    
    if (PlayerDoJump())
        return;
    
    if (PlayerCrouch())
    {
        PlayerDropCarrying();
        SmcSetState("Crouch");
        
        carryingId = noone;
        return;
    }
    
    if (carryingId == noone && InputCheck(INPUT_VERB.TAUNT))
        danceHoldTime++;
    else
        danceHoldTime = 0;
    
    if (danceHoldTime >= dance_hold_require)
    {
        time_source_stop(cloudParticleTimer);
        
        sprite_index = spr_breakdance;
        image_speed = danceSprSpeed;
        danceSprSpeed = Approach(danceSprSpeed, 1.25, 0.005);
    }
    else
    {
        if (sprite_index == spr_breakdance)
            sprite_index = spr_idle;
        
        danceSprSpeed = 0.9;
    }

    if (danceSprSpeed >= 1.15)
    {
        if (time_source_get_state(blurAfterimageTimer) != time_source_state_active)
            time_source_start(blurAfterimageTimer); 
        
        if (--note_part_timer <= 0)
        {
            PartSpawn(x, y, PART_TYPES.NOTES, 70, 70);
            note_part_timer = 6;
        }
        
        if (!instance_exists(obj_beatbox) || (instance_exists(obj_beatbox) && obj_beatbox.player != id))
        {
            PartSpawn(x, y, PART_TYPES.PUFF);

            with (InstanceCreate(x, y, obj_beatbox))
            {
                vsp = -11;
                player = other.id;
            }
        }
    }
    else
        time_source_stop(blurAfterimageTimer);
    
    var dance_spr = (sprite_index == spr_breakdance);
    var land_spr = EqualsToAny(sprite_index, spr_land, spr_land_walk);

    if (EqualsToAny(sprite_index, spr_jump, spr_fall, spr_grabdash_cancel, spr_grabdash_bump, spr_stomp, spr_stomp_fall) && !land_spr)
    {
        land_spr = true;
        
        image_index = 0;
        sprite_index = (sign_input_x == 0) ? spr_land : spr_land_walk;
        
        PartSpawn(x, bbox_bottom, PART_TYPES.LANDCLOUD);
        sound_instance_one_shot(sfxStep, x, y);
    }
    else if (EqualsToAny(sprite_index, spr_hauling_jump, spr_hauling_fall))
    {
        land_spr = true;
        
        SpriteSet(spr_hauling_land, 0);
        PartSpawn(x, bbox_bottom, PART_TYPES.LANDCLOUD);
    }
    
    var machslide_spr = (sprite_index == spr_machslide_end);
    
    
    ////////////////////////////
    // Walking Logic
    /////////////////////////////
    
    
    if (sign_input_x != 0)
    {
        if (time_source_get_state(cloudParticleTimer) != time_source_state_active)
            time_source_start(cloudParticleTimer); 
        
        var image_speed_curve = [1, 1.25, 1.5];
        var image_speed_curve_index = floor(abs(hsp) / 3);
        
        if (carryingId != noone)
            image_speed_curve = [1, 1.1, 1.25];
        
        image_speed_curve_index = clamp(image_speed_curve_index, 0, array_length(image_speed_curve) - 1);
        image_speed = image_speed_curve[image_speed_curve_index];
        
        if (carryingId != noone)
        {
            if (sprite_index == spr_hauling_intro && !AnimationEnd())
                return;
            
            sprite_index = spr_hauling_walk;
            return;
        }
        
        if (dance_spr)
            return;
        
        if (machslide_spr || land_spr)
        {
            AnimationEnd(spr_walk);
            return;
        }
        
        idleSprTime = 150;
        sprite_index = spr_walk;
        
        return;
    }
    
    
    /////////////////////////////
    // Idle Logic
    /////////////////////////////

    
    if (dance_spr)
        return;
    
    time_source_stop(cloudParticleTimer); 
    
    if (carryingId != noone)
    {
        if (land_spr || sprite_index == spr_hauling_intro)
            AnimationEnd(spr_hauling_idle);
        else
            sprite_index = spr_hauling_idle;
        return;
    }
    
    var groundpound_spr = EqualsToAny(sprite_index, spr_groundpound_idle_intro, spr_groundpound_idle);
    var panting_spr = (sprite_index == spr_panting_idle);
    
    if (machslide_spr || land_spr) 
    {
        AnimationEnd(spr_idle);
        return;
    }    
    
    if (--idleSprTime < 0)
    {
        if (sprite_index != spr_idle && AnimationEnd())
            idleSprTime = 150;
        
        var i = 0;
        
        repeat (idle_anims_count)
        {
            if (idle_anims[i] == sprite_index)
                return;
            
            i++;
        }
        
        if (irandom(100) <= 25)
            sound_instance_one_shot(sfxVoiceIdle, x, y);
        
        var target_anim = irandom(idle_anims_count - 1);
        SpriteSet(idle_anims[target_anim], 0);
        
        return;
    }
    
    pantingSprTime--;
    
    if (place_meeting(x, y, obj_point_of_interest))
    {
        if (sprite_index != spr_lookdoor)
        {
            SpriteSet(spr_lookdoor, 0);
            image_speed = 1;
        }
        
        if (AnimationEnd())
            image_speed = 0;
        
        return;
    }
    
    if (groundpound_spr)
    {
        pantingSprTime = 0;
        
        AnimationEnd(spr_groundpound_idle);
        return;
    }
    
    if (pantingSprTime >= 1800)
    {
        idleSprTime = 150;
        sprite_index = spr_panting_idle;
        
        return;
    }
    
    sprite_index = spr_idle;

}

/// @ignore
function StatePlayerNormalDestroy()
{
    image_speed = 1;
    
    time_source_stop(cloudParticleTimer);
    time_source_stop(machAfterimageTimer);
    time_source_stop(blurAfterimageTimer);
    
    danceHoldTime = 0;
    pantingSprTime = 0;
    idleSprTime = 150;
    noteParticleTimer = 6;
}