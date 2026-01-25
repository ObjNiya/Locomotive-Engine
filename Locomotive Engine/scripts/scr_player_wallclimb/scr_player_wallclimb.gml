function state_player_wallclimb_start()
{
    sprite_index = spr_wallclimb;
    
    vsp = -movespeed;
    vsp = min(0, vsp);
    
    hsp = 0;
    movespeed = 0;
    grav = 0;
    
}

function state_player_wallclimb_step()
{
    if (player_perform_hit_ceiling())
        return;
    
    wallclimb_grab_buffer--;
    
    if (!InputCheck(INPUT_VERB.MACHRUN) && wallclimb_grab_buffer <= 0)
    {
        state_machine_set_state(state_player_normal());
        
        hsp = -6 * sign_image_xscale;
        
        if (!InputCheck(INPUT_VERB.JUMP))
            vsp /= 20;
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.JUMP))
    {
        state_machine_set_state(state_player_mach());
        sprite_index_set(spr_walljump_intro, 0);
        
        image_xscale *= -1;
        
        vsp = jump_height;
        movespeed = 10;
        
        return;
    }
    
    if (InputPressed(INPUT_VERB.GRABDASH) && sprite_index != spr_wallclimb_dash)
    {
        sprite_index = spr_wallclimb_dash;
        
        wallclimb_dash_timer.start();
    }
    
    wallclimb_dash_timer.step();
    
    var acceleration = (sprite_index == spr_wallclimb_dash) ? 0.3 : 0.15;
    
    if (vsp > -20)
        vsp -= acceleration;
    
    if (!place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        movespeed = abs(vsp);
        vsp = 0;
        
        state_machine_set_state(state_player_mach());
        
        return;
    }
}

function state_player_wallclimb_end()
{
    grav = 0.5;
    
    wallclimb_dash_timer.stop();
}

function state_player_wallclimb()
{
    return [state_player_wallclimb_start, state_player_wallclimb_step, state_player_wallclimb_end];
}