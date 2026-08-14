if (transitioned)
    exit;

if (!RoomQueue(targetRoom, targetSpawn))
    exit;

SpawnSetAlign(spawnXAlign, spawnYAlign);

var spawn_offsets = GetSpawnOffset(other);
SpawnSetOffset(spawn_offsets[0], spawn_offsets[1]);

if (RoomTrans(obj_roomtrans_fade))
    transitioned = true;