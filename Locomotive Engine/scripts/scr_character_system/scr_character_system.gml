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
    sprite = asset_get_index_fast(sprite, asset_sprite);
    
    return (sprite_exists(sprite)) ? asset_get_index_fast(sprite, asset_sprite) : fallback_spr;
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
    var i = 0;
    
    repeat (sprite_count)
    {
        var sprite = sprites[i];
        var sprite_name = sprite_get_name(sprite);
        
        if (!string_ends_with(sprite_name, char.sprite_suffix))
        {
            i++;
            continue;
        }
        
        var charspr_name = string_trim_end(sprite_name, [char.sprite_suffix]);
        var charspr_value = get_charspr(sprite, char);
        
        variable_instance_set(id, charspr_name, charspr_value);
        Log(cache_charsprites, LOG_TYPES.INFO, "Caching charspr ", charspr_name, " with value ", charspr_value);
        
        i++;
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
        Log(get_charsnd, LOG_TYPES.WARNING, "Shit");
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
