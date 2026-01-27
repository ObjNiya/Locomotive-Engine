// Built-ins
depth = 0;
mask_index = spr_player_mask;

// Collision system

scr_collision_init();
grav = 0.5;
movespeed = 0;
terminalVelocity = 20;

// Coyote manager

coyote_manager_initialize();

// Character system

character = global.char_damian;
char_cache_sprite_variables(character);

// State machine

state_machine_initialize();
state_machine_set_state(state_player_normal());

// Wallclimb variables

wallclimb_grab_buffer = 0;
wallclimb_dash_timer = new Timer(0.35, 1, time_source_units_seconds, function() {
    sprite_index = spr_wallclimb;
})

// Grabdash variables

grabdash_bump_buffer = 60;
grabdash_airborne = false;

// Taunt & Hit stun variables

stored_hsp = 0;
stored_vsp = 0;
stored_movespeed = 0;

stored_sprite_index = -1;
stored_image_index = 0;

// Taunt variables

taunt_timer = new Timer(0.3, 1, time_source_units_seconds, function() {
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