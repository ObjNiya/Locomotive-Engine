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

__define_characters__();