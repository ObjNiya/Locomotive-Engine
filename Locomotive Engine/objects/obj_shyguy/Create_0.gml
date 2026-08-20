event_inherited();

mask_index = spr_shyguy_hitbox;
sprite_index = spr_shyguy_walk;

walkSpr = spr_shyguy_walk;
scaredSpr = spr_shyguy_scared;
grabbedSpr = spr_shyguy_stun;
stunnedSpr = spr_shyguy_stun;
deadSpr = spr_shyguy_dead;
turnSpr = spr_shyguy_turn;

SmcSetStateNamePrefix("Shyguy");

hurtbox.mask_index = spr_shyguy_hitbox;
attackHitbox.canAttack = true;
attackHitbox.mask_index = spr_shyguy_spearhitbox;

DESTROY_SAVEROOM;