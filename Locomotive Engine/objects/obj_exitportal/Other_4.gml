if (check_saveroom())
    exit;

with (obj_player)
{
    sprite_set(spr_walk_forward, 0);
    image_speed = 0;
    
    visual_xscale = 0;
    visual_yscale = 0;
    
    vsp = 0;
    grav = 0.2;
    
    y = other.y;
    visible = true;
}