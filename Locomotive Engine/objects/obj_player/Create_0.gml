/////////////////////////////
// Condition macros
/////////////////////////////

#macro PLAYER_HIT_WALL (place_meeting(x + dir, y, obj_solid))
#macro PLAYER_HIT_CEILING (place_meeting(x, y - 1, obj_solid))
#macro PLAYER_CROUCH (grounded && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
#macro PLAYER_NOTHING_ABOVE (!place_meeting(x, y - 32, obj_solid)) 
#macro PLAYER_GET_UP (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && PLAYER_NOTHING_ABOVE && grounded)
#macro PLAYER_JUMP (can_jump && InputPressed(INPUT_VERB.JUMP) && !place_meeting(x, y - 1, obj_solid))
#macro PLAYER_GRABDASH (InputPressed(INPUT_VERB.GRABDASH) && (grabdash_bump_buffer <= 0 || sprite_index != spr_grabdash_bump))
#macro PLAYER_UPPERCUT (PLAYER_GRABDASH && sign(InputY(INPUT_CLUSTER.NAVIGATION)) == -1)
#macro PLAYER_GROUNDPOUND (InputPressed(INPUT_VERB.DOWN) && !grounded)  
#macro PLAYER_TAUNT (InputPressed(INPUT_VERB.TAUNT))
#macro PLAYER_MACHRUN (!PLAYER_HIT_WALL && InputCheck(INPUT_VERB.MACHRUN) && grounded)
#macro PLAYER_MACHINSTATURN (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed <= 8 && grounded)
#macro PLAYER_MACHTURN (sign(InputX(INPUT_CLUSTER.NAVIGATION)) == -dir && movespeed > 8 && grounded)
#macro PLAYER_MACHSTOP (!InputCheck(INPUT_VERB.MACHRUN) && movespeed <= 8 && grounded)
#macro PLAYER_MACHSLIDE (!InputCheck(INPUT_VERB.MACHRUN) && movespeed > 8 && grounded)
#macro PLAYER_WALLCLIMB (PLAYER_HIT_WALL && (!grounded || (grounded && groundedSlope)))
#macro PLAYER_DIVE (sign(InputY(INPUT_CLUSTER.NAVIGATION)) == 1)
#macro PLAYER_DIVEBOMB (InputPressed(INPUT_VERB.JUMP) && !grounded)
#macro PLAYER_CAPE (InputPressed(INPUT_VERB.UP) && InputCheck(INPUT_VERB.JUMP) && !grounded && player_get_mach_stage() >= 3) 
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

camera = add_camera(id);

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

hitstun_initialize();
coyote_initialize();
movement_helpers_initialize();
visual_helper_initialize();

/////////////////////////////
// Combat Set-up
/////////////////////////////

combat_initialize();
invincible = true;
has_collision = true;

resistance = 1;
strength = 1;
hp = 6;

group = COMBAT_GROUPS.PLAYER;

// Functions

damage_function = function(other_id)
{
    hitstun_sprite = (state_id == state_player_mach) ? spr_mach3_hit_enemy : -1;
    sound_instance_one_shot(sfx_player_punch, x, y);
    
    hitstun_apply();
}

stun_function = function(other_id)
{
    if (state_id == state_player_hurt)
        return;

    smc_set_state(state_player_hurt);
    
    sprite_index = (image_xscale == -other_id.image_xscale) ? spr_hurt : spr_back_hurt;
    
    dir = side(sign(x - other_id.x), image_xscale);
}

hurt_function = stun_function;

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

// Taunt

stored_hsp = 0;
stored_vsp = 0;
stored_movespeed = 0;

stored_sprite_index = -1;
stored_image_index = 0;

taunt_timer = new Timer(0.3, time_source_units_seconds, function() {
    grav = 0.5;
    
    smc_restore_state();
    
    sprite_index = stored_sprite_index;
    image_index = stored_image_index;
    
    vsp = stored_vsp;
    hsp = stored_hsp;
    movespeed = stored_movespeed;
});

// Ground Pound

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
// General Timers
/////////////////////////////

// Particles

cloud_particle_timer = new Timer(0.2, time_source_units_seconds, function() {
    create_particle(x, y + 43, obj_cloud_particle, false);
    
    if (state_id == state_player_normal)
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
        if (other.state_id == state_player_cape)
            image_index = floor(other.image_index);
    }
});
blur_afterimage_timer.set_ext(1, true);


mach_afterimage_use_alpha = true;
mach_afterimage_timer = new Timer(5, time_source_units_frames, function() {
    create_afterimage(x, y, obj_mach_afterimage);
});
mach_afterimage_timer.set_ext(1, true);