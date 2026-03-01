/**
 * This function will attempt to get the given characters sprite by taking the name of the given sprite and replacing it's suffix with the given characters one.
 * @parameter {Asset.GMSprite} sprite The sprite to replace the suffix of.
 * @parameter {Struct|Real} char The Char Struct **OR** the index of the character on the global characters array.
 * @pure
 * @returns {Asset.GMSprite|Real}
 */
function get_charspr(sprite, char)
{
    CATCH_UNDEFINED_CHAR;
    
    var fallback_spr = sprite;
    
    sprite = string_replace_all(sprite_get_name(sprite), CHAR_DEFAULT_SPRITE_SUFFIX, char.sprite_suffix);
    sprite = asset_get_index(sprite);
    
    return (sprite_exists(sprite)) ? asset_get_index(sprite) : fallback_spr;
}

/**
 * This function will cache every sprite it can find that ends with the given characters sprite suffix into a variable on the current instance.
 * @parameter {Struct|Real} char The Char Struct **OR** the index of the character on the global characters array.
 */
function cache_charsprites(char)
{
    CATCH_UNDEFINED_CHAR;
    
    var sprites = asset_get_ids(asset_sprite);
    var sprite_count = array_length(sprites);
    
    for (var i = 0; i < sprite_count; i++)
    {
        var sprite = sprites[i];
        var charspr = get_charspr(sprite, char);
        
        if (!sprite_exists(charspr))
            continue;
        
        var var_name_trim = (sprite == charspr) ? CHAR_DEFAULT_SPRITE_SUFFIX : char.sprite_suffix
        var charspr_var_name = string_trim_end(sprite_get_name(charspr), [var_name_trim]);
        
        variable_instance_set(id, charspr_var_name, charspr);
        
        dbg_trace("Caching charspr: ", charspr_var_name, " with value: ", charspr);
    }
}

/**
 * This function will attempt to get the given characters event path by taking the name of the given path and replacing any mention of the default character name
 * with the given characters one.
 * @parameter {String} event_path The event path to find this characters equivalenth of.
 * @parameter {Struct|Real} char The Char Struct **OR** the index of the character on the global characters array.
 * @pure
 * @returns {String|Real}
 */
function get_charsnd(event_path, char)
{
    CATCH_UNDEFINED_CHAR;
    
    if (!is_string(event_path))
    {
        log(get_charsnd, LOG_LEVELS.WARN, ["Shit"]);
        return "event:/Event Defaults/3D SFX Action";
    }
    
    var fallback_path = event_path;
    
    event_path = string_replace_all(event_path, CHAR_DEFAULT_EVENT_NAME, char.event_name);
    var event_id = fmod_studio_system_get_event(event_path);
    
    if (event_id != 0 && sound_description_is_valid(event_id))
        return event_path;
    else
        return fallback_path;
}
