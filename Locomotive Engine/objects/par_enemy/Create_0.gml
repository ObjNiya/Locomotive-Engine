depth = 1;

scr_collision_init();
grav = 0.5;
movespeed = 1;
terminalVelocity = 20;

// State

walk_sprite = spr_waddledee_walk;
scared_sprite = spr_waddledee_scared;
stun_sprite = spr_waddledee_stun;
dead_sprite = spr_waddledee_dead;

hp = 1;

scared_timer = new Timer(1.4, 1, time_source_units_seconds, false, function() {
    state_machine_set_state(state_enemy_walk());
})

thrown_blur_afterimage = new Timer(2, 1, time_source_units_frames, true, function() {
    if (movespeed == 0)
        return;
    
    with (instance_create(x, y, obj_blur_afterimage))
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index - 1;
        
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
        image_blend = other.image_blend;
    }
})

state_machine_initialize();
state_machine_set_state(state_enemy_walk());