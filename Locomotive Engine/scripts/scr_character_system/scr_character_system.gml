/// @description This function will return a character struct based on the arguments provided.
/// @parameter {Enum} id The ID of the character to define (from your characters enum).
/// @parameter {String} sprite_suffix The suffix to check for when searching for the characters sprites (e.x _damian).
/// @parameter {String} name The actual name of the character (e.x Damian).
function define_character(id, sprite_suffix, name)
{
    return 
    {
        id,
        sprite_suffix,
        name
    }
}

function char_get_sprite(sprite_string, char_struct)
{
    return asset_get_index(sprite_string + char_struct.sprite_suffix);
}

function char_cache_sprite_variables(char_struct)
{
    for (var i = 0; sprite_exists(i); i++)
    {
        var sprite_name = sprite_get_name(i);
        
        if (!string_ends_with(sprite_name, char_struct.sprite_suffix))
            continue;
                
        sprite_name = string_trim_end(sprite_name, [char_struct.sprite_suffix]);
        
        variable_instance_set(id, sprite_name, i);
        
        trace("Creating charspr variable \"", sprite_name, "\", With value: ", sprite_get_name(i));
    }
}