function position_sounds(sound_array)
{
    for (var i = 0; i < array_length(sound_array); i++)
        sound_instance_move(sound_array[i], x, y);
}