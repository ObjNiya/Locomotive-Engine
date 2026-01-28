scr_collision();
cloud_particle_timer.step();

if (shake_magnitude > 0)
    shake_magnitude -= shake_decrease;