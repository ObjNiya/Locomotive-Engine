#region Macros

// Screen configurations

#macro GAME_WIDTH 960
#macro GAME_HEIGHT 540

// Compile configurations

#macro DEVELOPER_MODE (os_get_config() == "Developer")
#macro DEBUG_MODE (os_get_config() == "Debug")
#macro PLAYTESTER_MODE (os_get_config() == "Playtester")

// Performance configurations

#macro MAX_EFFECTS 255

// Bugfix configurations

#macro FIX_INSTATURN false

// Game start configurations

#macro STARTING_OBJECTS [obj_fmod_studio, obj_screen, obj_camera_system, obj_room_goto]
#macro STARTING_OBJECTS_COUNT 4

// Code shortcuts

#macro SINGLETON if (instance_number(object_index) > 1) { instance_destroy(); }

#endregion

enum DEPTHS
{
    FRONT = -50,
    
    CLOSEST = -30,
    CLOSER = -20,
    CLOSE = -10,
    
    MIDDLE = 0,
    
    FAR = 10,
    FARTHER = 20,
    FARTHEST = 30,
    
    BACK = 50,
}

/**
 * This function will initialize all important global variables the game requires to operate.
 */
function initialize_globals()
{
    // Font defintions
    
    global.bigfont = font_add_sprite_ext(spr_bigfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¿?.:1234567890ÁÉÍÓÚ", 1, 0);
    global.mediumfont = font_add_sprite_ext(spr_mediumfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 2);
    global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.,_1234567890:?", 1, 0);    
    global.minifont = font_add_sprite_ext(spr_minifont, "0123456789:.", 1, 0);

    global.pointsbookfont = font_add_sprite_ext(spr_pointsbook_font, "1234567890", 1, -16);
    global.pointsnumberfont = font_add_sprite_ext(spr_pointsnumberfont, "1234567890", 1, 0);
    global.combofont = font_add_sprite_ext(spr_combobar_font, "0123456789", 1, 0);

    // Room transition
    // Level system
    
    global.level = pointer_null;

    // Other definitions

    global.saveroom = ds_map_create();

    global.combat_objects = [];
}

/**
 * This function will initialize all important objects the game requires to operate.
 */
function initialize_objects()
{
    var objects = STARTING_OBJECTS;
    
    for (var i = 0; i < STARTING_OBJECTS_COUNT; i++)
        instance_create(0, 0, objects[i]);
    
    if (DEBUG_MODE)
        instance_create_layer(0, 0, "Instances_1", obj_shell);
}

/**
 * This function will initialize all important global variables and objects the game requires to operate.
 */
function initialize_game()
{
    pal_swap_init_system(shd_pal_swapper, shd_pal_html_sprite, shd_pal_html_surface);
    initialize_globals();
    initialize_objects();
}