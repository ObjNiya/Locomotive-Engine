if (!level_intro)
    exit;

var plyr_x = 0;
var plyr_y = 0;

with (obj_exitportal)
{
    plyr_x = x;
    plyr_y = y;
    
    visible = true;
}

with (obj_player)
{
    visible = true;
  
    visual_xscale = 1;
    visual_yscale = 1;
      
    vsp = -6;
    hsp = 0;
    
    if (plyr_x != 0)
        x = plyr_x;
    if (plyr_y != 0)
        y = plyr_y;
    
    smc_set_state(state_player_rolling_jump);
    
    movespeed = 0;
    grav = 0.5;
}

level_intro = false;