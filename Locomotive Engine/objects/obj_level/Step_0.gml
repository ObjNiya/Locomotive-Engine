with (global) {
    if (points >= level.s_rank_points)
    {
        if (secrets_found > SECRET_COUNT && laps >= 2 && treasure_found && full_combo)
            rank = RANKS.L;
        else
            rank = RANKS.S;
    } 
    else if (points >= other.a_rank_points)
        rank = RANKS.A;
    else if (points >= other.b_rank_points)
        rank = RANKS.B;
    else if (points >= other.c_rank_points)
        rank = RANKS.C;
    else
        rank = RANKS.D;
}