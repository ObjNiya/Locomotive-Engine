function create_input_prompt(verb)
{
    if (instance_exists(obj_input_prompt) && obj_input_prompt.parent_id == id)
        exit;
    
    var icon = spr_keyboard_icons;
    
    verb = InputVerbGetBindingName(verb);
    
    if (!is_undefined(global.keybrd_sp_prompts_map[? verb]))
    {
        verb = global.keybrd_sp_prompts_map[? verb];
        icon = spr_keyboard_special_icons;
    }
}