var move = -InputPressed(INPUT_VERB.LEFT) + InputPressed(INPUT_VERB.RIGHT);

if (selected)
{
    if (!sound_instance_is_valid(select_snd) && !finished)
    {
        finished = true

    }
    exit;
}

if (move != 0)
{
    cur_file += move;
    cur_file = clamp(cur_file, 1, 3);
    
    sound_instance_one_shot(sfx_damian_step, GAME_WIDTH / 2, GAME_HEIGHT / 2);
}

if (InputPressed(INPUT_VERB.JUMP) && !selected)
{
    select_snd = sound_instance_one_shot(sfx_collect_plushie);
    selected = true
}