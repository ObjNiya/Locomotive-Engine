/// @ignore
function __define_characters__()
{
    #macro CHAR_DEFAULT_SPRITE_SUFFIX "_damian"
    #macro CHAR_DEFAULT_EVENT_NAME "Damian"
    
    #macro MAX_CHARACTERS 3
    
    enum CHARS
    {
        // Player
        
        DAMIAN = 0,
        TV_NAUTA = 1,
        
        // TV GUI
        
        DAMIAN_TV = 2,
        TV_NAUTA_TV = 3,
    }
    
    char_define(CHARS.DAMIAN, "_damian", "Damian", "Loco Damian");
    char_define(CHARS.DAMIAN_TV, "_damian_tv", "Damian", "Loco Damian");
    char_define(CHARS.TV_NAUTA, "_nauta", "TV Nauta", "TV Nauta");
    char_define(CHARS.TV_NAUTA_TV, "_nauta_tv", "TV Nauta", "TV Nauta");
}