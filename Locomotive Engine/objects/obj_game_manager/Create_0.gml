SINGLETON;

scrtTsCircleRadius = 0;

scrtTilemaps = [];
collisionVisible = false;

/// @ignore
function ShowCollisions(visible)
{
    static collision_objs = [
        obj_solid,
        obj_slope,
        obj_platform,
        obj_sidePlatform,
        obj_slopePlatform,
        obj_ladder,
        
        obj_point_of_interest, 
        
        obj_spawn_a, 
        obj_spawn_b,
        obj_spawn_c,
        obj_spawn_d,
        obj_spawn_e, 
        obj_spawn_f
    ];
    
    collisionVisible = visible;
    
    array_foreach(collision_objs, function(obj, index) {
        with (obj)
        {
            if (object_index == obj)
                visible = obj_game_manager.collisionVisible;
        }
    });
}

ShowCollisions(false);