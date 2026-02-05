function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        MENU_UP,
        MENU_DOWN,
        MENU_LEFT,
        MENU_RIGHT,
        MENU_ACCEPT,
        MENU_BACK,
        MENU_QUIT,
        PAUSE,
        
        UP,
        DOWN,
        LEFT,
        RIGHT,
        JUMP,
        GRABDASH,
        TAUNT,
        MACHRUN,
        SUPERJUMP,
        GROUNDPOUND,
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        MENU_NAVIGATION,
        NAVIGATION,
    }
    
    if (not INPUT_ON_SWITCH)
    {
        InputDefineVerb(INPUT_VERB.MENU_UP,      "menu_up",          vk_up,      [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.MENU_DOWN,    "menu_down",        vk_down,    [ gp_axislv, gp_padd]);
        InputDefineVerb(INPUT_VERB.MENU_LEFT,    "menu_left",        vk_left,    [-gp_axislh, gp_padl]);
        InputDefineVerb(INPUT_VERB.MENU_RIGHT,   "menu_right",       vk_right,   [ gp_axislh, gp_padr]);
        InputDefineVerb(INPUT_VERB.MENU_ACCEPT,  "menu_accept",      "Z",        gp_face1);
        InputDefineVerb(INPUT_VERB.MENU_BACK,    "menu_back",        "X",        gp_face2);
        InputDefineVerb(INPUT_VERB.MENU_QUIT,    "menu_quit",        "C",        gp_face3);
        InputDefineVerb(INPUT_VERB.PAUSE,        "pause",            vk_escape,  gp_start);
        
        
        InputDefineVerb(INPUT_VERB.UP,      "up",          vk_up,      [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.DOWN,    "down",        vk_down,    [ gp_axislv, gp_padd]);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",        vk_left,    [-gp_axislh, gp_padl]);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",       vk_right,   [ gp_axislh, gp_padr]);
        InputDefineVerb(INPUT_VERB.JUMP,    "jump",        "Z",        gp_face1);
        InputDefineVerb(INPUT_VERB.GRABDASH,"grabdash",    "X",        gp_face3);
        InputDefineVerb(INPUT_VERB.TAUNT,   "taunt",       "C",        gp_face4);
        InputDefineVerb(INPUT_VERB.MACHRUN, "machrun",     vk_shift,   [gp_shoulderr, gp_shoulderrb]);
        InputDefineVerb(INPUT_VERB.SUPERJUMP, "superjump", vk_up,      [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.GROUNDPOUND, "groundpound", vk_down, [gp_axislv, gp_padd]);
        
    }
    else //Flip A/B over on Switch
    {
        InputDefineVerb(INPUT_VERB.MENU_UP,      "menu_up",          vk_up,      [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.MENU_DOWN,    "menu_down",        vk_down,    [ gp_axislv, gp_padd]);
        InputDefineVerb(INPUT_VERB.MENU_LEFT,    "menu_left",        vk_left,    [-gp_axislh, gp_padl]);
        InputDefineVerb(INPUT_VERB.MENU_RIGHT,   "menu_right",       vk_right,   [ gp_axislh, gp_padr]);
        InputDefineVerb(INPUT_VERB.MENU_ACCEPT,  "menu_accept",      "Z",        gp_face2);
        InputDefineVerb(INPUT_VERB.MENU_BACK,    "menu_back",        "X",        gp_face1);
        InputDefineVerb(INPUT_VERB.MENU_QUIT,    "menu_quit",        "C",        gp_face4);
        InputDefineVerb(INPUT_VERB.PAUSE,        "pause",            vk_escape,  gp_start);
        
        
        InputDefineVerb(INPUT_VERB.UP,      "up",          vk_up,      [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.DOWN,    "down",        vk_down,    [ gp_axislv, gp_padd]);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",        vk_left,    [-gp_axislh, gp_padl]);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",       vk_right,   [ gp_axislh, gp_padr]);
        InputDefineVerb(INPUT_VERB.JUMP,    "jump",        "Z",        gp_face2);
        InputDefineVerb(INPUT_VERB.GRABDASH,"grabdash",    "X",        gp_face4);
        InputDefineVerb(INPUT_VERB.TAUNT,   "taunt",       "C",        gp_face3);
        InputDefineVerb(INPUT_VERB.MACHRUN, "machrun",     vk_shift,   [gp_shoulderr, gp_shoulderrb]);
        InputDefineVerb(INPUT_VERB.SUPERJUMP, "superjump", vk_up,      [-gp_axislv, gp_padu]);
        InputDefineVerb(INPUT_VERB.GROUNDPOUND, "groundpound", vk_down, [gp_axislv, gp_padd]);
    }
    
    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.MENU_NAVIGATION, INPUT_VERB.MENU_UP, INPUT_VERB.MENU_RIGHT, INPUT_VERB.MENU_DOWN, INPUT_VERB.MENU_LEFT);
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
