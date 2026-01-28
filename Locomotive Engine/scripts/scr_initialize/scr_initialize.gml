#region Macros

// Compile configurations

#macro DEVELOPER_MODE (os_get_config() == "Developer")
#macro DEBUG_MODE (os_get_config() == "Debug")
#macro PLAYTESTER_MODE (os_get_config() == "Playtester")

// Performance configurations

#macro MAX_EFFECTS 255

#endregion

enum PLAYER_CHARACTERS
{
    DAMIAN = 1,
    TV_NAUTA = 2, // Unused
    JOSE = 3, // Unused
}

/**
 * This function will initialize all important global variables the game requires to operate.
 */
function initialize_globals()
{
    // Player Characters
    
    global.char_damian = define_character(PLAYER_CHARACTERS.DAMIAN, "_damian", "Damian");
    global.char_tv_nauta = define_character(PLAYER_CHARACTERS.TV_NAUTA, "_nauta", "TV Nauta");
    global.char_jose = define_character(PLAYER_CHARACTERS.JOSE, "_jose", "Jose");
    
    // Room transition
    
    global.spawnpoints = {
        A: obj_spawnpoint_a,
        B: obj_spawnpoint_b,
        C: obj_spawnpoint_c,
        D: obj_spawnpoint_d,
        E: obj_spawnpoint_e,
        F: obj_spawnpoint_f
    }
}

/**
 * This function will initialize all important objects the game requires to operate.
 */
function initialize_objects()
{
    if (DEBUG_MODE)
        instance_create_layer(0, 0, "Instances_1", obj_shell);
}

/**
 * This function will initialize all important global variables and objects the game requires to operate.
 */
function initialize_game()
{
    
    initialize_globals();
    initialize_objects();
}