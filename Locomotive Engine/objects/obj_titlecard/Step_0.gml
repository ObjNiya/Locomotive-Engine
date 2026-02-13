layer_sprite_x(titlecard_title, irandom_range(-1, 1));
layer_sprite_y(titlecard_title, irandom_range(-1, 1));

if (titlecard_time-- <= 0)
{
    titlecard_time = 9999;
    goto_level(global.level);
    
    with (par_player)
        smc_set_state(state_player_normal);
    
}