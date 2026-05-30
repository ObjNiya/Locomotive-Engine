event_inherited();

seq_element = -1;

if (!sequence_exists(sequence))
{
    Log(obj_seq_cutscene, LOG_TYPES.ERROR, "The given sequence is ", sequence, " which does not exist. Cancelling the cutscene and resuming gameplay if paused...");
    instance_destroy();
    
    exit;
}

seq_element = layer_sequence_create(seq_layer, x, y, sequence);