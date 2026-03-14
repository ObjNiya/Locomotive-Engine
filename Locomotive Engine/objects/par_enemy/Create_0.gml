depth = DEPTHS.FAR;

dead_hsp = 0;
dead_vsp = 0;


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
    smc_set_state(state_enemy_walk);
})

scared_prefix = function() {};
scared_postfix = function() {};

// Stunned State

unstunnable_buffer = 0;
bird = new Sprite(spr_enemybird);
stunned_timer = new Timer(200, time_source_units_frames, function() {
    smc_set_state(state_enemy_walk);
});

stunned_prefix = function() {};
stunned_postfix = function() {};

// Walk State

spr_walk = spr_waddledee_walk;

walk_prefix = function() {};
walk_postfix = function() {};

/////////////////////////////
// Other variables
/////////////////////////////

spr_palette = -1;
spr_palette_index = 0;

spr_dead = spr_waddledee_dead;

hp = 1;
invincible = false;
invincibility_timer = new Timer(5, time_source_units_frames, function() {
    invincible = false;
});

/////////////////////////////
// Initialize various systems
/////////////////////////////

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

movement_helpers_initialize();
visual_helper_initialize();

state_machine_initialize();
smc_set_state(state_enemy_walk);