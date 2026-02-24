if (global.points >= global.level.s_rank_points)
{
    if (global.secrets_found > SECRET_COUNT && global.laps >= 2 && global.treasure_found && global.full_combo)
        global.rank = RANKS.L;
    else
        global.rank = RANKS.S;
} 
else if (global.points >= a_rank_points)
    global.rank = RANKS.A;
else if (global.points >= b_rank_points)
    global.rank = RANKS.B;
else if (global.points >= c_rank_points)
    global.rank = RANKS.C;
else
    global.rank = RANKS.D;