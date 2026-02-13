/// @ignore
function INIT__define_characters__()
{
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