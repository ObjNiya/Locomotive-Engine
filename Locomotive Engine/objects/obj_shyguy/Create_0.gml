event_inherited();

mask_index = spr_shyguy_mask;
sprite_index = spr_shyguy;

walkSpr = spr_shyguy;
scaredSpr = spr_shyguy_scared;
grabbedSpr = spr_shyguy_stun;
stunnedSpr = spr_shyguy_stun;
deadSpr = spr_shyguy_dead;
turnSpr = spr_shyguy_turn;

SmcSetStateNamePrefix("Shyguy");

hurtbox.mask_index = spr_shyguy_mask;
attackHitbox.canAttack = true;
attackHitbox.mask_index = spr_shyguyhitbox;

DESTROY_SAVEROOM;