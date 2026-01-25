function state_player_sjump_start()
{
    sprite_index_set(spr_sjump, 0);
    
    vsp = -17;
    hsp = 0;
    movespeed = 0;
    grav = -0.1;
    grounded = false;
}

function state_player_sjump_step()
{
    if (player_perform_hit_ceiling())
        return;
    
    if (sprite_index == spr_springlaunch)
        return;
    
    if ((InputPressed(INPUT_VERB.MACHRUN) || InputPressed(INPUT_VERB.GRABDASH)) && sprite_index == spr_sjump)
    {
        sprite_index_set(spr_sjump_cancel_intro, 0);
        
        vsp = 0;
        grav = 0;
    }
    
    if (sprite_index != spr_sjump_cancel_intro)
        return;
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION))
    
    if (sign_input_x != 0)
        image_xscale = sign_input_x;
    
    if (!animation_end())
        return;
    
    state_machine_set_state(state_player_mach());
    
    vsp = -5;
    movespeed = 12;
    
    sprite_index = spr_sjump_cancel;
}

function state_player_sjump_end()
{
    grav = 0.5;
}

function state_player_sjump()
{
    return [state_player_sjump_start, state_player_sjump_step, state_player_sjump_end];
}