if (!active || sprite_index != spr_secretegg_spawn)
    exit;

with (obj_player)
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    vertMovespeed = 0;
    
    x = other.x;
    y = other.y;
    
    visible = false;
}

if (!AnimationEnd())
    exit;

with (obj_player)
{
    SmcSetState("Groundpound");
    SpriteSet(spr_groundpound_intro, 0);
    
    visualXScale = 1;
    visualYScale = 1;
    
    vsp = -5;
    visible = true;
}

sprite_index = spr_null;

var i = 0;

repeat (2)
{
    var dir = BSign(!i);
    
    with (GibsCreate(x, y, spr_secretegg_gibs, -1, false, false, spr_secretegg_palette, palIndex))
    {
        image_index = i;
        hspeed = random_range(-3, -5) * dir;
        vspeed = random_range(3, 5) * dir;

        collideBuffer = 45;
    }
    
    i++;
}