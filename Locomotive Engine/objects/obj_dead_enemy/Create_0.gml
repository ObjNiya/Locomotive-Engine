// Built-ins

depth = 2;

// Physics

grav = 0.4;
hsp = random_range(-10, -18);
vsp = random_range(-10, -18);

// Effects

visual_helper_initialize();

visual_xscale = 0.4;
visual_yscale = 1.6;

spr_palette = -1;
spr_palette_index = 0;

shake_magnitude = 3;
shake_decrease = 0.05;

cloud_particle_timer = new Timer(5, time_source_units_frames, function() {
    var offset = irandom_range(-40, 40);
    
    create_particle(x + offset, y + offset, obj_cloud_particle, false);
})

cloud_particle_timer.set_ext(1, true);
cloud_particle_timer.start();