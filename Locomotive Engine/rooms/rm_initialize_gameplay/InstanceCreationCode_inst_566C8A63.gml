step_func = function()
{
    var headpos = layer_sequence_get_headpos(seq_element);
    
    if (headpos == 430 && !instance_exists(obj_newfile_cut_whitefade))
        InstanceCreate(0, 0, obj_newfile_cut_whitefade);
    
    if (headpos == 550 && !instance_exists(obj_roomtrans_fade))
    {
        with (trans_room(obj_roomtrans_fade))
            end_lag = 6;
    }    
}