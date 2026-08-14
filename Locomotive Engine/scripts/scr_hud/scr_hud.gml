global.hudInstances = [];

function UnloadHUD()
{
    array_foreach(global.hudInstances, function(ins, index) {
        if (annie_are_you_ok(ins))
            kill(ins);
    });
}

function LoadHUD(hud_to_load)
{
    UnloadHUD();
    
    var rm_ins = room_get_info(hud_to_load, false, true, false, false, false, false).instances;
    
    array_foreach(rm_ins, function(ins_struct, index) {
        var obj_to_spawn = AssetGetIndexFast(ins_struct.object_index, asset_object);
        
        with (InstanceCreate(ins_struct.x, ins_struct.y, obj_to_spawn))
        {
            image_xscale = ins_struct.xscale;
            image_yscale = ins_struct.yscale;
            image_angle = ins_struct.angle;
            image_index = ins_struct.image_index;
            image_speed = ins_struct.image_speed;
            image_blend = ins_struct.color;
            
            ins_struct.pre_creation_code();
            ins_struct.creation_code();
            
            array_push(global.hudInstances, id);
        }
    });
}