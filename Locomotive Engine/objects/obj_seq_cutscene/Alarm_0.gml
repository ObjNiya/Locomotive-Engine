seqLayer = layer_create(DEPTHS.FRONT);
seqElem = layer_sequence_create(seqLayer, 0, 0, sequence);

layer_script_begin(seqLayer, function() {
    if (event_type != ev_draw || event_number != ev_draw_normal)
        return;
    
    if (!surface_exists(seqLayerSurf))
        seqLayerSurf = surface_create(room_width, room_height);
    
    if (surface_get_target() != seqLayerSurf) 
    {
        surface_set_target(seqLayerSurf);
        draw_clear_alpha(c_black, 0);
    }
});

layer_script_end(seqLayer, function() {
    if (event_type != ev_draw || event_number != ev_draw_normal)
        return;
    
    if (surface_get_target() == seqLayerSurf)
        surface_reset_target();
});

event_inherited();