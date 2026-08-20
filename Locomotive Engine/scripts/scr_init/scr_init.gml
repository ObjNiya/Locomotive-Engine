/**
 * Compile Configurations
 */

#macro IDE_BUILD (GM_build_type == "run")
#macro DBG_CONSOLE true

/**
 * Enable/Disable bugs from base Pizza Tower
 */

#macro FIX_INSTATURN false // Toggles being able to instantly turn and maintaing all speed.
#macro FIX_HIGHJUMP false // Toggles being able to high jump by pressing several keys on the same frame.
#macro FIX_POPUP false // Toggles climbing to the end of a wall suspending you in the air for a moment.
#macro FIX_MISSING_PARRY_HITSTUN true // Toggles missing parry hitstun on the player.

/**
 * Enable/Disable minor Enhancements
 */

#macro RANDOMIZE_COLLECTABLE_FRAME_OFFSET true // Toggles collectables having a random starting frame offset.
#macro ANALOG_CONTROLS true // Toggles analog controls for more of the players movement.

/**
 * Code Shortcuts
 */

#macro SINGLETON if (instance_number(object_index) > 1) { kill myself }
#macro LEVEL_HUD_ROOM_END if (!annie_are_you_ok(obj_level)) { kill myself }

/**
 * Bullshit
 */

#macro ts self
#macro bro other
#macro annie_are_you_ok instance_exists
#macro maybe choose(false, true)
#macro larp with
#macro theresnolimittothelarp larp (all)
#macro kill instance_destroy
#macro myself ()
#macro yourself (other)

/**
 * Enums
 */

enum RANKS 
{
    D = 0,
    C = 1,
    B = 2,
    A = 3,
    S = 4,
    L = 5,
}


/**
 * This function will initialize all important global variables the game requires to operate.
 */
function InitGlobals()
{
    with (global)
    {
        // Internal global variables
        
        __ImportantObjs__ = [obj_general_manager, obj_layer_manager, obj_fmod_studio, obj_screensizer, obj_room_goto, obj_room_events, obj_camera_manager, obj_hud_timer, obj_parallax_manager, __InputUpdateController];
        
        // Secret Tiles TODO: MOVE
        
        ScrtTsCircleX = 0;
        ScrtTsCircleY = 0;
        ScrtTsCircleRadius = 0;
        
        // Button Prompt image index map
        
        KeybrdSpPromptsMap = ds_map_create();
        KeybrdSpPromptsMap[? "shift"] = 0;
        KeybrdSpPromptsMap[? "ctrl"] = 1;
        KeybrdSpPromptsMap[? "_"] = 2;
        KeybrdSpPromptsMap[? "arrow up"] = 3;
        KeybrdSpPromptsMap[? "arrow down"] = 4;
        KeybrdSpPromptsMap[? "arrow left"] = 5;
        KeybrdSpPromptsMap[? "arrow right"] = 6;
        
        // Font defintions
        
        fntSign = font_add_sprite_ext(spr_signfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", true, 2);
        fntBig = font_add_sprite_ext(spr_bigfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¿?.:1234567890ÁÉÍÓÚ", 1, 0);
        fntMedium = font_add_sprite_ext(spr_mediumfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 2);
        fntSmall = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.,_1234567890:?", 1, 0);    
    
        fntPointsbook = font_add_sprite_ext(spr_pointsbook_font, "1234567890", 1, -16);
        fntPointsnum = font_add_sprite_ext(spr_pointsnumberfont, "1234567890", 1, 0);
        fntCombo = font_add_sprite_ext(spr_combobar_font, "0123456789", 1, 0);
    
        // Level data
    
        level = -1;
        
        showtimeTimerFunc = function()
        {
            InstanceCreate(obj_player.x, obj_player.y, obj_marx);
        }
        
        showtimeTimer = time_source_create(time_source_game, 60, time_source_units_seconds, showtimeTimerFunc);
        
        comboTimerFunc = function()
        {
            global.combo = 0;
        }
        comboTimer = time_source_create(time_source_game, 6.75, time_source_units_seconds, comboTimerFunc);
            
        plushies = {
            waddledoo: false,
            koopa: false,
            squash: false,
            cappy: false,
            wario: false
        }
     
        rank = RANKS.D;
        points = 0;
        combo = 0;
        secrets_found = 0;
        laps = 0;
        treasure_found = false;
        fullCombo = false;
    
        // Other definitions

        saveroom = ds_map_create();
        viewport_taken = array_create(8, false);
    }   
}


/**
 * This function will initialize all important objects the game requires to operate.
 */
function InitObjects()
{
    array_foreach(global.__ImportantObjs__, function(obj, index) {
        if (!instance_exists(obj) && obj != __InputUpdateController)
            InstanceCreate(0, 0, obj);
    });
    
    if (DBG_CONSOLE)
        instance_create_layer(0, 0, "Instances_1", obj_shell);
}


/**
 * This function will initialize all important global variables and objects the game requires to operate.
 */
function InitGame()
{
    pal_swap_init_system(shd_pal_swapper, shd_pal_html_sprite, shd_pal_html_surface);
    InitGlobals();
    //InitObjects();
}