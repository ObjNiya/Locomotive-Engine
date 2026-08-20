/**
 * Creates a loading screen that checks if the given FMOD Studio Banks and texture groups have been loaded.
 * @parameter {Array<String>} texgroups_to_check Which texture groups to check for if they have loaded/prefetched.
 * @parameter {Array<Real>} banks_to_check Which FMOD Studio Banks to check for if they have loaded or not.
 * @parameter {Bool} texgroups_check_prefetch (OPTIONAL) Whether or not to also check if the given texture groups have been loaded into VRAM. Default is true.
 * @parameter {Bool} banks_check_sample_data (OPTIONAL) Whether or not to check if the provided FMOD Studio Banks also have their sample data loaded. Default is true.
 */
function LoadingscreenCreate(texgroups_to_check, banks_to_check, texgroups_check_prefetch = true, banks_check_sample_data = true)
{
    with (InstanceCreate(0, 0, obj_loadingscreen))
    {
        texgroupsToCheck = texgroups_to_check;
        texgroupsCheckPrefetch = texgroups_check_prefetch;
        
        banksToCheck = banks_to_check;
        banksCheckSampleData = banks_check_sample_data;
        
        alarm[0] = 1;
        return id;
    }
}