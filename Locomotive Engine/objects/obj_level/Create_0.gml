SINGLETON;

with (global)
{
    showtime_timer.stop();
    combo_timer.stop();
    
    rank = RANKS.D;
    points = 0;
    combo = 0;
    secrets_found = 0;
    laps = 0;
    treasure_found = false;
    
    showtime_timer.max_time = level.showtime_time;
}

a_rank_points = global.level.s_rank_points / 2;
b_rank_points = a_rank_points / 2;
c_rank_points = b_rank_points / 2;