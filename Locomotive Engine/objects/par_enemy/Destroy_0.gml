var killer_x = (instance_exists(myKiller)) ? myKiller.x : -1;

with (GibsCreate(x, y, deadSpr, sign(x - killer_x), true, false, paletteSpr, paletteIndex))
    mask_index = other.mask_index;
    
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
