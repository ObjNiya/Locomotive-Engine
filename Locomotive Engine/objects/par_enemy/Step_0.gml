StepTimers(thrown_blur_afterimage, scared_timer, stunned_timer);
bird.step();
scr_collision();
smc_step();
stepHitboxes(hitbox);


bird.x = x;
bird.y = y - 40;