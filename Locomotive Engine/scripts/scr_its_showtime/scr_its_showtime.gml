#macro ITS_SHOWTIME_SEG_SPAWN_OFFSET 150
#macro ITS_SHOWTIME_SEG_STARTING_SCALE 1.6
#macro ITS_SHOWTIME_SEG_SHAKE_MAG 4

function ItsShowtimeGetTimings(player_char)
{
    switch (player_char)
    {
        default:
            return
            [
                760, // It's
                1092, // Show
                1622, // Time
                7647 // Beat drop
            ]
            
        case CHARS.TV_NAUTA:
            return
            [
                760,
                1092,
                1622,
                7647
            ]
    }
}