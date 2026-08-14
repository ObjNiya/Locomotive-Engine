/**
 * Attempts to return the given Characters sprite of the given sprite. If it doesn't exist, the sprite that was passed in will be returned instead.
 * @parameter {Asset.GMSprite} sprite The sprite to get the Character sprite of.
 * @parameter {Struct|Real} char The Character to get the sprite of.
 * @pure
 * @returns {Asset.GMSprite}
 */
function CharGetSpr(sprite, char)
{
    CATCH_UNDEFINED_CHAR;
    
    with (char)
    {
        var fallback_spr = sprite;
        
        sprite = string_replace_all(sprite_get_name(sprite), CHAR_DEFAULT_SPRITE_SUFFIX, sprSuffix);
        sprite = AssetGetIndexFast(sprite, asset_sprite);
        
        return (sprite_exists(sprite)) ? AssetGetIndexFast(sprite, asset_sprite) : fallback_spr;
    }
}


/**
 * Caches every given Characters sprites as variables into the current instance. 
 * @parameter {Struct|Real} char Which Characters sprites to cache.
 */
function CharCacheSprs(char)
{
    CATCH_UNDEFINED_CHAR;
    
    var sprites = asset_get_ids(asset_sprite);
    var sprite_count = array_length(sprites);
    var i = 0;
    
    repeat (sprite_count)
    {
        var sprite = sprites[i];
        var sprite_name = sprite_get_name(sprite);
        
        if (!string_ends_with(sprite_name, char.sprSuffix))
        {
            i++;
            continue;
        }
        
        var charspr_name = string_trim_end(sprite_name, [char.sprSuffix]);
        var charspr_value = CharGetSpr(sprite, char);
        
        variable_instance_set(id, charspr_name, charspr_value);
        Log(CharCacheSprs, LOG_TYPES.INFO, "Caching charspr ", charspr_name, " with value ", charspr_value);
        
        i++;
    }
}


/**
 * Attempts to return the given Characters FMOD Studio event path of the given event path.
 * @parameter {String} event_path The event path to find this characters equivalenth of.
 * @parameter {Struct|Real} char The Character to get the FMOD Studio event path of.
 * @pure
 * @returns {String|Real}
 */
function CharGetSnd(event_path, char)
{
    CATCH_UNDEFINED_CHAR;
    
    if (!is_string(event_path))
    {
        Log(CharGetSnd, LOG_TYPES.WARNING, "The given event path is not a string, returning the default 3D SFX Action instead.");
        return "event:/Event Defaults/3D SFX Action";
    }
    
    var fallback_path = event_path;
    
    event_path = string_replace_all(event_path, CHAR_DEFAULT_EVENT_NAME, char.evName);
    var event_id = fmod_studio_system_get_event(event_path);
    
    if (event_id != 0 && sound_description_is_valid(event_id))
        return event_path;
    else
        return fallback_path;
}
