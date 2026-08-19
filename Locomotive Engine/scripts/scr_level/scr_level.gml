#macro CATCH_UNDEFINED_LVL lvl = __LvlGet__(lvl) if (lvl == undefined) { return -1 }

global.levels = [];

/**
 * Creates a new Level to be given to any functions that start with ```Level```.
 * @parameter {Real} index The index of the Level as an ```LVLS``` enum member.
 * @parameter {Asset.GMRoom} first_room The room the level starts in.
 * @parameter {Real} showtime_time The amount of time the levels Showtime Timer starts at in seconds.
 * @parameter {Real} s_rank_points How many points are required to achieve the levels S Rank.
 * @parameter {Bool} has_secrets_and_treasure Whether or not the level has secrets and treasures to be collected.
 */
function Lvl(index, first_room, showtime_time, s_rank_points, has_secrets_and_treasure = true) constructor 
{
    firstRm = first_room;
    showtimeTime = showtime_time;
    sRankPoints = s_rank_points;
    hasCollects = has_secrets_and_treasure;
    
    
    /**
     * Sets the titlecard of the level and its music.
     * @parameter {Real} titlecard_index The index of the titlecard to set.
     * @parameter {String} titlecard_music The FMOD Studio event path to the titlecard music to set.
     */
    static SetTitlecard = function(titlecard_index, titlecard_music)
    {
        titlecardIndex = titlecard_index;
        titlecardMusic = titlecard_music;
        
        return self;
    }
    
    /**
     * Sets the TV background color of the players TV HUD and the music.
     * @parameter {Constant.Color} tvbg_color The TV background color to set.
     * @parameter {String} music The FMOD Studio event path to the music to set.
     */
    static SetVisuals = function(tvbg_color, music)
    {
        tvbgColor = tvbg_color;
        self.music = music;
        
        return self;
    }
    
    SetTitlecard(0, mu_hallway_title);
    SetVisuals(c_black, mu_hallway);
    
    global.levels[index] = self;
    
    return self;
}

/// @ignore
function __LvlGet__(lvl)
{
    if (is_struct(lvl))
        return lvl;
    else if (is_numeric(lvl) && array_length(global.levels) >= lvl && lvl >= 0)
        lvl = global.levels[lvl];
    
    return lvl;
}

___LvlsDefine__();