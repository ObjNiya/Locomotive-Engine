texturegroup_load("Default");
texturegroup_load("texgroup_gamestart");
texturegroup_load("texgroup_fileselect");

with (obj_fmod_studio)
{
    masterBank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_master), FMOD_STUDIO_LOAD_BANK.NORMAL);
    masterBankStrs = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_master_str), FMOD_STUDIO_LOAD_BANK.NORMAL);
    
    _globalBank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_global), FMOD_STUDIO_LOAD_BANK.NORMAL);
    titleBank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_title), FMOD_STUDIO_LOAD_BANK.NORMAL);
    other.banksToCheck = [masterBank, masterBankStrs, _globalBank, titleBank];
}

drawFunc = function(progress)
{
    var gui_bottom = GuiCalcY(fa_bottom);
    var gui_right = GuiCalcX(fa_right);
    
    draw_rectangle(0, gui_bottom - (16 * global.guiMaxScale), gui_right * (progress / 100), gui_bottom, false);
}

finishFunc = function()
{
    RoomGoto();
}

alarm[1] = 1;