event_inherited();

/////////////////////////////
// Condition macros
/////////////////////////////

#macro PLAYER_HIT_WALL (place_meeting_collision(x + dir, y, Exclude.SLOPES))
#macro PLAYER_HIT_CEILING (check_collide(collider, 0, -1))
#macro PLAYER_CROUCH (grounded && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
#macro PLAYER_NOTHING_ABOVE (!check_collide(collider, 0, -32)) 
#macro PLAYER_GET_UP (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && PLAYER_NOTHING_ABOVE && grounded)
#macro PLAYER_JUMP (can_jump && InputPressed(INPUT_VERB.JUMP) && !check_collide(collider, 0, -1))
#macro PLAYER_GRABDASH (InputPressed(INPUT_VERB.GRABDASH) && (grabdash_bump_buffer <= 0 || sprite_index != spr_grabdash_bump))
#macro PLAYER_UPPERCUT (PLAYER_GRABDASH && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1)
#macro PLAYER_GROUNDPOUND (InputPressed(INPUT_VERB.DOWN) && !grounded)  
#macro PLAYER_TAUNT (InputPressed(INPUT_VERB.TAUNT))
#macro PLAYER_MACHRUN (!PLAYER_HIT_WALL && InputCheck(INPUT_VERB.MACHRUN) && grounded)
#macro PLAYER_MACHINSTATURN (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed <= 8 && grounded)
#macro PLAYER_MACHTURN (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed > 8 && grounded)
#macro PLAYER_MACHSTOP (!InputCheck(INPUT_VERB.MACHRUN) && movespeed <= 8 && grounded)
#macro PLAYER_MACHSLIDE (!InputCheck(INPUT_VERB.MACHRUN) && movespeed > 8 && grounded)
#macro PLAYER_WALLCLIMB (PLAYER_HIT_WALL && (!grounded || (grounded && grounded_slope)))
#macro PLAYER_DIVE (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
#macro PLAYER_DIVEBOMB (InputPressed(INPUT_VERB.JUMP) && !grounded)
#macro PLAYER_CAPE (InputPressed(INPUT_VERB.UP) && !grounded && player_get_mach_stage() >= 3) 
#macro PLAYER_SJUMP_PREPARE (InputCheck(INPUT_VERB.UP) && grounded && player_get_mach_stage() >= 3)   
#macro PLAYER_SJUMP_RELEASE (!InputCheck(INPUT_VERB.UP) && grounded) 

/////////////////////////////
// Set built-ins
/////////////////////////////

depth = DEPTHS.MIDDLE;
mask_index = spr_player_mask;

/////////////////////////////
// Initialize various systems
/////////////////////////////

camera = new Camera();
cam_painting_up = new Tween(ac_ease, "out", 0.6, time_source_units_seconds);
cam_painting_up_ind = camera.add_y_offset(0);

physics_init();
//scr_collision_init();
//grav = 0.5;
//terminalVelocity = 20;

hitstun_initialize();
coyote_initialize();
movement_helpers_initialize();
visual_helper_initialize();

/////////////////////////////
// Character Set-up
/////////////////////////////

character = CHARS.DAMIAN;
cache_charsprites(character);

sfx_step = get_charsnd(sfx_damian_step, character);
sfx_jump = get_charsnd(sfx_damian_jump, character);
sfx_mach = get_charsnd(sfx_damian_mach, character);
sfx_mach_turn = get_charsnd(sfx_damian_mach_turn, character);
sfx_mach_brake = get_charsnd(sfx_damian_mach_brake, character);
sfx_voice_idle = get_charsnd(sfx_damian_voice_idle, character);
sfx_voice_happy = get_charsnd(sfx_damian_voice_happy, character);
sfx_voice_hurt = get_charsnd(sfx_damian_voice_hurt, character);
sfx_voice_plushie = get_charsnd(sfx_damian_voice_plushie, character);
sfx_voice_catripi = get_charsnd(sfx_damian_voice_catripi, character);

state_machine_initialize();
smc_set_state(state_player_normal);

/////////////////////////////
// General variables
/////////////////////////////

has_key = false;
has_catripi = false;

collider = new Collider(bbox_left, bbox_top, bbox_bottom, bbox_right);
collider.persists = true;

/////////////////////////////
// State specific variables
/////////////////////////////

// Normal

idle_spr_time = 150;
panting_spr_time = 0;

dance_hold_time = 0;
dance_spr_speed = 0.25;

// Painting

painting_id = noone;

// Ladder

ladder_id = noone;

// Grab dash

grabdash_bump_buffer = 60;
grabdash_airborne = false;

grabdash_cloud_particle_id = noone;
grabbed_instance_id = noone;

snd_grabdash = sound_instance_create(sfx_player_grabdash);

// Taunt

stored_hsp = 0;
stored_vsp = 0;
stored_movespeed = 0;

stored_sprite_index = -1;
stored_image_index = 0;

taunt_timer = new Timer(0.3, time_source_units_seconds, function() {
    grav = 0.5;
    
    sprite_index = stored_sprite_index;
    image_index = stored_image_index;
    
    vsp = stored_vsp;
    hsp = stored_hsp;
    movespeed = stored_movespeed;
    
    smc_restore_state();
});

// Ground Pound

groundpound_smash = -14;
groundpound_effect_id = noone;
snd_groundpound = sound_instance_create(sfx_player_groundpound);

// Mach

charge_effect_id = noone;
speedlines_effect_id = noone;

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

// Warp Pipe

warppipe_failsave_timer = new Timer(3, time_source_units_seconds, function() {
    smc_set_state(state_player_normal);
});
warppipe_id = noone;

/////////////////////////////
// Particle timers
/////////////////////////////

note_particle_timer = new Timer(0.1, time_source_units_seconds, function() {
    create_particle(x + irandom_range(-70, 70), y + irandom_range(-70, 70), obj_note_particle, false);
})
cloud_particle_timer = new Timer(12, time_source_units_frames, function() {
    create_particle(x, y + 43, obj_cloud_particle, false);
    
    if (state_id == state_player_normal || state_id == state_player_painting || state_id == state_player_ladder)
        sound_instance_one_shot(sfx_step, x, y);
});
cloud_particle_timer.set_ext(1, true);

air_cloud_particle_timer = new Timer(8, time_source_units_frames, function() {
    create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_cloud_particle, false);
});
air_cloud_particle_timer.set_ext(1, true);


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

/////////////////////////////
// Afterimage timers
/////////////////////////////

blur_afterimage_timer = new Timer(2, time_source_units_frames, function() {
    with (create_afterimage_vh(x, y, obj_blur_afterimage))
    {
        if (other.state_id == state_player_cape)
            image_index = floor(other.image_index);
    }
});
blur_afterimage_timer.set_ext(1, true);


mach_afterimage_use_alpha = true;
mach_afterimage_timer = new Timer(6, time_source_units_frames, function() {
    with (create_afterimage_vh(x, y, obj_mach_afterimage))
        use_alpha = other.mach_afterimage_use_alpha;
});
mach_afterimage_timer.set_ext(1, true);

/////////////////////////////
// Other variables
/////////////////////////////

hudBookId = noone;
hudTvId = noone;