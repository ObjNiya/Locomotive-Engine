fmodBankLoad = function()
{
    obj_fmod_studio.hallway_longway_bank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_levelstruct), FMOD_STUDIO_LOAD_BANK.NORMAL);
}

fmodBankCheck = function()
{
    return fmod_studio_bank_get_loading_state(obj_fmod_studio.hallway_longway_bank) == FMOD_STUDIO_LOADING_STATE.LOADED;
}