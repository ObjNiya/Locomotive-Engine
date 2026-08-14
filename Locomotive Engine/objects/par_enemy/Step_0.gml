HITSTUN_STEP;


StepTimers(thrown_blur_afterimage, scared_timer, stunned_timer);
bird.step();
scr_collision();
SmcRunEvent(STATE_EVENTS.STEP);
HitboxesStep(hitbox);


bird.x = x;
bird.y = y - 40;