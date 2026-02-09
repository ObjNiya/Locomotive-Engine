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

movement_helpers_initialize();
visual_helper_initialize();

combat_initialize();
has_collision = true;

stun_function = function(other_id)
{
    if (unstunnable_buffer > 0)
        return false;
    
    var stomp = false;
    
    if (other_id.y >= y && other_id.state_step == state_player_normal_step)
        return false;
    else if (other_id.state_step == state_player_normal_step)
        stomp = true;
    
    state_machine_set_state(state_enemy_stunned());
    
    image_xscale = -other_id.visual_xscale;
    movespeed = (stomp) ? 5 : 12;
    
    hsp = movespeed * -image_xscale;
    vsp = (stomp) ? -5 : (other_id.y - 180 - y) / 60;
    
    unstunnable_buffer = 15;
    
    invincibility_timer.max_time = 5;
    invincibility_timer.start();
    
    invincible = true;
    untouchable = true;
    
    if (!stomp)
    {
        instance_create(x, y, obj_bang_particle);
    
        repeat (2)
        {
            with (instance_create(x, y, obj_slap_star_debris))
                vspeed = irandom_range(-6, -11);
        }
        
        sound_instance_one_shot(sfx_player_mach2_bump, x, y);
    }
    else
    {
        instance_create(other_id.x, other_id.y + 50, obj_stomp_stars_particle);
        sound_instance_one_shot(sfx_enemy_stomped, other_id.x, other_id.y);
    }
    
    return true;
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
    
    with (other_id)
    {
        repeat (3)
            instance_create(x, y, obj_slap_star_debris);
        repeat (3)
            instance_create(x, y, obj_enemy_debris);
    }
    
    instance_create(x, y, obj_parry_particle);
    instance_create(x, y, obj_impact_particle);
    
    instance_destroy();
    add_saveroom();
}

state_machine_initialize();
state_machine_set_state(state_enemy_walk());

unstunnable_buffer = 0;

/////////////////////////////
// Timers
/////////////////////////////

invincibility_timer = new Timer(5, time_source_units_frames, function() {
    invincible = false;
    untouchable = false;
})

stunned_timer = new Timer(200, time_source_units_frames, function() {
    state_machine_set_state(state_enemy_walk());
})

scared_timer = new Timer(1.4, time_source_units_seconds, function() {
    state_machine_set_state(state_enemy_walk());
})

thrown_blur_afterimage = new Timer(2, time_source_units_frames, function() {
    if (movespeed == 0)
        return;
    
    create_afterimage(x, y, obj_blur_afterimage);
})