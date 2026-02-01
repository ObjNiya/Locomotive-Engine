/**
 * This function will return the given arguments into a struct which we'll be calling a 'Char Struct'.
 * This struct can be used on various functions with the ```char_``` prefix for the function to fulfill it's task.
 * @parameter {Real} id The ID of the character as a number for you to do your own checks with, it's highly recommended to set this to an enumerator value for easier tracking.
 * @parameter {String} sprite_suffix The suffix of the characters' sprites, which are meant for the ```char_get_sprite``` function so it can find your characters' sprites.
 * @parameter {String} name The actual name of your character to be displayed in game.
 * @returns {Struct<>}
 */
function define_character(id, sprite_suffix, name)
{
    return 
    {
        id,
        sprite_suffix,
        name
    }
}

/**
 * This function will return the index of the sprite that starts with the given prefix and ends with the Char Struct's sprite suffix.
 * @parameter {String} sprite_prefix The prefix of the sprite to get, in other words the sprite name without the Char Struct's sprite suffix.
 * @parameter {Struct} char_struct The Char Struct to get the sprite suffix from.
 * @returns {Asset.GMSprite}
 */
function char_get_sprite(sprite_prefix, char_struct)
{
    return asset_get_index(sprite_prefix + char_struct.sprite_suffix);
}

/**
 * This function will loop trough **Every** sprite in the game in an attempt to find all sprites that end with the given Char Struct's sprite suffix,
 * creating the ones it finds as a instance variable on the current instance with the name of the sprite minus the Char Struct's sprite suffix.
 * Since this can be a time consuming operation it should only be ran once to find a characters' sprites.
 * @parameter {Struct} char_struct The char struct to get the sprite suffix from, which will be used to identify sprites with said suffix.
 */
function char_cache_sprite_variables(char_struct)
{
    for (var i = 0; sprite_exists(i); i++)
    {
        var sprite_name = sprite_get_name(i);
        
        if (!string_ends_with(sprite_name, char_struct.sprite_suffix))
            continue;
                
        sprite_name = string_trim_end(sprite_name, [char_struct.sprite_suffix]);
        
        variable_instance_set(id, sprite_name, i);
        
        //trace("Creating charspr variable \"", sprite_name, "\", With value: ", sprite_get_name(i));
    }
}