event_inherited();

depth = DEPTHS.FAR;

pal_sprite = -1;
pal_index = 0;

destroy_sound = sfx_destroyable;

debris_sprite = spr_block_debris;
debris_amount = 2;

dust_sprite = spr_block_dust_particle;
dust_amount = 1;

effects_get_offset = function()
{
    return
    [
        random_range(0, sprite_width),
        random_range(0, sprite_height)
    ]
};

DESTROY_SAVEROOM;