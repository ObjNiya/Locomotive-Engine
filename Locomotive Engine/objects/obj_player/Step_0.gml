sign_image_xscale = sign(image_xscale);

scr_collision();
coyote_manager_step();
state_machine_step();


step_particle_timer.step();
groundpound_woosh_particle_timer.step();
blur_afterimage_timer.step();
mach_afterimage_timer.step();