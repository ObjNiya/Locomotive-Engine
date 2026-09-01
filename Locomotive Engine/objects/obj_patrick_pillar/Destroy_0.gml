sound_instance_one_shot(sfx_patrickpillar_destroy);
StartShowtime();

var gibs_offsets = [
    [41, 211], [92, 216], [51, 75], [64, 152], [61, 60]
];

var draw_above = [obj_player];
var i = 0;

repeat (array_length(gibs_offsets))
{
    var x_offset = gibs_offsets[i][0];
    var y_offset = gibs_offsets[i][1];
    
    with (GibsCreate(x, y + y_offset, spr_patrickpillar_gibs, playerDir, false))
    {
        x += x_offset * image_xscale;
        image_index = i;
        
        array_push(draw_above, id);
    }
    
    i++;
}

RoomflashCreate(2, 0.1, c_white, draw_above);
SaveroomAdd();