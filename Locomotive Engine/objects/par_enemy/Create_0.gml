event_inherited();

depth = DEPTHS.FAR;
mask_index = spr_waddledee_mask;

my_killer = noone;

/////////////////////////////
// State variables
/////////////////////////////

// Grabbed State

spr_stunned = spr_waddledee_stun;
thrown_blur_afterimage = new Timer(2, time_source_units_frames, function() {
    create_afterimage(x, y, obj_blur_afterimage);
});

grabbed_prefix = function() {};
grabbed_postfix = function() {};

// Scared State

spr_scared = spr_waddledee_scared;
scared_timer = new Timer(1.4, time_source_units_seconds, function() {
    SmcSetState("Walk");
})

scared_prefix = function() {};
scared_postfix = function() {};

// Stunned State

unstunnable_buffer = 0;
bird = new Sprite(spr_enemybird);
stunned_timer = new Timer(200, time_source_units_frames, function() {
    SmcSetState("Walk");
});

stunned_prefix = function() {};
stunned_postfix = function() {};

// Walk State

spr_walk = spr_waddledee_walk;
spr_turn = -1;

walk_prefix = function() {};
walk_postfix = function() {};

/////////////////////////////
// Other variables
/////////////////////////////

spr_palette = -1;
spr_palette_index = 0;

spr_dead = spr_waddledee_dead;

unstunableBuffer = 0;
hp = 1;
parryable = true;

/////////////////////////////
// Initialize various systems
/////////////////////////////

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

MovementHelpersInit();
VisualHelperInit();
HitstunInit();

HurtSysInit();
hitbox = HitboxCreate();

with (hitbox)
    new Target("player", obj_player, AttackPlayer);

SmcInit();
statePrefix = "StateEnemy";
SmcSetState("Walk");