if (--lifespan < 0)
{
    owner_id.attack_hitbox = noone;
    instance_destroy();
}

combat_step();