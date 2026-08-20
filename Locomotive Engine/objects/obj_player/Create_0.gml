event_inherited();

/////////////////////////////
// Set built-ins
/////////////////////////////

mask_index = spr_player_mask;

/////////////////////////////
// Initialize various systems
/////////////////////////////

global.leadingPlayer = -1;

camera = new Camera();
camPaintingUp = new Tween(ac_ease, "out", 0.6, time_source_units_seconds);
camPaintingUpInd = camera.add_y_offset(0);

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

HitstunInit();
FlashEffectInit();
CoyoteTimeInit();
MovementHelpersInit();
VisualHelperInit();

/////////////////////////////
// Character Set-up
/////////////////////////////

character = CHARS.DAMIAN;
CharCacheSprs(character);

sfxStep = "";
sfxJump = "";
sfxMach = "";
sfxMachTurn = "";
sfxMachBrake = "";
sfxVoiceIdle = "";
sfxVoiceHappy = "";
sfxVoiceHurt = "";
sfxVoicePlushie = "";
sfxVoiceCatripi = "";

SmcInit("Player");
SmcSetState("Normal");

hitbox = HitboxCreate();
throwHitbox = HitboxCreate();
instakillHitbox = HitboxCreate();
instakillHitbox.canAttack = false;

/////////////////////////////
// General variables
/////////////////////////////

sndsInitialized = false;
hasKey = false;
hasCatripi = false;
playerTimeSources = time_source_create(time_source_game, 1, time_source_units_frames, function() {});

/////////////////////////////
// State specific variables
/////////////////////////////

// Normal

idleSprTime = 150;
pantingSprTime = 0;

danceHoldTime = 0;
danceSprSpeed = 0.25;

// Painting

paintingId = noone;

// Ladder

ladderId = noone;

// Grab dash

grabdashAirborne = false;

grabdashCloudParticleId = noone;
grabbedInstanceId = noone;

sndGrabdash = -1;

// Taunt

storedHsp = 0;
storedVsp = 0;
storedMovespeed = 0;

storedSpriteIndex = -1;
storedImageIndex = 0;

tauntStoredState = "";
tauntTimer = 18;
parryHitboxTime = 8;
parryHitboxBuffer = 8;

// Parry

parryTarget = noone;
parryCount = 0;

// Ground Pound

groundpoundSmash = -14;
groundpoundEffectId = noone;
sndGroundpound = -1;

// Mach

chargeEffectId = noone;
speedlinesEffectId = noone;

sndMach = -1;

// Super Jump

sndSuperjump = -1;

// Mach Roll

sndMachroll = -1;
sndDive = -1;
sndRollGetup = -1;

// Wall Climb

wallclimbGrabTime = 0;
wallclimbDashTimer = 0;

warppipeId = noone;

// Hurt

hurtFlickerTimer = time_source_create(playerTimeSources, 2, time_source_units_frames, function() {
    visible = !visible;
    
    if (invincibilityTime <= 0 && visible)
        time_source_stop(hurtFlickerTimer);
}, [], -1);

// Swingding

sndSpin = -1;

/////////////////////////////
// Particle timers
/////////////////////////////

noteParticleTimer = 6;
flameParticleTimer = 12;
 
cloudParticleTimer = time_source_create(playerTimeSources, 12, time_source_units_frames, function() {
    create_particle(x, y + 43, obj_cloud_particle, false);
    
    if ((stateName != "Normal" && stateName != "Painting" && stateName != "Ladder") || carryingId != noone)
        return;
    
    sound_instance_one_shot(sfxStep, x, y);
}, [], -1);

airCloudParticleTimer = time_source_create(playerTimeSources, 8, time_source_units_frames, function() {
    create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_cloud_particle, false);
}, [], -1);

downwardsWooshPartTimer = time_source_create(playerTimeSources, 0.25, time_source_units_seconds, function() {
    with (create_particle(x, y, obj_woosh_particle, false))
        image_angle = 90;
}, [], -1);

upwardsWooshPartTimer = time_source_create(playerTimeSources, 0.25, time_source_units_seconds, function() {
    with (create_particle(x, y, obj_woosh_particle, false))
        image_angle = -90;
}, [], -1);

/////////////////////////////
// Afterimage timers
/////////////////////////////

blurAfterimageTimer = time_source_create(playerTimeSources, 2, time_source_units_frames, function() {
    with (create_afterimage_vh(x, y, obj_blur_afterimage))
    {
        if (other.stateName == "Cape")
            image_index = floor(other.image_index);
    }
}, [], -1);

machAfterimageUseAlpha = true;

machAfterimageTimer = time_source_create(playerTimeSources, 6, time_source_units_frames, function() {
    with (create_afterimage_vh(x, y, obj_mach_afterimage))
        use_alpha = other.machAfterimageUseAlpha;
}, [], -1);

/////////////////////////////
// Other variables
/////////////////////////////

carryingId = noone;
hudBookId = noone;
hudTvId = noone;
instakillHitbox.canAttack = false;
invincibilityTime = 0;