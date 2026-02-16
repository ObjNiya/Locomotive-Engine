#macro CATCH_UNDEFINED_CHAR char = __get_char__(char) if (char == undefined) { trace("The given character does not exist.") return -1 }

global.characters = array_create(MAX_CHARACTERS, undefined);

/// @ignore
function __get_char__(char)
{
    if (is_struct(char))
        return char;
    else if (is_numeric(char) && array_length(global.characters) >= char && char >= 0)
        char = global.characters[char];
    
    return char;
}

/**
 * This constructor will return a Char Struct, containing all the neccessary information for all of the character related functions to be used on it.
 * @parameter {String} sprite_suffix With what the name of the characters sprites end.
 * @parameter {String} event_name The name of the character within the path to their FMOD Studio event.
 * @parameter {String} name The characters display name in-game.
*/
function Char(sprite_suffix, event_name, name) constructor 
{
    self.sprite_suffix = sprite_suffix;
    self.event_name = event_name;
    self.name = name;
}

/**
 * This function will define a character using the Char constructor and insert it into the global characters array.
 * @parameter {Real} index Which index of the characters array to insert the level into.
 * @parameter {String} sprite_suffix With what the name of the characters sprites end.
 * @parameter {String} event_name The name of the character within the path to their FMOD Studio event.
 * @parameter {String} name The characters display name in-game.
 */
function char_define(index, sprite_suffix, event_name, name)
{
    global.characters[index] = new Char(sprite_suffix, event_name, name);
}

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
        
        var charspr_var_name = string_trim_end(sprite_get_name(charspr), [char.sprite_suffix]);
        if (sprite == charspr)
            charspr_var_name = string_trim_end(sprite_get_name(charspr), [CHAR_DEFAULT_SPRITE_SUFFIX]);
        
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
    
    event_path = string_replace_all(event_path, CHAR_DEFAULT_EVENT_NAME, char.event_name);
    var event_id = fmod_studio_system_get_event(event_path);
    
    if (fmod_studio_event_description_is_valid(event_id))
        return event_path;
    else
        return -1;
}

__define_characters__();