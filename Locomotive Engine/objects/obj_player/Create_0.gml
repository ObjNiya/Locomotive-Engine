// Collision

scr_collision_init();
grav = 0.5;
movespeed = 0;
terminalVelocity = 20;

mask_index = spr_player_mask;
image_speed = 0.35;

coyote_manager_initialize();

// Character

character = global.char_damian;
char_cache_sprite_variables(character);

// State

state_machine_initialize();
state_machine_set_state(state_player_normal());

grabdash_bump_buffer = 60;
jump_height = -11;
sign_image_xscale = 1;