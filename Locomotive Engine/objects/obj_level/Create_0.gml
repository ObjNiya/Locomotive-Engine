SINGLETON;

with (global)
{
    showtimeTimer.Stop();
    comboTimer.Stop();
    
    rank = RANKS.D;
    points = 0;
    combo = 0;
    secrets_found = 0;
    laps = 0;
    treasure_found = false;
    
    showtimeTimer.max_time = level.showtimeTime;
}

a_rank_points = global.level.sRankPoints / 2;
b_rank_points = a_rank_points / 2;
c_rank_points = b_rank_points / 2;