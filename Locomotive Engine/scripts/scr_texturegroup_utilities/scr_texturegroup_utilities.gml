/**
 * Returns the loading progress of the given texture group in percent.
 * @parameter {String} groupname The name of the texture group to get the loading progress of.
 * @pure
 */
function TexturegroupGetProgress(groupname)
{
    if (texturegroup_get_status(groupname) == texturegroup_status_fetched)
        return 100;
    
    var progress = 0;
    
    var textures = texturegroup_get_textures(groupname);
    var texture_count = array_length(textures);
    var i = 0;
    
    repeat (texture_count)
    {
        progress += real(texture_is_ready(textures[i]));
        i++;
    }
    
    progress /= texture_count;
    return progress;
}