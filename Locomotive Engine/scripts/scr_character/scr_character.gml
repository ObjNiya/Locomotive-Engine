#macro CATCH_UNDEFINED_CHAR char = __GetChar__(char) if (char == undefined) { QuickLog("The given character does not exist.") return -1 }

global.characters = [];

/// @ignore
function __GetChar__(char)
{
    if (is_struct(char))
        return char;
    else if (is_numeric(char) && array_length(global.characters) >= char && char >= 0)
        char = global.characters[char];
    
    return char;
}


/**
 * Creates a new Character to be given to be used with function that start with ```Char```.
 * @parameter {Real} index The index of the Character as an ```CHARS``` enum member.
 * @parameter {String} sprite_suffix aWith what the Characters sprites' names end with.
 * @parameter {String} event_name The name of the Character within their FMOD Studio event paths.
 * @parameter {String} display_name The characters display name in-game.
*/
function Char(index, sprite_suffix, event_name, display_name) constructor
{
    sprSuffix = sprite_suffix;
    evName = event_name;
    displayName = display_name;
    
    global.characters[index] = self;
}

__DefineChars__();