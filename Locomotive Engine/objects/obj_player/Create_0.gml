event_inherited();

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

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

hitstunInit();
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

hurtSysInit();
hitbox = createHitbox();

with (hitbox)
{
    new Target("stunEnemy", par_enemy, StunEnemy);
    new Target("attackEnemy", par_enemy, AttackEnemy);
}

/////////////////////////////
// General variables
/////////////////////////////

has_key = false;
has_catripi = false;

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
cloud_particle_timer.SetRepeating(false, true);

air_cloud_particle_timer = new Timer(8, time_source_units_frames, function() {
    create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_cloud_particle, false);
});
air_cloud_particle_timer.SetRepeating(false, true);


flame_particle_timer = new Timer(0.2, time_source_units_seconds, function() {
    create_particle(x, y + 45, obj_flame_particle, false);
});
flame_particle_timer.SetRepeating(false, true);


downwards_woosh_particle_timer = new Timer(0.25, time_source_units_seconds, function() {
    with (create_particle(x, y, obj_woosh_particle, false))
        image_angle = 90;
});
downwards_woosh_particle_timer.SetRepeating(false, true);


upwards_woosh_particle_timer = new Timer(0.25, time_source_units_seconds, function() {
    with (create_particle(x, y, obj_woosh_particle, false))
        image_angle = -90;
});
upwards_woosh_particle_timer.SetRepeating(false, true);

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
blur_afterimage_timer.SetRepeating(false, true);


mach_afterimage_use_alpha = true;
mach_afterimage_timer = new Timer(6, time_source_units_frames, function() {
    with (create_afterimage_vh(x, y, obj_mach_afterimage))
        use_alpha = other.mach_afterimage_use_alpha;
});
mach_afterimage_timer.SetRepeating(false, true);

/////////////////////////////
// Other variables
/////////////////////////////

hudBookId = noone;
hudTvId = noone;
instakillmove = false;