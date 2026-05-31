StepTimers(thrown_blur_afterimage, scared_timer, stunned_timer);
bird.step();
scr_collision();
smc_step();
hurtboxStep();

bird.x = x;
bird.y = y - 40;