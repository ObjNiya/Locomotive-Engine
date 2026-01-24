#macro DEVELOPER_MODE (os_get_config() == "Developer")
#macro DEBUG_MODE (os_get_config() == "Debug")
#macro PLAYTESTER_MODE (os_get_config() == "Playtester")

/// @description This function initializes the enums for the game.
function initialize_enums()
{
    enum PLAYER_CHARACTERS
    {
        DAMIAN = 1,
        TV_NAUTA = 2, // Unused
        JOSE = 3 // Unused
    }
}

/// @description This function initializes the global scope variables for the game.
function initialize_globals()
{
    #region Player Characters
    
    global.char_damian = define_character(PLAYER_CHARACTERS.DAMIAN, "_damian", "Damian");
    global.char_tv_nauta = define_character(PLAYER_CHARACTERS.TV_NAUTA, "_nauta", "TV Nauta");
    global.char_jose = define_character(PLAYER_CHARACTERS.JOSE, "_jose", "Jose");
    
    #endregion
}

/// @description This function initializes important objects for the game.
function initialize_objects()
{
    if (DEBUG_MODE)
        instance_create_layer(0, 0, "Instances", obj_shell);
}

/// @description This function initializes everything for the game.
function initialize_game()
{
    initialize_enums();
    initialize_globals();
    initialize_objects();
}