step_func = function()
{
    if (layer_sequence_get_headpos(seq_element) < 430 || instance_exists(obj_fade) || instance_exists(obj_roomtrans_fade))
        exit;

    with (instance_create(0, 0, obj_fade))
    {
        end_lag = 114;
        
        finish_func = function()
        {
            with (trans_room(obj_roomtrans_fade))
            {
                depth = other.depth - 1;
                end_lag = 6;
            }
        }
    }    
}

skip_func = function()
{
    with (obj_seq_cutscene)
        layer_sequence_headpos(seq_element, 430);
}