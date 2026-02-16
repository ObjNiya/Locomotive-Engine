/// @ignore
function __define_characters__()
{
    #macro CHAR_DEFAULT_SPRITE_SUFFIX "_damian"
    #macro CHAR_DEFAULT_EVENT_NAME "Damian"
    
    #macro MAX_CHARACTERS 8
    
    enum CHARS
    {
        // Player
        
        DAMIAN = 0,
        TV_NAUTA = 1,
        PEPPINO = 3,
        NOISE = 4,
        
        // TV GUI
        
        DAMIAN_TV = 5,
        TV_NAUTA_TV = 6,
        PEPPINO_TV = 7,
        NOISE_TV = 8,
    }
    
    // Player
    
    char_define(CHARS.DAMIAN, "_damian", "Damian", "Loco Damian");
    char_define(CHARS.DAMIAN_TV, "_damian_tv", "Damian", "Loco Damian");
    char_define(CHARS.PEPPINO, "_peppino", "Peppino", "Peppino");
    char_define(CHARS.NOISE, "_noise", "Noise", "The Noise");
    
    // TV GUI
    
    char_define(CHARS.TV_NAUTA, "_nauta", "TV Nauta", "TV Nauta");
    char_define(CHARS.TV_NAUTA_TV, "_nauta_tv", "TV Nauta", "TV Nauta");
}