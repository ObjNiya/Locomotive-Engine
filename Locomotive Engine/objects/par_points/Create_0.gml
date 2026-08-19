eventPath = sfx_collectable;

value = 10;
magnetizeSpd = 5;

magnetizeTarget = noone;

DESTROY_SAVEROOM;

if (place_meeting_collision(x, y))
    visible = false;