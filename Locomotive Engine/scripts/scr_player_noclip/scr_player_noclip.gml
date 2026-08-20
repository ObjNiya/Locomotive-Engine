/// @ignore
function StatePlayerNoclipCreate()
{
    
    
    sprite_index = spr_parry_intro;
    image_index = 1;
    image_speed = 1;
    
    movespeed = 0;
    hsp = 0;
    vsp = 0;
    grav = 0;
    
}

/// @ignore
function StatePlayerNoclipStep()
{
    ScareEnemies();
    PlayerDoInstakill();
    
    var speed_multiplier = (InputCheck(INPUT_VERB.MACHRUN)) ? 16 : 8;

    var _hsp = InputX(INPUT_CLUSTER.NAVIGATION) * speed_multiplier;
    var _vsp = InputY(INPUT_CLUSTER.NAVIGATION) * speed_multiplier;
    
    x += _hsp;
    y += _vsp;
    
    if (InputPressed(INPUT_VERB.JUMP))
        SmcSetState("Normal");
}

/// @ignore
function StatePlayerNoclipDestroy()
{
    image_speed = 1;
    grav = 0.5;
}