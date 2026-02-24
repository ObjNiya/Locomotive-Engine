function create_skip_prompt(verb, func, x = 16, y = GAME_HEIGHT - 48)
{
    if (!InputPressed(verb) || instance_exists(obj_skip_prompt))
        return false;
    
    with (instance_create(x, y, obj_skip_prompt))
    {
        input_verb = verb;
        verb_bind_name = InputVerbGetBindingName(input_verb);
        
        skip_func = func;
    }
}