event_inherited();

seqElem = -1;
seqLayer = -1;
seqLayerSurf = -1;

setCutscenePos = function(pos)
{
    layer_sequence_headpos(seqElem, pos);
}

getCutsceneLen = function()
{
    return layer_sequence_get_length(seqElem);
}

getCutscenePos = function()
{
    return layer_sequence_get_headpos(seqElem);
}

performSkip = function(skip_frame)
{
    layer_sequence_headpos(seqElem, skip_frame);
}