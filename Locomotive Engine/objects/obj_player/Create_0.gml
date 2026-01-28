// Built-ins
depth = 0;
mask_index = spr_player_mask;

/////////////////////////////
// Initialize various systems
/////////////////////////////

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

initialize_movement_helpers();
coyote_manager_initialize();

character = global.char_damian;
char_cache_sprite_variables(character);

state_machine_initialize();
state_machine_set_state(state_player_normal());

/////////////////////////////

grabbed_instance_id = noone;

// Walk variables

step_particle_timer = new Timer(0.2, 1, time_source_units_seconds, true, function() {
    instance_create(x, y + 43, obj_cloud_particle); 
})

// Wallclimb variables

wallclimb_grab_buffer = 0;
wallclimb_dash_timer = new Timer(0.35, 1, time_source_units_seconds, false, function() {
    sprite_index = spr_wallclimb;
})

// Mach variables

mach_cloud_particle_id = noone;
mach4_woosh_particle_id = noone;
mach4_flame_particle_timer = new Timer(10, 1, time_source_units_frames, true, function() {
    instance_create(x, y + 45, obj_mach4_flame_cloud_particle);
})

// Grabdash variables

grabdash_bump_buffer = 60;
grabdash_airborne = false;
grabdash_cloud_particle_id = noone;

// Ground pound variables
groundpound_woosh_particle_timer = new Timer(15, 1, time_source_units_frames, true, function() {
    with (instance_create(x, y, obj_mach4_woosh_particle))
        image_angle = 90;
})

// Taunt & Hit stun variables

stored_hsp = 0;
stored_vsp = 0;
stored_movespeed = 0;

stored_sprite_index = -1;
stored_image_index = 0;


// Taunt variables

taunt_timer = new Timer(0.3, 1, time_source_units_seconds, false, function() {
    grav = 0.5;
    
    state_machine_set_previous_state();
    
    sprite_index = stored_sprite_index;
    image_index = stored_image_index;
    
    vsp = stored_vsp;
    hsp = stored_hsp;
    movespeed = stored_movespeed;
});

// General state variables

jump_height = -11;
sign_image_xscale = 1;

// General afterimage variables
blur_afterimage_timer = new Timer(2, 1, time_source_units_frames, true, function() {
    with (instance_create(x, y, obj_blur_afterimage))
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index - 1;
        
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
        image_blend = other.image_blend;
    }
})

mach_afterimage_use_alpha = true;
mach_afterimage_timer = new Timer(5, 1, time_source_units_frames, true, function() {
    with (instance_create(x, y, obj_mach_afterimage))
    {
        use_alpha = other.mach_afterimage_use_alpha;
        spawner_id = other.id;
        
        sprite_index = other.sprite_index;
        image_index = other.image_index - 1;
        
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
    }
})
