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
FlashEffectInit();
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

SmcInit();
statePrefix = "StatePlayer";
SmcSetState("Normal");

hurtSysInit();
hitbox = createHitbox();

with (hitbox)
{
    new Target("stunEnemy", par_enemy, StunEnemy);
    new Target("attackEnemy", par_enemy, AttackEnemy);
    
    var grab_func = function(enemy_id, player_id)
    {
        with (enemy_id)
            SmcSetState("Grabbed");
        
        with (player_id)
        {
            carryingId = enemy_id;
            movespeed = 0;
            
            sprite_set((grounded) ? spr_hauling_intro : spr_hauling_jump, 0);
            SmcSetState("Normal");
        }
    }
    
    new Target("grabEnemy", par_enemy, grab_func);
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
    SmcSetState(stateHistory[$ "tauntStoredState"]);
    SmcDeleteFromHistory("tauntStoredState");
});

parryHitbox = createHitbox();

with (parryHitbox)
{
    mask_index = spr_parryhitbox;
    
    var parry_func = function(hitbox_id, player_id)
    {
        var enemy_id = hitbox_id.owner;
        
        if (enemy_id == player_id || !enemy_id.parryable)
            return;
        
        with (player_id)
        {
            parryTarget = enemy_id;
            
            SmcSetState("Parry");
            create_particle(x, y, obj_parry_particle);
            sound_instance_one_shot(sfx_player_parry, x, y);
        }
    }
    
    new Target("parryEnemy", obj_hitbox, parry_func);
}

parryHitboxBuffer = 8;

// Parry

parryTarget = noone;
parryCount = 0;

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
    SmcSetState("Normal");
});
warppipe_id = noone;

// Hurt

hurtFlickerTimer = new Timer(2, time_source_units_frames, function() {
    visible = !visible;
    
    if (invincibleBuffer <= 0 && visible)
    {
        hurtFlickerTimer.SetRepeating(false, false);
        hurtFlickerTimer.Stop();
    }
});
hurtFlickerTimer.SetRepeating(false, true);

/////////////////////////////
// Particle timers
/////////////////////////////

note_particle_timer = new Timer(0.1, time_source_units_seconds, function() {
    create_particle(x + irandom_range(-70, 70), y + irandom_range(-70, 70), obj_note_particle, false);
})
cloud_particle_timer = new Timer(12, time_source_units_frames, function() {
    create_particle(x, y + 43, obj_cloud_particle, false);
    
    if ((stateName != "Normal" && stateName != "Painting" && stateName != "Ladder") || carryingId == noone)
        return;
    
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
        if (other.stateName == "Cape")
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

carryingId = noone;
hudBookId = noone;
hudTvId = noone;
instakillmove = false;