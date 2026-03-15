if (!intro_cutscene)
    exit;

with (obj_player)
{
    x = other.x;
    
    visual_xscale = approach(visual_xscale, 1, 0.035);
    visual_yscale = approach(visual_yscale, 1, 0.035);
    
    if (grounded)
    {
        smc_set_state(state_player_normal);
        visual_xscale = 1;
        visual_yscale = 1;
        
        other.intro_cutscene = false;
    }
}