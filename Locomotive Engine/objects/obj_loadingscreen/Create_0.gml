
SINGLETON;

appSpr = -1;
guiSpr = -1;

drawFunc = -1;
finishFunc = -1;

drawScreen = function()
{
    if (appSpr != -1)
        draw_sprite(appSpr, 0, 0, 0);
    if (guiSpr != -1)
        draw_sprite(guiSpr, 0, 0, 0);
}

getLoadProgress = function()
{
    var progress = 0;
    var texgroup_count = array_length(texgroupsToCheck);
    var i = 0;
    
    repeat (texgroup_count)
    {
        progress += TexturegroupGetProgress(texgroupsToCheck[i]);
        i++;
    }
    
    progress /= texgroup_count;
    
    var bank_count = array_length(banksToCheck);
    i = 0;
    
    repeat (bank_count)
    {
        progress += real(fmod_studio_bank_get_loading_state(banksToCheck[i]) == FMOD_STUDIO_LOADING_STATE.LOADED) * 100;
        if (banksCheckSampleData)
            progress += real(fmod_studio_bank_get_sample_loading_state(banksToCheck[i]) == FMOD_STUDIO_LOADING_STATE.LOADED) * 100;
        
        i++;
    }
    
    if (banksCheckSampleData)
        bank_count *= 2;
    progress /= bank_count;
    
    return progress;
}

alarm[0] = 1;