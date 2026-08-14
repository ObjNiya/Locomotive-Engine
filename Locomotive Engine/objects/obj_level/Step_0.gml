with (global) {
    if (points >= level.sRankPoints)
    {
        if (secrets_found > 3 && laps >= 2 && treasure_found && fullCombo)
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