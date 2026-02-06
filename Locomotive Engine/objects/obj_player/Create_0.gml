/////////////////////////////
// Set built-ins
/////////////////////////////

depth = 0;
mask_index = spr_player_mask;

/////////////////////////////
// Initialize various systems
/////////////////////////////

camera = add_camera(id);

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

initialize_movement_helpers();
coyote_manager_initialize();

character = global.char_damian;
char_cache_sprite_variables(character);
char_cache_sound_variables(character);

state_machine_initialize();
state_machine_set_state(state_player_normal());

visual_helper_initialize();

/////////////////////////////
// General state variables
/////////////////////////////

jump_height = -11;
jumpstop_divisor = 20;

/////////////////////////////
// State specific variables
/////////////////////////////

// Crouch

crouch_jump_height = -8;

// Grab dash

grabdash_bump_buffer = 60;
grabdash_airborne = false;

grabdash_cloud_particle_id = noone;
grabbed_instance_id = noone;

snd_grabdash = sound_instance_create(sfx_player_grabdash);

// Taunt & Hit Stun

stored_hsp = 0;
stored_vsp = 0;
stored_movespeed = 0;

stored_sprite_index = -1;
stored_image_index = 0;

// Taunt

taunt_timer = new Timer(0.3, time_source_units_seconds, function() {
    grav = 0.5;
    
    state_machine_set_previous_state();
    
    sprite_index = stored_sprite_index;
    image_index = stored_image_index;
    
    vsp = stored_vsp;
    hsp = stored_hsp;
    movespeed = stored_movespeed;
});

// Ground Pound

snd_groundpound = sound_instance_create(sfx_player_groundpound);

// Mach

snd_mach = sound_instance_create(sfx_mach);

// Super Jump

snd_superjump = sound_instance_create(sfx_player_sjump);

// Mach Roll

snd_machroll = sound_instance_create(sfx_player_machroll);
snd_dive = sound_instance_create(sfx_player_dive);
snd_roll_getup = sound_instance_create(sfx_player_roll_getup);

// Wall Climb

wallclimb_grab_buffer = 0;
wallclimb_dash_timer = new Timer(0.35, time_source_units_seconds, function() {
    sprite_index = spr_wallclimb;
});

/////////////////////////////
// General Timers
/////////////////////////////

// Particles

cloud_particle_timer = new Timer(0.2, time_source_units_seconds, function() {
    create_particle(x, y + 43, obj_cloud_particle, false);
    
    if (state_step == state_player_normal_step)
        sound_instance_one_shot(sfx_step, x, y);
});
cloud_particle_timer.set_ext(1, true);


flame_particle_timer = new Timer(0.2, time_source_units_seconds, function() {
    create_particle(x, y + 45, obj_flame_particle, false);
});
flame_particle_timer.set_ext(1, true);


downwards_woosh_particle_timer = new Timer(0.25, time_source_units_seconds, function() {
    with (create_particle(x, y, obj_woosh_particle, false))
        image_angle = 90;
});
downwards_woosh_particle_timer.set_ext(1, true);


upwards_woosh_particle_timer = new Timer(0.25, time_source_units_seconds, function() {
    with (create_particle(x, y, obj_woosh_particle, false))
        image_angle = -90;
});
upwards_woosh_particle_timer.set_ext(1, true);

// Afterimages

blur_afterimage_timer = new Timer(2, time_source_units_frames, function() {
    with (create_afterimage(x, y, obj_blur_afterimage))
    {
        if (other.state_step == state_player_cape_step)
            image_index = floor(other.image_index);
    }
});
blur_afterimage_timer.set_ext(1, true);


mach_afterimage_use_alpha = true;
mach_afterimage_timer = new Timer(5, time_source_units_frames, function() {
    create_afterimage(x, y, obj_mach_afterimage);
});
mach_afterimage_timer.set_ext(1, true);