#macro CATCH_UNDEFINED_LVL lvl = __get_lvl__(lvl) if (lvl == undefined) { trace("The given level does not exist.") return -1 }


global.levels = [];

/**
 * This constructor will return a Lvl Struct, containing all the necessary data for a level.
 * @parameter {Asset.GMRoom} starting_room The first room of the level.
 * @parameter {Real} showtime_time The time the showtime timer starts at (in seconds).
 * @parameter {Real} s_rank_requirement How many points are required to get an s rank in the level.
 * @parameter {Real} titlecard_index The image index of the titlecards sprite that displays upon entering a level.
 * @parameter {String} titlecard_music The FMOD Studio event path of the titlecards music that plays upon entering a level.
 * @parameter {Bool} has_secrets_and_treasure (OPTIONAL) Whether or not the level contains secrets and treasure to be collected.
 */
function Lvl(starting_room, showtime_time, s_rank_requirement, titlecard_index, titlecard_music, has_secrets_and_treasure = true) constructor
{
    starting_rm = starting_room;
    self.showtime_time = showtime_time;
    s_rank_points = s_rank_requirement; 
    title_index = titlecard_index;
    title_music = titlecard_music;
    has_collects = has_secrets_and_treasure;
}

/**
 * This function will define a level using the Lvl constructor and insert it into the global levels array.
 * @parameter {Real} index Which index of the levels array to insert the level into.
 * @parameter {Asset.GMRoom} starting_room The first room of the level.
 * @parameter {Real} showtime_time The time the showtime timer starts at (in seconds).
 * @parameter {Real} s_rank_requirement How many points are required to get an s rank in the level.
 * @parameter {Real} titlecard_index The image index of the titlecards sprite that displays upon entering a level.
 * @parameter {String} titlecard_music The FMOD Studio event path of the titlecards music that plays upon entering a level.
 * @parameter {Bool} has_secrets_and_treasure (OPTIONAL) Whether or not the level contains secrets and treasure to be collected.
 */
function lvl_define(index, starting_room, showtime_time, s_rank_requirement, titlecard_index, titlecard_music, has_secrets_and_treasure = true)
{
    array_insert(global.levels, index, new Lvl(starting_room, showtime_time, s_rank_requirement, titlecard_index, titlecard_music, has_secrets_and_treasure));
}

/// @ignore
function __get_lvl__(lvl)
{
    if (is_struct(lvl))
        return lvl;
    else if (is_numeric(lvl) && array_length(global.levels) >= lvl && lvl >= 0)
        lvl = global.levels[lvl];
    
    return lvl;
}

__define_levels__();