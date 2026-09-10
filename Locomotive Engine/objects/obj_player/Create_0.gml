enum PLAYER_UEVS
{
    TECHDIFFICULTIES = 0,
}

/////////////////////////////
// Set built-ins
/////////////////////////////

mask_index = spr_player_mask;

/////////////////////////////
// Initialize various systems
/////////////////////////////

global.leadingPlayer = -1;

camera = CameraCreate();

with (camera)
{
    yAxis.OffsetterAdd("baseUp", -50, false, 0, 0);
    
    var PaintingPan = function()
    {
        with (followTarget)
        {
            if (place_meeting(x, y, obj_levelpainting) && stateName == "Normal")
                return -120;
        }
        
        return 0;
    }
    
    yAxis.OffsetterAdd("paintingPan", PaintingPan, true, ac_cam_painting_up_spd, asset_animationcurve);
    
    
    var ExtendCam = function()
    {
        with (followTarget)
        {
            if (PlayerGetMachStage() < 3)
                return 0;
            
            if (PlayerGetMachStage() < 4 && stateName != "Mach" && abs(hsp) < 16)
                return 0;
            
            return (abs(hsp) / 4) * 50 * image_xscale;
        }
    }
    
    var ExtendCamSpd = function()
    {
        with (followTarget)
        {
            if (stateName == "Mach" && PlayerGetMachStage() >= 3)
                return 0.3;
            else if (PlayerGetMachStage() >= 4)
            {
                var extend_sign = sign(camera.xAxis.offsetters[$ "extendCam"].pos);
                return (extend_sign != sign(hsp)) ? 8 : 2;
            }
            else if (stateName == "Machslide" || stateName == "Machturn")
                return 10;
            else
                return 6;
        }
    }
    
    xAxis.OffsetterAdd("extendCam", ExtendCam, true, ExtendCamSpd, asset_script);
}

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
playerTimeSources = time_source_create(time_source_global, 1, time_source_units_frames, function() {});

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

tauntsparkId = noone;

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
// Particle Timers
/////////////////////////////

grabdashcloudPartTimer = 0;
dashcloudPartTimer = 0;
mach3cloudPartTimer = 0;
horizRingPartTimer = 0;

cloudParticleTimer = time_source_create(playerTimeSources, 12, time_source_units_frames, function() {
    PartSpawn(x, bbox_bottom, PART_TYPES.STEP_CLOUD);
    
    if ((stateName != "Normal" && stateName != "Painting" && stateName != "Ladder") || carryingId != noone)
        return;
    
    sound_instance_one_shot(sfxStep, x, y);
}, [], -1);

airCloudParticleTimer = time_source_create(playerTimeSources, 8, time_source_units_frames, function() {
    PartSpawnExt(x, y, PART_TYPES.AIR_CLOUD, 25, 25, 10, 35);
}, [], -1);


/////////////////////////////
// Afterimage timers
/////////////////////////////

blurAfterimageTimer = time_source_create(playerTimeSources, 2, time_source_units_frames, function() {
    var afterimg = FadeAfterimgCreate();
    if (stateName == "Cape")
        afterimg.image_index = floor(image_index);
}, [], -1);

machAfterimageUseAlpha = true;

machAfterimageTimer = time_source_create(playerTimeSources, 6, time_source_units_frames, function() {
    MachAfterimgCreate(machAfterimageUseAlpha);
}, [], -1);

/////////////////////////////
// Other variables
/////////////////////////////

carryingId = noone;
hudBookId = noone;
hudTvId = noone;
instakillHitbox.canAttack = false;
invincibilityTime = 0;