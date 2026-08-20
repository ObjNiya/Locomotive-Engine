SINGLETON;

with (global)
{
    time_source_stop(showtimeTimer);
    time_source_stop(comboTimer);
    time_source_reconfigure(showtimeTimer, level.showtimeTime, time_source_units_seconds, showtimeTimerFunc);
    
    rank = RANKS.D;
    points = 0;
    combo = 0;
    secrets_found = 0;
    laps = 0;
    treasure_found = false;
}

a_rank_points = global.level.sRankPoints / 2;
b_rank_points = a_rank_points / 2;
c_rank_points = b_rank_points / 2;