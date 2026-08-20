var texgroup_count = array_length(texgroupsToCheck);
var i = 0;
var status_req = (texgroupsCheckPrefetch) ? texturegroup_status_fetched : texturegroup_status_loaded;

repeat (texgroup_count)
{
    var texgroup = texgroupsToCheck[i];
    var texgroup_stat = texturegroup_get_status(texgroup);
    if (texgroup_stat != status_req)
    {
        if (texgroup_stat == texturegroup_status_unloaded)
            texturegroup_load(texgroup, texgroupsCheckPrefetch);
        exit;
    }
    
    i++;
}

var bank_count = array_length(banksToCheck);
i = 0;

repeat (bank_count)
{
    var bank = banksToCheck[i];
    var bank_stat = fmod_studio_bank_get_loading_state(bank);
    var bank_sample_stat = fmod_studio_bank_get_sample_loading_state(bank);
    if (banksCheckSampleData)
        bank_sample_stat = FMOD_STUDIO_LOADING_STATE.LOADED;
    
    if (bank_stat != FMOD_STUDIO_LOADING_STATE.LOADED)
        exit;
    
    if (bank_sample_stat != FMOD_STUDIO_LOADING_STATE.LOADED)
    {
        if (bank_sample_stat == FMOD_STUDIO_LOADING_STATE.UNLOADED || bank_sample_stat == FMOD_STUDIO_LOADING_STATE.UNLOADING)
            fmod_studio_bank_load_sample_data(bank);
        exit;
    }
    
    i++;
}


if (finishFunc != -1)
    finishFunc();

GameResume();
instance_destroy();