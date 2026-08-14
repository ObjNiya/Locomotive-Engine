SINGLETON;



x = 0;
y = global.base / 4;
depth = DEPTHS.CLOSEST;

timings = array_create(4, 0);

// The timing of the "It's Show Time" sample and when the beat drops in miliseconds.

switch (escapeStartedBy.character)
{
    default:
        timings = 
        [
            760, // It's
            1092, // Show
            1622, // Time
            7647 // Beat drop
        ]
        break;
    
    case CHARS.TV_NAUTA:
        timings = 
        [
            760, // It's
            1092, // Show
            1622, // Time
            7647 // Beat drop
        ]
        break;
}

timings = __ItsShowtimeGetTimings__(obj_player.character);
txtParts = array_create(3, -1);

flashAlpha = -1;