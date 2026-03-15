if (instance_exists(player))
    exit;

with (other)
{
    sprite_index = spr_hurt;
    smc_set_state(smc_empty_state);
    camera.axis_set_locked(true, true);
    
    other.player = id;
}

sound_instance_one_shot(sfx_secretegg_enter, x, y);
queue_room(target_room, obj_secretegg_spawn);
sprite_set(spr_secretegg_close, 0);
add_saveroom();