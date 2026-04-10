function create_pillar_cutscene(player_ins, pillar_ins)
{
    with (instance_create(0, 0, obj_pillar_cutscene))
    {
        camera = player_ins.camera;
        
        player_spr.set_sprite(player_ins.sprite_index);
        player_spr.x = player_ins.x;
        player_spr.y = player_ins.y;
        
        sprite_index = player_ins.spr_pillarpunch;
        
        deactivate_game(true);
    }
}