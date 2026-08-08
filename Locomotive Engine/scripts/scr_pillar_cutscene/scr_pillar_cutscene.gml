function StartPillarCutscene(player_ins, pillar_ins)
{
    /*if (instance_exists(obj_pillar_cutscene))
        return;
        
    with (InstanceCreate(0, 0, obj_pillar_cutscene))
    {
        playerId = player_ins;
        pillarId = pillar_ins;
        
        event_user(0);
    }*/
    
    with (InstanceCreate(0, 0, obj_seq_cutscene))
    {
        sequence = seq_pillar_destroy;
        seq_layer = "Instances_1";
        
        x = player_ins.camera.x + (GAME_WIDTH / 2);
        y = player_ins.camera.y + (GAME_HEIGHT / 2);
    }
}