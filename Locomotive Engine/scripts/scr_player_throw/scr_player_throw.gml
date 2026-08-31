/// @ignore
function StatePlayerThrowCreate()
{
    if (sprite_index == spr_swingding_throw)
        return;

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
        camera.ShakeSet(3, 0.05, 0);
        ComboSetTime(global.comboTimerMax);
		
        with (carryingId)
        {
            thrownAngle = 0;
            if (other.image_xscale == -1)
                thrownAngle = 180;
            if (other.sprite_index == other.spr_throw_uppercut)
                thrownAngle = 270;
            
            PartSpawn(x, y, PART_TYPES.PARRYSPARK);
            PartSpawn(x, y, PART_TYPES.SLAPSTARS_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);
            PartSpawn(x, y, PART_TYPES.ENEMY_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);

            sound_instance_one_shot(sfx_playerpunch, x, y);
            sound_instance_one_shot(sfx_player_killingblow, x, y);
            
            HitstunSet();
            SmcSetState("Thrown");
            
            call_later(1, time_source_units_frames, function() {
                PartSpawn(x, y, PART_TYPES.BANG);
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