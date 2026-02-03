var texturegroup_count = array_length(texturegroups);
var texturegroups_progress = 0;

for (var i = 0; i < texturegroup_count; i++)
{
    var texturegroup = texturegroups[i];
    
    switch (texturegroup_get_status(texturegroup.name))
    {
        case texturegroup_status_unloaded:
        case texturegroup_status_fetched: 
            texturegroup_load(texturegroup.name, texturegroup.prefetch);
            break;
        
        case texturegroup_status_loading:
            var textures = texturegroup_get_textures(texturegroup.name);
            var texture_count = array_length(textures);
            
            for (var j = 0; j < texture_count; j++)
                texturegroups_progress += texture_is_ready(textures[j]);
            
            texturegroups_progress /= texture_count;
            break;
        
        case texturegroup_status_loaded:
            texturegroups_progress++;
            break;
    }
}

texturegroups_progress /= texturegroup_count;

var fmod_studio_bank_count = array_length(fmod_studio_banks);
var fmod_studio_banks_progress = 0;

with (obj_fmod_studio_manager)
{
    for (var i = 0; i < fmod_studio_bank_count; i++)
    {
        var fmod_studio_bank = other.fmod_studio_banks[i];
        var bank_reference = variable_instance_get(id, fmod_studio_bank.variable);
        var loading_state = fmod_studio_bank_get_loading_state(bank_reference)
        
        if (loading_state == FMOD_STUDIO_LOADING_STATE.UNLOADED || loading_state == FMOD_STUDIO_LOADING_STATE.UNLOADING)
        {
            var loading_mode = (fmod_studio_bank.prefetch) ? FMOD_STUDIO_LOAD_BANK.DECOMPRESS_SAMPLES : FMOD_STUDIO_LOAD_BANK.NORMAL;
            var new_reference = fmod_studio_system_load_bank_file(fmod_path_bundle(fmod_studio_bank.path), loading_mode);
                
            variable_instance_set(id, fmod_studio_bank.variable, new_reference);  
        }
        else if (loading_state == FMOD_STUDIO_LOADING_STATE.LOADED)
            fmod_studio_banks_progress++
    }
    
    fmod_studio_banks_progress /= fmod_studio_bank_count;
}

load_progress = (texturegroups_progress + fmod_studio_banks_progress) / 2;
trace(load_progress);