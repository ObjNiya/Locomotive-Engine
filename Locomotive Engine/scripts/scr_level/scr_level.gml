global.levels = [];

function Lvl(starting_room, showtime_time, s_rank_requirement, titlecard_index, has_secrets_and_treasure = true) constructor
{
    rm = starting_room;
    self.showtime_time = showtime_time;
    s_rank_points = s_rank_requirement;
    self.titlecard_index = titlecard_index;
    has_collectables = has_secrets_and_treasure;
}

function lvl_define(id, starting_room, showtime_time, s_rank_requirement, titlecard_index, has_secrets_and_treasure = true)
{
    array_insert(global.levels, id, new Lvl(starting_room, showtime_time, s_rank_requirement, titlecard_index, has_secrets_and_treasure));
}

INIT__define_levels__();