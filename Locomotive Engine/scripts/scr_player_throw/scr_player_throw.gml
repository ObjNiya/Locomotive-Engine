/// @ignore
function StatePlayerThrowCreate()
{
    if (sprite_index == spr_swingding_throw)
        return;
    image_speed = 1.05;
    if (sprite_index == spr_throw_uppercut)
        return;
    
    image_index = 0;
    sprite_index = choose(spr_throw1, spr_throw2, spr_throw3, spr_throw4);
    
    machAfterimageUseAlpha = false;
    time_source_start(machAfterimageTimer);
}

/// @ignore
function StatePlayerThrowStep()
{
    hsp = movespeed;
    
    if (floor(image_index) < 4 && sprite_index != spr_swingding_throw)
        movespeed = Approach(movespeed, 0, 1);
    else
        movespeed = Approach(movespeed, -image_xscale * 4, 0.5);
    
    if (AnimationEnd())
    {
        movespeed = 0;
        
        SmcSetState("Normal");
        return;
    }
    
    if (carryingId == noone)
        return;
    
    var floor_img_index = floor(image_index);

    if ((sprite_index == spr_swingding_throw && floor_img_index >= 1) || floor_img_index >= 4)
    {
        movespeed = 0;
        vsp = -6;
        camera.shake_set(3, 0.05);
        ComboSetTime(99);

        with (carryingId)
        {
            thrownAngle = 0;
            if (other.image_xscale == -1)
                thrownAngle = 180;
            if (other.sprite_index == other.spr_throw_uppercut)
                thrownAngle = 270;
            
            InstanceCreate(x, y, obj_parry_particle);
            repeat (3)
                InstanceCreate(x, y, obj_slap_star_debris);
            repeat (3)
                InstanceCreate(x, y, obj_enemy_debris);
            
            sound_instance_one_shot(sfx_playerpunch, x, y);
            sound_instance_one_shot(sfx_player_killingblow, x, y);
            
            HitstunSet();
            SmcSetState("Thrown");
            
            call_later(1, time_source_units_frames, function() {
                InstanceCreate(x, y, obj_bang_particle);
            });
        }
        
        carryingId = noone;
        return;
    }
    
    
    carryingId.x = x + (60 * image_xscale);
    carryingId.y = y;
    
    with (carryingId)
    {
        while (place_meeting_collision(x, y))
            x -= other.image_xscale;
    }
    
   // DASHCLOUD 2
}

/// @ignore
function StatePlayerThrowDestroy()
{
    machAfterimageUseAlpha = false;
    time_source_stop(machAfterimageTimer);
    image_speed = 1;
}