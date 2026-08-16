depth = DEPTHS.FAR;
mask_index = spr_waddledee_mask;

my_killer = noone;
enemyTimeSources = time_source_create(time_source_game, 1, time_source_units_frames, function() {});

/////////////////////////////
// State variables
/////////////////////////////

// Grabbed State

grabbedSpr = spr_waddledee_stun;
thrownBlurAfterimgTimer = time_source_create(enemyTimeSources, 2, time_source_units_frames, function() {
    create_afterimage(x, y, obj_blur_afterimage);
}, [], -1);

// Scared State

scaredSpr = spr_waddledee_scared;
scaredTimer = 84;

// Stunned State

stunnedSpr = spr_waddledee_stun;
stunBird = new Animator(spr_enemybird);
unstunnableTime = 0;
stunnedTimer = 200;

// Walk State

walkSpr = spr_waddledee_walk;
turnSpr = -1;

/////////////////////////////
// Other variables
/////////////////////////////

deadSpr = spr_waddledee_dead;

paletteSpr = -1;
paletteIndex = 0;

spr_palette = -1;
spr_palette_index = 0;

parryable = true;
hp = 1;

/////////////////////////////
// Initialize various systems
/////////////////////////////

hurtbox = HitboxCreate();
hurtbox.canAttack = false;

attackHitbox = HitboxCreate();
attackHitbox.canHurt = false;
attackHitbox.canAttack = false;

invincibleBuffer = 0;

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

MovementHelpersInit();
VisualHelperInit();
HitstunInit();
SmcInit("Enemy", "Enemy");
SmcSetState("Walk");