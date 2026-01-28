// Built-ins
depth = 2;

// Physics

scr_collision_init();

grav = 0.4;
terminalVelocity = 20;
usesCollision = false;

// Effects

shake_magnitude = 4;
shake_decrease = 0.1;

cloud_particle_timer = new Timer(5, 1, time_source_units_frames, true, function() {
    instance_create(x, y, obj_cloud_particle);
})