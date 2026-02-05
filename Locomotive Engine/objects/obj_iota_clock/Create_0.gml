event_inherited();

/////////////////////////////
// Initialize momentary inputs
/////////////////////////////
 
momentary_inputs = [
    ["menu_up_pressed",        INPUT_VERB.MENU_UP],
    ["menu_up_released",       INPUT_VERB.MENU_UP],

    ["menu_down_pressed",      INPUT_VERB.MENU_DOWN],
    ["menu_down_released",     INPUT_VERB.MENU_DOWN],

    ["menu_left_pressed",      INPUT_VERB.MENU_LEFT],
    ["menu_left_released",     INPUT_VERB.MENU_LEFT],

    ["menu_right_pressed",     INPUT_VERB.MENU_RIGHT],
    ["menu_right_released",    INPUT_VERB.MENU_RIGHT],

    ["menu_accept_pressed",    INPUT_VERB.MENU_ACCEPT],
    ["menu_accept_released",   INPUT_VERB.MENU_ACCEPT],

    ["menu_back_pressed",      INPUT_VERB.MENU_BACK],
    ["menu_back_released",     INPUT_VERB.MENU_BACK],

    ["menu_quit_pressed",      INPUT_VERB.MENU_QUIT],
    ["menu_quit_released",     INPUT_VERB.MENU_QUIT],

    ["pause_pressed",          INPUT_VERB.PAUSE],
    ["pause_released",         INPUT_VERB.PAUSE],

    ["up_pressed",             INPUT_VERB.UP],
    ["up_released",            INPUT_VERB.UP],

    ["down_pressed",           INPUT_VERB.DOWN],
    ["down_released",          INPUT_VERB.DOWN],

    ["left_pressed",           INPUT_VERB.LEFT],
    ["left_released",          INPUT_VERB.LEFT],

    ["right_pressed",          INPUT_VERB.RIGHT],
    ["right_released",         INPUT_VERB.RIGHT],

    ["jump_pressed",           INPUT_VERB.JUMP],
    ["jump_released",          INPUT_VERB.JUMP],

    ["grabdash_pressed",       INPUT_VERB.GRABDASH],
    ["grabdash_released",      INPUT_VERB.GRABDASH],

    ["taunt_pressed",          INPUT_VERB.TAUNT],
    ["taunt_released",         INPUT_VERB.TAUNT],

    ["machrun_pressed",        INPUT_VERB.MACHRUN],
    ["machrun_released",       INPUT_VERB.MACHRUN],

    ["superjump_pressed",      INPUT_VERB.SUPERJUMP],
    ["superjump_released",     INPUT_VERB.SUPERJUMP],

    ["groundpound_pressed",    INPUT_VERB.GROUNDPOUND],
    ["groundpound_released",   INPUT_VERB.GROUNDPOUND],
];

momentary_input_count = array_length(momentary_inputs);

for (var i = 0; i < momentary_input_count; i++)
    global.clock.DefineInputMomentary(momentary_inputs[i][0], false);
