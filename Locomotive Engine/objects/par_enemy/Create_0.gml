check_saveroom();

depth = 1;

/////////////////////////////
// Sprite variables
/////////////////////////////

spr_walk = spr_waddledee_walk;
spr_scared = spr_waddledee_scared;
spr_stunned = spr_waddledee_stun;
spr_dead = spr_waddledee_dead;

spr_palette = -1;
spr_palette_index = 0;

/////////////////////////////
// Initialize various systems
/////////////////////////////

scr_collision_init();
grav = 0.5;
movespeed = 1;
terminalVelocity = 20;

visual_helper_initialize();
visual_xscale = image_xscale;
image_xscale = 1;

combat_initialize();
has_collision = true;

stun_function = function(other_id)
{
    
}

kill_function = function(other_id)
{
    instance_destroy();
    add_saveroom();
}

state_machine_initialize();
state_machine_set_state(state_enemy_walk());

/////////////////////////////
// Timers
/////////////////////////////

scared_timer = new Timer(1.4, time_source_units_seconds, function() {
    state_machine_set_state(state_enemy_walk());
})

thrown_blur_afterimage = new Timer(2, time_source_units_frames, function() {
    if (movespeed == 0)
        return;
    
    create_afterimage(x, y, obj_blur_afterimage);
})