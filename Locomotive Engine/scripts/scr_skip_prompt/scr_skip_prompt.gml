function create_skip_prompt(verb, func, x = 16, y = GAME_HEIGHT - 48)
{
    if (!InputPressed(verb))
        return noone;
    if (instance_exists(obj_skip_prompt) && !obj_skip_prompt.fade_out)
        return noone;
    
    with (obj_skip_prompt)
        instance_destroy();
    
    with (instance_create(x, y, obj_skip_prompt))
    {
        xstart = x;
        self.x -= 24;
        
        image_alpha = 0.4;
        
        skip_txt = scribble("[spr_keyboard_icons] Skip");
        skip_txt.starting_format("spr_mediumfont", image_blend);
        skip_txt.align(fa_left, fa_top);
        skip_txt.blend(image_blend, image_alpha);
        
        skip_bind_txt = scribble(InputVerbGetBindingName(verb));
        skip_bind_txt.starting_format("spr_signfont", image_blend);
        skip_bind_txt.align(fa_left, fa_top);
        skip_bind_txt.blend(image_blend, image_alpha);
        
        input_verb = verb;
        skip_func = func;
        
        return id;
    }
}