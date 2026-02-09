function player_setup_jump()
{
    coyote_manager_jump();
    sprite_index_set(spr_jump, 0);
    instance_create(x, y + 45, obj_jump_particle);
    
    sound_instance_one_shot(sfx_jump, x, y);
    
    vsp = jump_height;
}

function player_setup_crouch_jump()
{
    coyote_manager_jump();
    sprite_index_set(spr_crouch_jump, 0);
    instance_create(x, y + 45, obj_jump_particle);
    
    sound_instance_one_shot(sfx_jump, x, y);
    
    vsp = crouch_jump_height;
}

function player_setup_longjump()
{
    coyote_manager_jump();
    state_machine_set_state(state_player_mach());
    sprite_index_set(spr_longjump_intro, 0);
    create_particle(x, y + 45, obj_jump_particle);
    
    sound_instance_start(snd_roll_getup);
    
    movespeed = max(movespeed, 10);
    vsp = jump_height;
}   

function player_setup_mach_jump()
{
    coyote_manager_jump();
    sprite_index_set((player_get_mach_stage() >= 3) ? spr_mach3_jump : spr_mach2_jump_intro, 0);
    create_particle(x, y + 45, obj_jump_particle);
    
    sound_instance_one_shot(sfx_jump, x, y);

    vsp = jump_height;
}

function player_setup_grabdash_bump()
{
    state_machine_set_state(state_player_normal());
        
    sound_instance_one_shot(sfx_player_bump_wall, x, y);
    sound_instance_stop(snd_grabdash, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
    
    vsp = -4;
    grounded = false;
    grabdash_bump_buffer = 60;
    
    sprite_index = spr_grabdash_bump;
}

function player_setup_wallsplat()
{
    state_machine_set_state(state_player_animation());
    
    sound_instance_one_shot(sfx_player_wall_splat, x, y);
    
    sprite_index = spr_wallsplat;
            
    vsp = 0;
    grav = 0;
}

function player_setup_wallcrash()
{
    state_machine_set_state(state_player_animation());
    
    sound_instance_one_shot(sfx_player_mach3_wallcrash, x, y);
    
    sprite_index = spr_mach3_hit_wall;
        
    vsp = -6;
    movespeed = -6;
    grounded = false;
}

function player_setup_hit_ceiling()
{
    state_machine_set_state(state_player_animation());
    
    sound_instance_one_shot(sfx_player_groundpound_land, x, y);
    
    sprite_index = spr_sjump_hit_ceiling;
            
    vsp = 0;
    grav = 0;
}

