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

bird = new Sprite(spr_enemybird);

dead_hsp = 0;
dead_vsp = 0;

/////////////////////////////
// Initialize various systems
/////////////////////////////

scr_collision_init();
grav = 0.5;
terminalVelocity = 20;

initialize_movement_helpers();

visual_helper_initialize();
visual_xscale = image_xscale;
image_xscale = 1;

combat_initialize();
has_collision = true;

stun_function = function(other_id)
{
    if (unstunnable_buffer > 0)
        return;
    
    state_machine_set_state(state_enemy_stunned());
    
    visual_xscale = -other_id.visual_xscale;
    movespeed = 12;
    
    hsp = movespeed * -visual_xscale;
    vsp = (other_id.y - 180 - y) / 60;
    
    unstunnable_buffer = 15;
    
    instance_create(x, y, obj_bang_particle);
}

kill_function = function(other_id)
{
    if (variable_instance_exists(other_id, "camera"))
    {
        camera_set_shake(other_id.camera, 3, 0.05);
    }
        
    if (variable_instance_exists(other_id, "usesCollision"))
    {
        var x_weight = random_range(0.8, 1.2);
        var y_height = random_range(0.8, 1.2);
        
        hsp = other_id.hsp / x_weight;
        vsp = other_id.vsp / y_height;
        
        if (abs(vsp) < 10)
            vsp = irandom_range(-10, -18) * side(vsp, -1);
    }
    else
    {
        hsp = random_range(10, 18) * image_xscale;
        vsp = random_range(-10, -18);
    }
    instance_destroy();
    add_saveroom();
}

state_machine_initialize();
state_machine_set_state(state_enemy_walk());

unstunnable_buffer = 0;

snd_stunned = sound_instance_create(sfx_enemy_stunned);

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