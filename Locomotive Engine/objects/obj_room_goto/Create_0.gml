SINGLETON;

global.targetRoom = -1;
global.targetSpawn = noone;

// Spawn alignment enums

enum SPAWN_XALIGN
{
    LEFT = 0,
    CENTER = 2,
    RIGHT = 1,
}

enum SPAWN_YALIGN
{
    TOP = 0,
    MIDDLE = 2,
    BOTTOM = 1,
}

// User properties

spawnXAlign = fa_center;
spawnYAlign = fa_bottom;

spawnXOffset = 0;
spawnYOffset = 0;