/// @ignore
function state_player_sjump_prepare_start()
{
    sprite_index_set(spr_sjump_prepare_intro, 0);
    image_xscale = abs(image_xscale);
}

/// @ignore
function state_player_sjump_prepare_step()
{
    if (sprite_index == spr_sjump_prepare_intro && !animation_end())
    {
        movespeed = approach(movespeed, 0, 1);
        hsp = movespeed * sign(hsp);
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != -1 && grounded)
    {
        state_machine_set_state(state_player_sjump());
        return;
    }
    
    movespeed = 3;
    
    if (grounded)
        hsp = movespeed * InputX(INPUT_CLUSTER.NAVIGATION);
    else
        hsp = approach(hsp, movespeed * InputX(INPUT_CLUSTER.NAVIGATION), 0.35);
    
    sprite_index = (hsp == 0) ? spr_sjump_prepare_idle : spr_sjump_prepare_move;
}

function state_player_sjump_prepare()
{
    return [state_player_sjump_prepare_start, state_player_sjump_prepare_step, -1];
}