var on_switch = function()
{
    texturegroup_load("texgroup_levelstructure");
    texturegroup_load(texgroup);
    variable_instance_set(obj_fmod_studio, bankRef, fmod_studio_system_load_bank_file(fmod_path_bundle(bank), FMOD_STUDIO_LOAD_BANK.NORMAL));
    obj_fmod_studio.levelStructBank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_levelstruct), FMOD_STUDIO_LOAD_BANK.NORMAL);
        
    LoadingscreenCreate(["texgroup_levelstructure", texgroup], [obj_fmod_studio.levelStructBank, variable_instance_get(obj_fmod_studio, bankRef)]);
}

with (LvlGoto(levelId, obj_roomtrans_fade))
{
    image_blend = c_white;
	faceTransition = false
    fadeSpd = 0.01;
    endLag = 30;
    
    onSwitch = on_switch;
}