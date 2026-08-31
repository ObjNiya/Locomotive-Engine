with (InstanceCreate(x, y, obj_dead_enemy))
{ 
    sprite_index = other.deadSpr;
    image_xscale = other.image_xscale;
    
    mask_index = other.mask_index;
    
    paletteSpr = other.paletteSpr;
    paletteIndex = other.paletteIndex;
    
    var killer_x = -1;
    
    if (instance_exists(other.my_killer))
        killer_x = other.my_killer.x;
    
    hsp = sign(x - killer_x) * random_range(10, 18);
    vsp = random_range(-10, -18);
    
    if (x != killer_x)
        image_xscale = -sign(x - killer_x);
}

sound_instance_one_shot(sfx_enemydeath, x, y);
PartSpawn(x, y, PART_TYPES.SLAPSTARS_DEBRIS, 0, 0, ps_shape_rectangle, ps_distr_linear, false, 3);
PartSpawn(x, y, PART_TYPES.BANG);

if (!respawning)
{
	ComboAdd(1, global.comboTimerMax);
	SaveroomAdd();
}
else
	ComboSetTime(1);
