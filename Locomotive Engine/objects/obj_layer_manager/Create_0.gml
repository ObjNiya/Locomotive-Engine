// TODO: Move functionality and remove
layers = [];

// Secret Tiles

scrt_ts_pos_uniform = shader_get_uniform(shd_secret_tiles, "u_vCirclePos");
scrt_ts_radius_uniform = shader_get_uniform(shd_secret_tiles, "u_fCircleRadius");
scrt_ts_rm_size_uniform = shader_get_uniform(shd_secret_tiles, "u_fRoomSize");

scrt_ts_circle_rad = new Tween(ac_scrt_ts_circle_rad, "open", 0.2, time_source_units_seconds);
scrt_ts_circle_rad.set_animcurve_out_channel("close");

// Debug

collision_objs = [
    obj_solid,
    obj_slope,
    obj_platform,
    obj_sidePlatform,
    obj_slopePlatform,
    obj_ladder,
    
    obj_point_of_interest, 
    obj_secret_tiles, 
    obj_block_metal_tiles, 
    obj_block_tiles_big, 
    obj_block_tiles,
    
    obj_spawn_a, 
    obj_spawn_b,
    obj_spawn_c,
    obj_spawn_d,
    obj_spawn_e, 
    obj_spawn_f
];

show_collisions = false;

set_collision_visible = function(visible)
{
    show_collisions = visible;
    
    var collision_count = array_length(collision_objs);
    var i = 0;
    
    repeat (collision_count)
    {
        var obj = collision_objs[i];
        
        with (obj)
        {
            if (object_index == obj)
                self.visible = other.show_collisions;
        }
        
        i++;
    }
}