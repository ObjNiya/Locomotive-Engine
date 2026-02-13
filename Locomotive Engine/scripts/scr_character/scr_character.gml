#macro CHAR_DEFAULT_SPRITE_SUFFIX "_damian"
#macro CHAR_DEFAULT_EVENT_KEY "Damian"

global.characters = [];

function __get_char__(char)
{
    if (is_struct(char))
        return char;
    else if (array_length(global.characters) >= char)
        return global.characters[char];
    
    return undefined;
}

function Character(sprite_suffix, event_key, name) constructor 
{
    self.sprite_suffix = sprite_suffix;
    self.event_key = event_key;
    self.name = name;
}

function char_define(id, sprite_suffix, event_key, name)
{
    array_insert(global.characters, id, new Character(sprite_suffix, event_key, name));
}

function get_charspr(sprite, char)
{
    char = __get_char__(char);
    
    sprite = sprite_get_name(sprite);
    sprite = string_replace_all(sprite, CHAR_DEFAULT_SPRITE_SUFFIX, char.sprite_suffix);
    
    return asset_get_index(sprite);
}

function cache_charsprites(char)
{
    char = __get_char__(char);
    
    trace("poo: ", global.characters)
    trace("pee: ", char)
    
    var sprites = asset_get_ids(asset_sprite);
    var sprite_count = array_length(sprites);
    
    for (var i = 0; i < sprite_count; i++)
    {
        var charspr = get_charspr(sprites[i], char);
        
        if (!sprite_exists(charspr))
            continue;
        
        var charspr_var_name = string_trim_end(sprite_get_name(charspr), [char.sprite_suffix]);
        
        variable_instance_set(id, charspr_var_name, charspr);
        
        dbg_trace("Caching charspr: ", charspr_var_name, " with value: ", charspr);
    }
}

function get_charsnd(event_path, char)
{
    event_path = string_replace_all(event_path, CHAR_DEFAULT_EVENT_KEY, __get_char__(char).event_key);
    var event_id = fmod_studio_system_get_event(event_path);
    
    if (fmod_studio_event_description_is_valid(event_id))
        return event_path;
    else
        return -1;
}

INIT__define_characters__();