function state_player_machroll_start()
{
    sprite_index = spr_machroll;
    mask_index = spr_crouchmask;
}

function state_player_machroll()
{
    hsp = movespeed * sign_image_xscale;
    
    if (!grounded)
    {
        sprite_index = spr_dive;
        
        vsp = 10;
    }
    
    if (place_meeting(x + sign_image_xscale, y, obj_solid))
    {
        state_machine_set_state(state_player_animation());
        
        sprite_index = spr_wallsplat;
        
        grav = 0;
        vsp = 0;
        
        return;
    }
    
    if (sign(InputY(INPUT_CLUSTER.NAVIGATION)) != 1 && !place_meeting(x, y - 32, [obj_solid, obj_slope]) && grounded)
    {
        state_machine_set_state(state_player_mach());
        
        sprite_index = spr_rollgetup;
        image_index = 0;
        
        return;
    }
    
    image_speed = movespeed / 15;
}

function state_player_machroll_end()
{
    mask_index = spr_player_mask;
}