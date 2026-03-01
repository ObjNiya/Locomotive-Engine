event_inherited();

if (layer_sequence_is_finished(seq_element))
{
    instance_destroy();
    exit;
}

layer_sequence_x(seq_element, x);
layer_sequence_y(seq_element, y);
layer_sequence_xscale(seq_element, image_xscale);
layer_sequence_yscale(seq_element, image_yscale);
layer_sequence_angle(seq_element, image_angle);