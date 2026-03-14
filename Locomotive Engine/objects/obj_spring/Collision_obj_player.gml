if (sprite_index == spr_spring_activate)
    exit;

sprite_set(spr_spring_activate, 0);

with (other)
{
    var spring_dir = sign(other.image_yscale);
    
    x = other.x;
    
    if (spring_dir == -1)
    {
        smc_set_state(state_player_groundpound);
        
        vsp = 10;
        sprite_index = spr_bananaslip_bump;
    }
    else if (spring_dir == 1)
    {
        smc_set_state(state_player_sjump);
        vsp = -10;
        
        sprite_index = spr_springlaunch;
    }
    
    // TODO: Add speedlines, Spring Sound
}