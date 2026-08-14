/// @ignore
function __DefineChars__()
{
    #macro CHAR_DEFAULT_SPRITE_SUFFIX "_damian"
    #macro CHAR_DEFAULT_EVENT_NAME "Damian"
    
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
    
    new Char(CHARS.DAMIAN, "_damian", "Damian", "Loco Damian");
    new Char(CHARS.TV_NAUTA, "_nauta", "TV Nauta", "TV Nauta");
    
    // TV GUI
    
    new Char(CHARS.DAMIAN_TV, "_damian_tv", "Damian", "Loco Damian"); 
    new Char(CHARS.TV_NAUTA_TV, "_nauta_tv", "TV Nauta", "TV Nauta");
}